defmodule Plugs.AddDogos do
  import Plug.Conn

  def init([]), do: false

  def call(conn, _opts) do
    doggies = [
      "/images/logo-annoyed.svg",
      "/images/logo-cool.svg",
      "/images/logo-dead.svg",
      "/images/logo-funny.svg",
      "/images/logo-happy.svg",
      "/images/logo-kawaii.svg",
      "/images/logo-love.svg",
      "/images/logo-neutral.svg",
      "/images/logo-surprised.svg"]

    Map.put(conn, :dogos, doggies)
  end
end
