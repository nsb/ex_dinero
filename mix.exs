defmodule ExDinero.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_dinero,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Elixir Api client for danish accounting service Dinero.",
      source_url: "https://github.com/nsb/ex_dinero"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 3.0"},
      {:jason, "~> 1.1"},
      {:httpoison, "~> 1.4"},
      {:mimic, "~> 0.3", only: :test}
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
