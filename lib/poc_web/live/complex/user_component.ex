defmodule PocWeb.Complex.UserComponent do
  use PocWeb, :live_component

  alias Poc.Profile
  alias Poc.Profile.User

  @impl true
  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset =
      socket.assigns.user
      |> Profile.change_user(user_params)
      |> Map.put(:action, :validate)

    send self(), {:validate_user, changeset}
    {:noreply, socket}
  end


end
