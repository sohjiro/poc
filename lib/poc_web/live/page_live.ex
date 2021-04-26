defmodule PocWeb.PageLive do
  use PocWeb, :live_view

  alias Poc.Profile
  alias Poc.Profile.User

  @impl true
  def mount(_params, _session, socket) do
    user = %User{}
    changeset = Profile.change_user(user)
    {:ok, assign(socket, user: %User{}, changeset: changeset, show_user: "show", show_address: "", show_preview: "")}
  end

  @impl true
  def handle_info({:validate_user, _changeset}, socket) do
    {:noreply, assign(socket, show: "user", show_address: "")}
  end

  @impl true
  def handle_event("save-everything", params, socket) do
    IO.inspect params, label: "params"
    IO.inspect socket.assigns, label: "assigns"
    IO.inspect socket.assigns.changeset, label: "changeset"
    {:noreply, socket}
  end

  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset =
      socket.assigns.user
      |> Profile.change_user(user_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("show_address", _params, socket) do
    {:noreply, assign(socket, show_user: "", show_address: "show", show_preview: "")}
  end

  def handle_event("show_user", _params, socket) do
    {:noreply, assign(socket, show_user: "show", show_address: "", show_preview: "")}
  end

  def handle_event("show_preview", _params, socket) do
    {:noreply, assign(socket, show_user: "", show_address: "", show_preview: "show")}
  end

end
