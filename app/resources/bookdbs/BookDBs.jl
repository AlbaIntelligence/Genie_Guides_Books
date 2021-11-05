module BookDBs

import SearchLight: AbstractModel, DbId, save!

# @kwdef is not exported by Base and, theoretically, should not be used since it is an internal symbol.
# If you want, you could instead use the @with_kw macro from the Parameters.jl package.
import Base: @kwdef

export BookDB

@kwdef mutable struct BookDB <: AbstractModel
  id::DbId = DbId()
  title::String = ""
  author::String = ""
end

function seed()
  BillGatesBooks = [
    ("The Best We Could Do", "Thi Bui"),
    ("Evicted: Poverty and Profit in the American City", "Matthew Desmond"),
    ("Believe Me: A Memoir of Love, Death, and Jazz Chickens", "Eddie Izzard"),
    ("The Sympathizer!", "Viet Thanh Nguyen"),
    ("Energy and Civilization, A History", "Vaclav Smil")
  ]

  for b in BillGatesBooks
    BookDB(title = b[1], author = b[2]) |> save!
  end
end

end  # module BookDBs
