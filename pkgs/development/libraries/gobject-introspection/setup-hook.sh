addGirPath()
{
    addToSearchPathWithCustomDelimiter : \
        NIX_GIR_PATH "$1/share/gir-1.0"
}

envHooks=(${envHooks[@]} addGirPath)
