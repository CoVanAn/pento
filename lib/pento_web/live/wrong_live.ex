defmodule PentoWeb.WrongLive do
  use PentoWeb, :live_view

  # mount: khởi tạo cấu hình trạng thái ban đầu cho một phiên LiveView
  # assign: nhập giá trị cho các socket
  def mount(_param, session, socket) do
    {:ok,
     assign(socket,
       score: 0,
       message: "Guess a guess",
       session_id: session["live_socket_id"]
     )}
  end

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
    <h1 class="mb-4 text-4xl font-extrabold">Your score: <%= @score %></h1>
    <h2>
      <%= @message %>
      <br >​
      <%!-- It's <%= time() %> --%>
    </h2>
    <br />
    <h2>
      <%= for n <- 1..10 do %>
        <.link
          class="bg-blue-500 hover:bg-blue-700
           text-white font-bold py-2 px-4 border border-blue-700 rounded m-1"
          phx-click="guess"
          phx-value-number={n}
        >
          <%= n %>
        </.link>
      <% end %>
    </h2>
    <br />
    <pre>
      <%= @current_user.email %>
      <%= @session_id %>
    </pre>

    <br />
    <button phx-click="return" phx-disable-with="Restaring ...">
      Play again
    </button>
    """
  end

  def handle_event("guess", %{"number" => guess}, socket) do
    correct_answer = 5
    # message = ""
    # score = 0

    {message, score} =
      if String.to_integer(guess) == correct_answer do
        {"#{guess}. Correct! You win!", socket.assigns.score + 1}
        # message = "#{guess}. Correct! You win!"
        # score = socket.assigns.score + 1
      else
        {"Your guess: #{guess}. Wrong. Guess again", socket.assigns.score - 1}
        # message = "Your guess: #{guess}. Wrong. Guess again"
        # score = socket.assigns.score - 1
      end

    {:noreply, assign(socket, message: message, score: score)}
  end

  def handle_event("return", _parans, socket) do
    new_socket = return(socket)
    {:noreply, new_socket}
  end

  defp return(socket) do
    # Thực hiện thao tác cần thiết để khởi tạo lại trò chơi
    {:ok, assign(socket, score: 0, message: "Make a guess")}
  end

  def time() do
    DateTime.utc_now() |> to_string
  end
end
