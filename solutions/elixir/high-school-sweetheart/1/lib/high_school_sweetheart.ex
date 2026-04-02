defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name
    |> String.trim()
    |> String.first()
  end

  def initial(name) do
    val = first_letter(name)
    |> String.upcase() 
    val <> "."
  end

  def initials(full_name) do
    val = full_name
    |> String.split(" ")
    initial(List.first(val)) <> " " <> initial(List.last(val))
  end

  def pair(full_name1, full_name2) do
    name1 = initials(full_name1)
    name2 = initials(full_name2)
    """
    ❤-------------------❤
    |  #{name1}  +  #{name2}  |
    ❤-------------------❤
    """
  end
end
