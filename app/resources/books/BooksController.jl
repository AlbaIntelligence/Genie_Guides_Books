module BooksController

using Debugger

struct Book
  title::String
  author::String
end

const BillGatesBooks = Book[
  Book("The Best We Could Do",                                    "Thi Bui"),
  Book("Evicted: Poverty and Profit in the American City",        "Matthew Desmond"),
  Book("Believe Me: A Memoir of Love, Death, and Jazz Chickens",  "Eddie Izzard"),
  Book("The Sympathizer",                                         "Viet Thanh Nguyen"),
  Book("Energy and Civilization, A History",                      "Vaclav Smil"),
]

function billgatesbooks()
  """
  <h1>Bill Gates' list of recommended books</h1>
  <ul>
    $([" <li>$(book.title) by $(book.author)</li> " for book in BillGatesBooks]...)
  </ul>
  """
end

using Genie.Renderer.Html
function billgatesbooks_gen()
  [
    Html.h1() do
      "Bill Gates' list of recommended books"
    end
    Html.ul() do
      for_each(BillGatesBooks) do book
        Html.li() do
          book.title * " by " * book.author
        end
      end
    end
  ]
end

function billgatesbooks_view_html()
  html(:books, :billgatesbooks, books = BillGatesBooks)
end

function billgatesbooks_view_html_admin()
  html(:books, :billgatesbooks, books = BillGatesBooks, layout = :admin)
end

function billgatesbooks_view_md()
  html(:books, "billgatesbooks.jl.md", books = BillGatesBooks)
end


# This is necessary to correct an outstanding issue described in [https://github.com/GenieFramework/Genie.jl/issues/397]().
using StructTypes
StructTypes.StructType(::Type{Book}) = StructTypes.Struct()

module API
using ..BooksController
using Genie.Renderer.Json

function billgatesbooks_view_json()
   json(BooksController.BillGatesBooks)
end

function billgatesbooks_view_json2()
   json(:books, :billgatesbooks, books = BooksController.BillGatesBooks)
end

end # Module API

end # Module BooksController

