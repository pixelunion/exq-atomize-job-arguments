defmodule Exq.Test.Middleware.AtomizeJobArgumentsTest do
  use ExUnit.Case

  alias Exq.Middleware.AtomizeJobArguments
  alias Exq.Middleware.Pipeline

  @pipeline %Pipeline{
    assigns: %{
      job: %{
        args: [
          %{"destination" => "webhook", "action" => "testing", "object" => %{"foo" => "bar"}}
        ]
      }
    }
  }

  test "should convert map keys in job arguments to atoms" do
    results = AtomizeJobArguments.before_work(@pipeline)

    expected = %Pipeline{
      assigns: %{
        job: %{args: [%{action: "testing", destination: "webhook", object: %{foo: "bar"}}]}
      }
    }

    assert(results == expected)
  end
end
