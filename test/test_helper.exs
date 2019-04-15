Application.ensure_all_started(:mimic)
Mimic.copy(:hackney)
ExUnit.start()
