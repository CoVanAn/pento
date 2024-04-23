defmodule PentoWeb.ProductLive.Index do
  use PentoWeb, :live_view

  alias Pento.Catalog
  alias Pento.Catalog.Product

  @impl true
  # def mount(_params, _session, socket) do
  #   {:ok,   stream(socket, :products, Catalog.list_products())}
  # end
    def mount(_params, _session, socket) do
    {:ok,
    socket
     |> assign(:greeting, "Welcome to Pento!")
     |> stream(:products, Catalog.list_products())}
   end

  #assign: nhập giá trị cho các socket
  #stream: tạo một stream để theo dõi các sự kiện
  #stream(socket, :products, Catalog.list_products()): tạo một stream để theo dõi các sự kiện trên danh sách sản phẩm
  #handle_params: xử lý các tham số truyền vào
  #apply_action: áp dụng hành động cho socket
  #handle_info: xử lý thông tin
  #handle_event: xử lý sự kiện

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Product")
    |> assign(:product, Catalog.get_product!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Product")
    |> assign(:product, %Product{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Products")
    |> assign(:product, nil)
  end

  @impl true
  def handle_info({PentoWeb.ProductLive.FormComponent, {:saved, product}}, socket) do
    {:noreply, stream_insert(socket, :products, product)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    product = Catalog.get_product!(id)
    {:ok, _} = Catalog.delete_product(product)

    {:noreply, stream_delete(socket, :products, product)}
  end
end
