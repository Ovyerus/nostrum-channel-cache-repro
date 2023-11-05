import Config

config :nostrum,
  token: System.fetch_env!("NOSTRUM_REPRO_TOKEN")
