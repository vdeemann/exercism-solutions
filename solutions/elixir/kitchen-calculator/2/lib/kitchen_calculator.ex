defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    {_, number} = volume_pair
    number
  end

  def to_milliliter({:milliliter, volume}) do
    {:milliliter, 1 * volume}
  end
  def to_milliliter({:cup, volume}) do
    {:milliliter, 240 * volume}
  end  
  def to_milliliter({:fluid_ounce, volume}) do
    {:milliliter, 30 * volume}
  end 
  def to_milliliter({:teaspoon, volume}) do
    {:milliliter, 5 * volume}
  end 
  def to_milliliter({:tablespoon, volume}) do
    {:milliliter, 15 * volume}
  end 

  def from_milliliter(volume_pair, :milliliter) do
    {_, volume} = volume_pair
    {:milliliter, volume}
  end
  def from_milliliter(volume_pair, :cup) do
    {_, volume} = volume_pair
    {:cup, volume / 240 }
  end
  def from_milliliter(volume_pair, :fluid_ounce) do
    {_, volume} = volume_pair
    {:fluid_ounce, volume / 30 }
  end
  def from_milliliter(volume_pair, :teaspoon) do
    {_, volume} = volume_pair
    {:teaspoon, volume / 5 }
  end
  def from_milliliter(volume_pair, :tablespoon) do
    {_, volume} = volume_pair
    {:tablespoon, volume / 15 }
  end
  
  def convert({_, teaspoon_volume} = volume_pair, :tablespoon) do
    # 3 teaspoons = 1 tablespoon
    {_, volume_result} = from_milliliter(volume_pair, :teaspoon)
    {:tablespoon, teaspoon_volume / volume_result}
  end
  def convert({_, cup_volume}, :fluid_ounce) do
    # multiply the volume value by 8
    {_, volume1} = to_milliliter({:cup, 1})
    {_, volume2} = to_milliliter({:fluid_ounce, 1})
    {:fluid_ounce, ((volume1 / volume2) * cup_volume)}
  end
  def convert({_, fluid_ounce_volume}, :teaspoon) do
    {_, volume1} = to_milliliter({:fluid_ounce, 1})
    {_, volume2} = to_milliliter({:teaspoon, 1})
    {:teaspoon, ((volume1 / volume2) * fluid_ounce_volume)}
  end
  def convert({_, tablespoon_volume}, :cup) do
    {_, volume1} = to_milliliter({:tablespoon, 1})
    {_, volume2} = to_milliliter({:cup, 1})
    {:cup, ((volume1 / volume2) * tablespoon_volume)}
  end
end
