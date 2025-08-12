defmodule SbomTest.Application do
  @moduledoc """
  SBOM Test Elixir Application
  """
  use Application

  def start(_type, _args) do
    # Define children process for supervision
    children = [
      {Plug.Cowboy, scheme: :http, plug: SbomTest.Router, options: [port: 4000]},
      {SbomTest.Cache, []}
    ]

    opts = [strategy: :one_for_one, name: SbomTest.Supervisor]
    
    IO.puts("Starting SBOM Test Elixir application on port 4000")
    Supervisor.start_link(children, opts)
  end
end

defmodule SbomTest.Cache do
  @moduledoc """
  Simple GenServer for caching data
  """
  use GenServer

  # Client API
  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def get(key) do
    GenServer.call(__MODULE__, {:get, key})
  end

  def put(key, value) do
    GenServer.cast(__MODULE__, {:put, key, value})
  end

  # Server Callbacks
  def init(state) do
    {:ok, state}
  end

  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end
end

defmodule SbomTest.Router do
  @moduledoc """
  HTTP Router for the application
  """
  use Plug.Router
  
  plug Plug.Logger
  plug :match
  plug Plug.Parsers, parsers: [:json], json_decoder: Jason
  plug :dispatch

  # Routes
  get "/" do
    send_resp(conn, 200, "SBOM Test Elixir App is running!")
  end

  get "/api/users" do
    users = [
      %{id: 1, name: "Alice", email: "alice@example.com"},
      %{id: 2, name: "Bob", email: "bob@example.com"},
      %{id: 3, name: "Charlie", email: "charlie@example.com"}
    ]

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(users))
  end

  get "/api/status" do
    status = %{
      status: "OK",
      timestamp: DateTime.utc_now() |> DateTime.to_iso8601()
    }

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(status))
  end

  get "/api/external" do
    case HTTPoison.get("https://jsonplaceholder.typicode.com/posts/1") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, body)

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        send_resp(conn, 500, "Failed to fetch external data: #{status_code}")

      {:error, %HTTPoison.Error{reason: reason}} ->
        send_resp(conn, 500, "Error: #{inspect(reason)}")
    end
  end

  get "/api/cache/:key" do
    value = SbomTest.Cache.get(key)

    if value do
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, Jason.encode!(%{key: key, value: value}))
    else
      send_resp(conn, 404, "Key not found")
    end
  end

  post "/api/cache/:key" do
    {:ok, body, conn} = read_body(conn)
    params = Jason.decode!(body)
    SbomTest.Cache.put(key, params["value"])

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(201, Jason.encode!(%{status: "ok", key: key}))
  end

  match _ do
    send_resp(conn, 404, "Not found")
  end
end
