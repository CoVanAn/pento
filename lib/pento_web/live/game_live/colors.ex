defmodule PentoWeb.GameLive.Colors do
  def color(c), do: color(c, false, false)

  def color(_color, true, _completed) do
    "#B86EF0"
  end

  def color(_color, _active, true) do
    "000000"
  end

  def color(:green, _active, _completed), do: "#8BBF57"
  def color(:dark_green, _active, _completed), do: "#689042"
  def color(:light_green, _active, _completed), do: "#C1D6AC"
  def color(:orange, _active, _completed), do: "#F9A03F"
  def color(:dark_orange, _active, _completed), do: "#E88D2C"
  def color(:light_orange, _active, _completed), do: "#F9C98B"
  def color(:blue, _active, _completed), do: "#4A90E2"
  def color(:dark_blue, _active, _completed), do: "#2F6ABD"
  def color(:light_blue, _active, _completed), do: "#A9C9F2"
  def color(:purple, _active, _completed), do: "#B86EF0"
  def color(:gray, _active, _completed), do: "#D8D8D8"
  def color(:dark_gray, _active, _completed), do: "#A0A0A0"
  def color(:light_gray, _active, _completed), do: "#E0E0E0"

end
