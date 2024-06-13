defmodule PentoWeb.GameLive do
  use PentoWeb, :live_view
  import PentoWeb.GameLive.Component

  # def mount(%{"puzzle" => puzzle}, _session, socket) do
  #   {:ok, assign(socket, puzzle: puzzle)}
  # end

  def render(assigns) do
    ~H"""
    <section class="container">
      <h1 class="font-heavy text-3xl">Welcome to Pento!</h1>
      <%!-- <.canvas view_box="0 0 220 70">
      <.shape
        points={[{3, 2}, {4, 3}, {3, 3}, {4, 2}, {3, 4}]}
        fill="orange"
        name="p" />
      </.canvas> --%>

      <.palette shape_names={[:i, :l, :y, :n, :p, :w, :u, :v, :s, :f, :x, :t]} />
      <%!-- <.live_component module={Board} puzzle={@puzzle} id="game" /> --%>
    </section>
    <%!-- <svg viewBox="0 0 100 100">
      <defs>
        <rect id="point" width="10" height="10"/>
      </defs>
      <use xlink:href="#point" x="0" y="0" fill="blue" />
      <use xlink:href="#point" x="10" y="0" fill="green" />
      <use xlink:href="#point" x="0" y="10" fill="red" />
      <use xlink:href="#point" x="10" y="10" fill="violet" />
    </svg> --%>
    """
  end
end
