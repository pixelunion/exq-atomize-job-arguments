defmodule ExqAtomizeJobArguments.MixProject do
  use Mix.Project

  def project do
    [
      app: :exq_atomize_job_arguments,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:atomic_map, "~> 0.8"},
      {:exq, "~> 0.12.0"},
      {:credo, "~> 0.3", only: [:dev, :test]}
    ]
  end
end
