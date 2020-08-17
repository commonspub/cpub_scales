defmodule CommonsPub.Scales.MixProject do
  use Mix.Project

  def project do
    [
      app: :cpub_scales,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: [ {:pointers, "~> 0.3"} ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

end
