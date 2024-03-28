import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :browser, BrowserWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "zGPcHsfUavd+6R/hFFu7NrJ+dR5hVBzxoZaCD3EiK8K3qYw/DlUrXzATh2FRFkeB",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
