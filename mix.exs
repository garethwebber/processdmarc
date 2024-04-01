defmodule ProcesDmarc.MixProject do
  use Mix.Project

  @version "0.0.1"
  @repo_url "https://github.com/garethwebber/processdmarc"

  def project do
    [
      app: :process_dmarc,
      escript: escript_config(),
      version: @version,
      elixir: "~> 1.16",
      elixirc_paths: elixirc_paths(Mix.env()),
      name: "Process DMARC",
      source_url: @repo_url,
      start_permanent: Mix.env() == :prod,
      test_coverage: [summary: [threshhold: 80], ignore_modules: test_exclusions()],
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      description: "Process DMARC",
      maintainers: ["Gareth Webber"],
      licenses: ["GPL-3.0"],
      links: %{"GitHub" => @repo_url},
      files: ~w(lib mix.exs *.md)
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.31", only: :dev, runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:esbuild, "~> 0.8", runtime: Mix.env() == :dev},
      {:yugo, ">= 0.0.0"}
    ]
  end

  defp escript_config do
    [
      # This is the run module for command-line
      main_module: TowerHanoi
    ]
  end

  defp test_exclusions do
    [
      # remove phx.new created files from test coverage stats 
      TowerHanoi
    ]
  end

  defp docs do
    [
      # Add the following files into the documents create by mix docs
      extras: ["README.md", "LICENSE"],
    ]
  end

end
