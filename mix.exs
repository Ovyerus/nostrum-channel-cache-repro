defmodule Repro.MixProject do
  use Mix.Project

  def project do
    [
      app: :repro,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: []
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Repro, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nostrum,
       git: "https://github.com/Kraigie/nostrum", rev: "4fabfc5bf59878fdde118acd686f6a5e075b5f8e"},
    ]
  end

end
