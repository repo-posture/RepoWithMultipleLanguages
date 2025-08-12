defmodule SbomTest.MixProject do
  use Mix.Project

  def project do
    [
      app: :sbom_test,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.7"},
      {:phoenix_live_view, "~> 0.18.18"},
      {:ecto_sql, "~> 3.10"},
      {:postgrex, "~> 0.17.1"},
      {:jason, "~> 1.4"},
      {:plug_cowboy, "~> 2.6"},
      {:httpoison, "~> 2.1"},
      {:ex_doc, "~> 0.29", only: :dev, runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test]},
      {:excoveralls, "~> 0.16", only: :test}
    ]
  end
end
