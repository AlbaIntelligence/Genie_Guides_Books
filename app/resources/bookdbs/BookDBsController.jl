module BookDBsController

using Revise, Debugger

using Genie.Renderer.Html, SearchLight, BookDBs

function billgatesbookdbs_sqlite()
  html(:bookdbs, :billgatesbooks, bookdbs = all(BookDB))
end

function intermediate_new()
  html(:bookdbs, :intermediate_form_new)
end

function intermediate_create()
  BookDB(title = params(:book_title), author = params(:book_author)) |> save &&
    redirect(:bgbooks_db_view_json)
end


using Genie.Router, Genie.Renderer
function intermediate_new_cover()
  html(:bookdbs, :intermediate_form_new_cover)
end

using Genie.Requests # to import filespayload()
function intermediate_create_cover()
  if haskey(filespayload(), "book_cover")
    load_name = String(filespayload("book_cover").name)

    web_path = joinpath("img/covers", load_name)
    storage_path = joinpath("public/img/covers", load_name)

    # !!!! Please make sure that you create the folder `covers/` within `public/img/`
    open(storage_path; write = true, truncate = true) do f
      write(f, IOBuffer(filespayload("book_cover").data))
    end
  else
    web_path = ""
  end

  BookDB(title = params(:book_title), author = params(:book_author), cover = web_path) |>
    save && redirect(:bgbooks_db_view_json)
end

function get_cover_path(bookdb::BookDB; default_path = "../img/genie/docs.png")
  if isempty(bookdb.cover)
    return default_path
  else
    return "../" * bookdb.cover
  end
end

function intermediate_view_all_covers()
  Debugger.@bp
  html(:bookdbs, :intermediate_view_all_covers, bookdbs = all(BookDB))
end


function intermediate_edit()
end

function intermediate_update()
end


function intermediate_view_all_covers_gen()
  [
    Html.h1(htmlsourceindent = "2") do
      ["""Bill's Gates top $( length(:bookdbs) ) recommended books with cover pictures"""]
    end

    Html.ul(htmlsourceindent = "2") do
      [
        for_each(bookdbs) do bookdb
          Html.li(htmlsourceindent = "3") do
            [
              Html.img(
                  src = isempty(bookdb.cover) ? "/img/genie/docs.png" : "/" * bookdb.cover,
                  htmlsourceindent = "4",
                  width = "100px"
              )

              """ $(bookdb.title) by $(bookdb.author) """
            ]
          end
        end
      ]
    end
  ]
end


module API
using ..BookDBsController
using Genie.Renderer.Json, SearchLight, BookDBs

function billgatesbookdbs_view_sqlite()
  json(:bookdbs, :billgatesbookdbs_sqlite, bookdbs = all(BookDB))
end
end # module API

end # module BookDBsController

