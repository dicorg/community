defmodule Community.RuntimeConfig do
  # use Bonfire.Common.Localise

  @behaviour Bonfire.Common.ConfigModule
  def config_module, do: true

  @doc """
  Sets runtime configuration for the extension (typically by reading ENV variables).
  """
  def config do
    import Config

    member_links =
      [
        Website: "https://digitalintimacycoalition.org",
        Notion: System.get_env("DIC_MEMBER_NOTION_URL")
      ]
      |> Enum.filter(fn {_, url} -> is_binary(url) and url != "" end)

    config :bonfire, :ui, theme: [member_links: member_links]
  end
end
