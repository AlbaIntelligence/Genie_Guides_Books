using Genie.Router
using BooksController

route("/") do
  serve_static_file("welcome.html")
end

route("/hello") do
  "Hello. Welcome to Genie!"
end

route("/bgbooks") do
  BooksController.billgatesbooks()
end

route("/bgbooks_gen") do
  BooksController.billgatesbooks_gen()
end

route("/bgbooks_view_html") do
  BooksController.billgatesbooks_view_html()
end

route("/bgbooks_view_html_admin") do
  BooksController.billgatesbooks_view_html_admin()
end

route("/bgbooks_view_md") do
  BooksController.billgatesbooks_view_md()
end

route("/api/v1/bgbooks") do
  BooksController.API.billgatesbooks_view_json()
end

route("/api/v2/bgbooks") do
  BooksController.API.billgatesbooks_view_json2()
end

