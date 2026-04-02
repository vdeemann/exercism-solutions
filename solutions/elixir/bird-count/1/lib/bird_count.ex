defmodule BirdCount do
  def today([]), do: nil
  def today(list) do
    [head | _tail] = list
    head
  end

  def increment_day_count([]), do: [1]
  def increment_day_count(list) do
    [head | tail] = list
    [head + 1 | tail]
  end

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?(list) do
    [head | tail] = list
    cond do
      head == 0 -> true
      true -> has_day_without_birds?(tail)
    end
  end

  def total([]), do: 0
  def total(list) do
    [head | tail] = list
    head + total(tail)
  end

  def busy_days([]), do: 0
  def busy_days(list) do
    [head | tail] = list
    cond do
      head >= 5 -> 1 + busy_days(tail)
      true -> busy_days(tail)
    end
  end
end
