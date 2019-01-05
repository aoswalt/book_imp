defmodule BookImp do
  @moduledoc """
  Documentation for BookImp.
  """

  @doc """
  Tokenize a message.

      iex> BookImp.tokenize("command thing \\"quoted group\\" more")
      ["command", "thing", "quoted group", "more"]
  """
  def tokenize(message) do
    :world
  end

  defp split_next(<<"\"", _ :: binary >> = string) do
    [_, quoted, rest] = Regex.run(~r/"([^"]*)"(.*)/, string)
    {String.trimp(quoted), String.trim(rest)}
  end

  defp split_next(string) do
    [_, arg, rest] = Regex.run(~r/(\S+)\s(.*)/, string)
    {arg, String.trim(rest)}
  end
end
