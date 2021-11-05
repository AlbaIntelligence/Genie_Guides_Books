using Revise

pwd() == joinpath(@__DIR__, "bin") && cd(@__DIR__) # allow starting app from bin/ dir

using Genie, DemoBooks
DemoBooks.main()

# Genie.up(8009, "127.0.0.1"; async=false )
