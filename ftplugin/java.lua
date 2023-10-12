local proj_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.expand('$HOME/.local/share/jdtls/') .. proj_name

local config = {
    cmd = {
        "java", '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true', '-Dlog.level=ALL', '-Xms1g',
        '--add-modules=ALL-SYSTEM', '--add-opens',
        'java.base/java.util=ALL-UNNAMED', '--add-opens',
        'java.base/java.lang=ALL-UNNAMED', '-jar',
        '/opt/homebrew/opt/jdtls/libexec/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar',
        '-configuration', '/opt/homebrew/opt/jdtls/libexec/config_mac_arm',
        '-data', workspace_dir
        -- vim.fn.expand('$HOME/.local/share/nvim/mason/packages/jdtls/bin/jdtls')
    },
    root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-21",
                        path = "/Library/Java/JavaVirtualMachines/jdk-21.sdk/Contents/Home",
                        default = true
                    },
                    {
                        name = "JavaSE-20",
                        path = "/Library/Java/JavaVirtualMachines/jdk-20.jdk/Contents/Home"
                    },
                    {
                        name = "JavaSE-17",
                        path = "/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home"
                    }
                }
            }
        }
    },
    init_options = { bundles = {} }
}

require('jdtls').start_or_attach(config)
