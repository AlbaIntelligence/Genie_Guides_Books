module CreateTableBookDBs

import SearchLight.Migrations: create_table, column, primary_key, add_index, drop_table

function up()
  create_table(:bookdbs) do
    [
      primary_key()
      column(:title, :string, limit = 100)
      column(:author, :string, limit = 100)
    ]
  end

  add_index(:bookdbs, :title)
  add_index(:bookdbs, :author)
end

function down()
  drop_table(:bookdbs)
end

end
