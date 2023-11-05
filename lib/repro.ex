defmodule Repro do
  @moduledoc """
  The Repro application.
  """
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Repro.Consumer
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
