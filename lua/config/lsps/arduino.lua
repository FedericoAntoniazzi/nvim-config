local arduino = {}

function arduino.setup(on_attach, capabilities, flags)
  require('lspconfig').arduino_language_server.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = flags,

    settings = {
      cmd = {
        "arduino-language-server",
        "-cli", "arduino-cli",
        "-cli-config", "~/.arduino15/arduino-cli.yaml",
        "-clangd", "clangd",
        "-fqbn", "esp8266:esp8266:nodemcuv2"
      }
    }
  }
end

return arduino
