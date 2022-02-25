defmodule Selectable.MixProject do
  use Mix.Project

  def project do
    version = version()

    [
      app: :selectable,
      version: version,
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      consolidate_protocols: Mix.env() != :test,
      deps: deps(),
      package: package(version),
      # docs
      name: "Selectable",
      source_url: "https://github.com/coingaming/selectable/tree/v#{version}",
      homepage_url: "https://github.com/coingaming/selectable/tree/v#{version}"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp version do
    case File.read("VERSION") do
      {:ok, version} -> String.trim(version)
      {:error, _} -> "0.0.0-development"
    end
  end

  defp package(version) do
    [
      organization: "coingaming",
      licenses: ["UNLICENSED"],
      files: ["lib", "mix.exs", "README.md", "VERSION"],
      links: %{
        "GitHub" => "https://github.com/coingaming/selectable/tree/v#{version}"
      }
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: [:dev, :test], runtime: false},
    ]
  end
end
