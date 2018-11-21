{ kythe, writeScriptBin}: pluginOutput:
writeScriptBin "serve-index" ''
 ${kythe}/bin/http_server \
  --public_resources ${kythe}/web/ui \
  --listen localhost:8080 \
  --serving_table ${pluginOutput}/tables
''

