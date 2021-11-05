using Genie.Router
using BooksController

########################################################################################
#
# Working With Genie Apps: Beginning
#
########################################################################################


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


########################################################################################
#
# Working With Genie Apps - Using a database
#
########################################################################################

using BookDBsController

route("/api/v3/bgbookdbs",
  BookDBsController.API.billgatesbookdbs_view_sqlite;
  method = GET,
  named = :bgbooks_db_view_html
)

########################################################################################
#
# Working With Genie Apps: Intermediate Topics
#
########################################################################################

route(
  "/bgbook_db_intermediate/new",
  BookDBsController.new_intermediate;
  method = GET,
  named = :new_intermediate)

route(
  "/bgbook_db_intermediate/create",
  BookDBsController.create_intermediate;
  method = POST,
  named = :create_intermediate)

