# chat-bridge

An  irc &lt;=> slack chat bridge

## Bridges

- #dokku: the dokku chatroom
  - slack (#dokku): enabled
  - irc (#dokku): enabled

## Adding a new bridge

- Add the `dokku-bot` app on slack to the channel.
- Ensure the `dokku-bot` user on irc can join the channel.
- Add a new stanza like so to the `matterbridge.toml.sigl`:
    ```
    [[gateway]]
    name   = "$CHANNEL_ALIAS"
    enable = true

    [[gateway.inout]]
    account = "irc.freenode"
    channel = "$IRC_CHANNEL_NAME_WITHOUT_HASH"

    [[gateway.inout]]
    account = "slack.dokku"
    channel = "$SLACK_CHANNEL_NAME_WITHOUT_HASH"
    ```
- In the previously added `gateway` stanza, ensure the following are changed (using `#lollipop` as the example channel name on both discord and slack):
    - `$CHANNEL_ALIAS`: should be `lollipop`
    - `$IRC_CHANNEL_NAME_WITHOUT_HASH`: should be `#lollipop`
    - `$SLACK_CHANNEL_NAME_WITHOUT_HASH`: should be `lollipop`
- Deploy with the new bridge settings.
