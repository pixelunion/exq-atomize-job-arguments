defmodule Exq.Middleware.AtomizeJobArguments do
  @moduledoc """
  AtomizeJobArguments middleware converts the job arguments to be atoms
  instead of strings for types that AtomicMap supports.

  The lossy behaviour of atoms being converted to strings on deserialization
  is to be expected. Introducing this change directly to exq would cause
  backwards compatibility issues.
  """

  @behaviour Exq.Middleware.Behaviour

  alias Exq.Middleware.Pipeline

  def before_work(%Pipeline{assigns: %{job: job}} = pipeline) do
    atomized_arguments = AtomicMap.convert(job.args, %{safe: false})
    Pipeline.assign(pipeline, :job, %{job | args: atomized_arguments})
  end

  def after_processed_work(pipeline), do: pipeline
  def after_failed_work(pipeline), do: pipeline
end
