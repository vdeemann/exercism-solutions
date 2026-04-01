defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language] ++ list
  end

  def remove(list) do
    [head | tail] = list
    list = tail
  end

  def first(list) do
    [head | tail] = list
    head
  end

  def count(list) do
    cond do
      list == [] -> 0
      true -> 1 + count(remove(list)) 
    end
  end

  def functional_list?(list) do
    cond do
      true -> "Elixir" in list
    end
  end
end
