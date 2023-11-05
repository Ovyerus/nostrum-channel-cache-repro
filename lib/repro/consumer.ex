defmodule Repro.Consumer do
  use Nostrum.Consumer
  require Logger

  alias Nostrum.{Api, Cache.ChannelCache}

  # def start_link, do: Nostrum.Consumer.start_link(__MODULE__, max_restarts: 0)

  @spec handle_event(Nostrum.Consumer.event()) :: any()
  def handle_event(_event)

  def handle_event({:READY, _, _}) do
    Logger.info("Ready to test!")
  end

  def handle_event({:MESSAGE_CREATE, msg, _}) do
    case msg.content do
      "!!repro here" <> _ ->
        Logger.info("Found message in #{msg.channel_id}")
        # This shouldn't be failing...
        ch = ChannelCache.get!(msg.channel_id)
        IO.inspect(ch)
        Api.create_message(msg, "You are in #{ch.name}")

      "!!repro find " <> id ->
        case Nostrum.Snowflake.cast(id) do
          :error ->
            Api.create_message(msg, "Thats not a snowflake")

          {:ok, id} ->
            ch = ChannelCache.get!(id)
            IO.inspect(ch)
            Api.create_message(msg, "That is #{ch.name}")
        end

      "!!repro count" <> _ ->
        all = :ets.match(ChannelCache.ETS.table(), {"$1"})
        IO.inspect(all)
        # This should not be 0
        Api.create_message(msg, "There are #{length(all)} channels in cache")

      _ ->
        :noop
    end
  end

  def handle_event(_), do: :noop
end
