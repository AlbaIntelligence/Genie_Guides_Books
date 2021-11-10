module AddCoverColumn

import SearchLight.Migrations: add_column, add_index

# SQLite does not support column removal so the `remove_column` method is not implemented
# in the SearchLightSQLite adapter. If using SQLite do not add the following import
# import SearchLight.Migrations: remove_column

function up()
  add_column(:bookdbs, :cover, :string)
end

function down()
  # You can uncomment the next line if not using the SQLite backend
  # remove_column(:books, :cover)
end

end
