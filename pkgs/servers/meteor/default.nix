{ stdenv, lib, fetchzip, zlib }:

let
  bootstrap = fetchzip {
    url = "https://d3sqy0vbqsdhku.cloudfront.net/packages-bootstrap/1.2.0.1/meteor-bootstrap-os.linux.x86_64.tar.gz";
    sha256 = "0chx5rdjn8r3rbgg53ibcaxrxfpv25d34gv226qbbkzqw9a4j7ca";
  };
in

# TODO: patch/purify tools/runners/run-mongo.js

stdenv.mkDerivation rec {
  name = "meteor-${version}";
  version = "1.2.0.1";

  dontStrip = true;

  buildInputs = [
  ];

  unpackPhase = ''
    true
  '';

  installPhase = ''
    shopt -s globstar
    mkdir $out

    cp -r ${bootstrap}/.meteor/packages $out
    chmod -R +w $out/packages

    cp -r ${bootstrap}/.meteor/package-metadata $out
    chmod -R +w $out/package-metadata

    devBundle=$(find $out/packages/meteor-tool -name dev_bundle)
    ln -s $devBundle $out/dev_bundle

    toolsDir=$(dirname $(find $out/packages -print | grep "meteor-tool/.*/tools/index.js$"))
    ln -s $toolsDir $out/tools

    node=$devBundle/bin/node
    patchelf \
      --set-interpreter $(cat $NIX_CC/nix-support/dynamic-linker) \
      --set-rpath "$(patchelf --print-rpath $node):${stdenv.cc.cc}/lib" \
      $node

    for p in $devBundle/mongodb/bin/mongo{,d}; do
      patchelf \
        --set-interpreter $(cat $NIX_CC/nix-support/dynamic-linker) \
        --set-rpath "$(patchelf --print-rpath $p):${stdenv.cc.cc}/lib:${zlib}/lib" \
        $p
    done

    for p in $out/**/*.node; do
      patchelf \
        --set-rpath "$(patchelf --print-rpath $p):${stdenv.cc.cc}/lib" \
        $p
    done

    mkdir -p $out/bin
    cat << EOF > $out/bin/meteor
    #!${stdenv.shell}

    if [[ ! -f \$HOME/.meteor/package-metadata/v2.0.1/packages.data.db ]]; then
      mkdir -p \$HOME/.meteor/package-metadata/v2.0.1
      cp $out/package-metadata/v2.0.1/packages.data.db "\$HOME/.meteor/package-metadata/v2.0.1"
      chown "\$(whoami)" "\$HOME/.meteor/package-metadata/v2.0.1/packages.data.db"
      chmod +w "\$HOME/.meteor/package-metadata/v2.0.1/packages.data.db"
    fi

    $node \''${TOOL_NODE_FLAGS} $out/tools/index.js "\$@"
    EOF
    chmod +x $out/bin/meteor
  '';

  meta = with lib; {
    description = "Complete open source platform for building web and mobile apps in pure JavaScript";
    homepage = "meteor.com";
    license = licenses.mit;
    platforms = platforms.linux;
    platforms = [ "x86_64-linux" ];
    maintainers = with maintainers; [ cstrahan ];
  };
}
