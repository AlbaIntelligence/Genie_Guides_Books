module BookDBsController

using Genie.Renderer.Html, SearchLight, BookDBs

function billgatesbookdbs_sqlite()
  html(:bookdbs, :billgatesbooks, bookdbs = all(BookDB))
end

function new_intermediate()
  html(:bookdbs, :view_new_intermediate)
end

using Genie.Router, Genie.Renderer

function create_intermediate()
  BookDB(title = params(:book_title), author = params(:book_author)) |> save && redirect(:bgbooks_db_view_html)
end


module API
using ..BookDBsController
using Genie.Renderer.Json, SearchLight, BookDBs

function billgatesbookdbs_view_sqlite()
  json(:bookdbs, :billgatesbookdbs_sqlite, bookdbs = all(BookDB))
end
end # module API

end # module BookDBsController

