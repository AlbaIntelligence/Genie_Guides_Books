<!-- app/resources/books/views/billgatesbooks.jl.md -->
# Bill Gates' $(length(books)) recommended books

$(
  for_each(books) do book
    "* $(book.title) by $(book.author) \n"
  end
)
