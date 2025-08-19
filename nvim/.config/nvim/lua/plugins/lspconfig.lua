return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'mason-org/mason.nvim',
      opts = {},
    },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'folke/which-key.nvim',
    'saghen/blink.cmp',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local function client_supports_method(client, method, bufnr)
          if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        require('which-key').register({
          l = {
            name = '󰚔 LSP',
            r = { vim.lsp.buf.rename, 'Rename symbol' },
            a = { vim.lsp.buf.code_action, 'Code action' },
            f = { vim.lsp.buf.format, 'Format buffer' },
          },
        }, { buffer = event.buf, prefix = '<leader>' })

        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = event.buf, desc = 'LSP: Hover documentation' })

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
        end
      end,
    })

    vim.diagnostic.config {
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      },
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }

          return diagnostic_message[diagnostic.severity]
        end,
      },
    }

    local servers = {
      ts_ls = {},

      cssls = {
        filetypes = {
          'scss',
          'sass',
        },
      },

      tailwindcss = {
        filetypes = {
          'html',
          'css',
          'javascript',
          'javascriptreact',
        },
        settings = {
          tailwindCSS = {
            files = {
              exclude = {
                '**/.git/**',
                '**/node_modules/**',
                '**/.hg/**',
                '**/.svn/**',
                '**/*.scss',
              },
            },
          },
        },
      },

      intelephense = {
        root_markers = { 'vendor', '.git', 'composer.json' },
        settings = {
          intelephense = {
            compatibility = {
              preferPsalmPhpstanPrefixedAnnotations = true,
            },
            completion = {
              suggestObjectOperatorStaticMethods = false,
            },
            environment = {
              phpVersion = (function()
                local default = '8.4.0'
                local cwd = vim.fn.getcwd()
                local composer_json = vim.fn.findfile('composer.json', cwd .. '/src;' .. cwd)

                if composer_json == '' then
                  return default
                end

                local file_contents = table.concat(vim.fn.readfile(composer_json), '\n')
                local config_values = vim.json.decode(file_contents)

                if config_values.require.php then
                  return config_values.require.php
                end

                if config_values.config.platform and config_values.config.platform.php then
                  return config_values.config.platform.php
                end

                return default
              end)(),
            },
            files = {
              maxSize = 5000000,
            },
            maxMemory = 4096,
            phpdoc = {
              returnVoid = false,
            },
            references = {
              exclude = {},
            },
            runtime = '/usr/local/bin/node',
          },
        },
      },

      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            diagnostics = {
              disable = {
                'missing-fields',
              },
            },
            telemetry = { enable = false },
            workspace = { checkThirdParty = false },
          },
        },
      },
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, { 'stylua' })

    require('mason-lspconfig').setup {
      automatic_enable = vim.tbl_keys(servers or {}),
    }

    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    for server_name, config in pairs(servers) do
      vim.lsp.config(server_name, config)
    end

    vim.lsp.set_log_level 'off'
  end,
}
