using Pkg
Pkg.activate(".")
Pkg.develop("Genie")

using Revise
using Genie, SearchLight

using DemoBooks

DemoBooks.main()

Genie.up(8009, "127.0.0.1"; async = true, open_browser = true)
