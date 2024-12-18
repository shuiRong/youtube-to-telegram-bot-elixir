defmodule YouTubeBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :youtube_bot,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {YouTubeBot.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  def deps do
    [
      {:ex_gram, "~> 0.53"},
      {:jason, ">= 1.0.0"},
      {:req, "~> 0.5.7"},
      {:tesla, "~> 1.2"},
      {:hackney, "~> 1.12"},
      {:quantum, "~> 3.0"}
    ]
  end
end
