defmodule HighScore do
  def new() do
    %{}
  end

  @initial_value 0
  
  def add_player(scores, name, score \\ @initial_value) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  # Map.put unconditionally sets the value to @default_score. Whether name exists or not, the result is the same — it gets that exact value.
  # Map.update is conditional. If name doesn't exist, it inserts @initial_value. If it does exist, it runs the function &(&1 * @initial_value) — multiplying the current value by @initial_value. That's not really a "reset" — it's a transformation of the existing score.
  # So the first version is a true reset (replace with a known default), while the second version only acts like a reset for new keys. For existing keys, it's doing math on the current value, which seems like a bug if the intent is to reset.
  # If you genuinely want to reset to a fixed value in both cases, Map.put/3 is the right choice. Use Map.update/4 when you need different behavior for "key missing" vs. "key present."
  def reset_score(scores, name) do
    Map.update(scores, name, @initial_value, &(&1 * @initial_value))
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, &(&1 + score))
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
