function isgdc()

    define fename string
    call ui.interface.frontcall("standard", "feinfo", ["fename"], [fename])
    return fename == "Genero Desktop Client"

end function
