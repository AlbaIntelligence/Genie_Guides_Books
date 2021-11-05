using Pkg
Pkg.activate(".")

using Genie, SearchLight, DemoBooks

DemoBooks.main()
Genie.up(8009, "127.0.0.1")
