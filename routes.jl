using Revise, Debugger
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
  named = :bgbooks_db_view_json
)

########################################################################################
#
# Working With Genie Apps: Intermediate Topics
#
########################################################################################

route(
  "/bgbook_db_intermediate/new",
  BookDBsController.intermediate_new;
  method = GET,
  named = :intermediate_new)

route(
  "/bgbook_db_intermediate/create",
  BookDBsController.intermediate_create;
  method = POST,
  named = :intermediate_create)

########################################################################################
#
# Working With Genie Apps: Intermediate Topics - With cover
#
########################################################################################

route(
  "/bgbook_db_intermediate/new_cover",
  BookDBsController.intermediate_new_cover;
  method = GET,
  named = :intermediate_new_cover
)

route(
  "/bgbook_db_intermediate/create_cover",
  BookDBsController.intermediate_create_cover;
  method = POST,
  named = :intermediate_create_cover
)

route("/bgbook_db_intermediate/view_all_covers",
  BookDBsController.intermediate_view_all_covers;
  method = GET,
  named = :intermediate_view_all_covers
)

route(
  "/bgbook_db_intermediate/view_all_covers_gen",
  BookDBsController.intermediate_view_all_covers_gen;
  method = GET,
  named = :intermediate_view_all_covers_gen
)

route(
  "/bgbook_db_intermediate/:id::Int/edit",
  BookDBsController.intermediate_edit;
  method = GET,
  named = :intermediate_edit_book
)

route(
  "/bgbook_db_intermediate/:id::Int/update",
  BooksController.intermediate_update;
  method = POST,
  named = :intermediate_update_book
)




