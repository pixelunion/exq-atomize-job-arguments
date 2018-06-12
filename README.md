# ExqAtomizeJobArguments

AtomizeJobArguments middleware converts the job arguments to be atoms
instead of strings for types that AtomicMap supports.

The lossy behaviour of atoms being converted to strings on JSON deserialization
is to be expected. Introducing this change directly to exq would cause
backwards compatibility issues.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `exq_atomize_job_arguments` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:exq_atomize_job_arguments, "~> 0.1.0"}
  ]
end
```

After you've defined and fetched the dependency, you can inject the middleware into
by adding the module within the Exq configuration for your environment (or `config.exs`):

```elixir
config :exq,
  host: "127.0.0.1",
  port: 6379,
  middleware: [
    Exq.Middleware.Stats,
    Exq.Middleware.Job,
    Exq.Middleware.Manager,
    Exq.Middleware.Logger,
    Exq.Middleware.AtomizeJobArguments
  ]
```

## Documentation

The documentation can be found at [https://hexdocs.pm/exq_atomize_job_arguments](https://hexdocs.pm/exq_atomize_job_arguments).