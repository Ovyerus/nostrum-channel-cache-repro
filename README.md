# nostrum channel cache repro

Reproduction for bug with Nostrum ~0.9 where channel cache is unpopulated

## Steps

1. Use elixir & erlang versions as noted in [`.tool-versions`](./.tool-versions) (only really need to care about major/minor versions).
2. Set up `NOSTRUM_REPRO_TOKEN` environment variable with a test bot account token. (All intents are requested, and message content is required for this test).
3. Run with `iex -S mix`
4. Run `!!repro here` on a channel in Discord. Normally this would work but in this case it should spit out an error in logs about no match for the channel in cache.
5. Run `!!repro find <channel_id>`. This should have the same outcome as above.
6. Run `!!repro count`. This would be expected to output some number of channels in cache, but instead only outputs `0`.

Relevant code in [`./lib/repro/consumer.ex`](./lib/repro/consumer.ex).
