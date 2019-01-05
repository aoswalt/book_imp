defmodule BookImpTest do
  use ExUnit.Case
  doctest BookImp

  test "tokenizes a message" do
    assert BookImp.tokenize("") == {:error, ""}
    assert BookImp.tokenize("command") == {:ok, ["command"]}
    assert BookImp.tokenize("command arg") == {:ok, ["command", "arg"]}
    assert BookImp.tokenize("command arg \"quoted group\"") == {:ok, ["command", "arg", "quoted group"}
  end
end
