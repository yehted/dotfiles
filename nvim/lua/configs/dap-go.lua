local dap_configurations = {
  {
    name= "Debug file with admin-console vars",
    type= "go",
    request= "launch",
    mode= "test",
    program= "${file}",
    env= {
    },
  },
  {
    name= "Debug jav tests",
    type= "go",
    request= "launch",
    -- mode= "exec",
    program= "${file}",
    env= {
          ENV =            "local",
          VC_ENV = "tst",
    },
    args= {
      "test",
      "--javConfig",
      "jav_local.json",
      "--timeout",
      "50",
      "--chains",
      "conflux"
    }
  },
  {
    name= "Run data-api",
    type= "go",
    request= "launch",
    program= "./cmd/data-api/main.go",
    env= {
      HUMAN_LOG="true",
      AWS_REGION="us-west-2",
      POSTGRES_DATABASE="data_api_dev",
    },
    args= {
      "-config",
      "./config.local.yaml"
    }
  },
  {
    name= "Run admin-console",
    type= "go",
    request= "launch",
    -- mode= "exec",
    program= "${file}",
    env= {
      AWS_REGION = "us-west-2",
      ENV =                            "tst",
      CLIENT_TABLE_NAME =              "admin-console-tst-clients",
      BILLING_TABLE_NAME =             "admin-console-tst-billing",
      VC_CORS_ALLOWED_ORIGINS =        "http://localhost:8080",
      POSTGRES_HOST =                  "localhost",
      POSTGRES_PORT =                  "5432",
      POSTGRES_ADMINCONSOLE_DB_NAME =  "admin_console_tst",
      POSTGRES_ADMINCONSOLE_USER =     "admin_console",
      POSTGRES_ADMINCONSOLE_PASSWORD = "admin_console_pass",
      POSTGRES_CONNECTION_TIMEOUT =    "5",
      METRICS_API_SECRET_NAME =        "metrics_api_private_endpoint_secret_tst",
    },
  },
  {
    name= "Run node-api",
    type= "go",
    request= "launch",
    program= "${file}",
    env= {
      AUTH0_AUDIENCE 													= "admin",
      CLIENT_TABLE_NAME 											= "admin-console-tst-clients",
      METRICS_API_SECRET_NAME                 = "metrics_api_private_endpoint_secret_tst",
      POSTGRES_HOST 													= "localhost",
      POSTGRES_PORT 													= "5432",
      POSTGRES_CONNECTION_TIMEOUT  						= "60",
      MIGRATION_SCRIPTS_PATH 									= "./internal/db/migrationscripts",
      POSTGRES_ADMINCONSOLE_DB_NAME 					= "admin_console_tst",
      POSTGRES_ADMINCONSOLE_USER 							= "postgres",
      POSTGRES_ADMINCONSOLE_PASSWORD 					= "postgres",
    },
  },
  {
    name= "Debug billing scanner test",
    type= "go",
    request= "launch",
    mode= "test",
    program= "${file}",
    env= {
    },
  },
  {
    name= "Run node-adapter",
    type= "go",
    request= "launch",
    -- mode= "exec",
    program= "${file}",
    env= {
      VC_LOG_LEVEL="debug",
      HUMAN_LOG="true"
    }
  }
}

require("dap-go").setup({ dap_configurations = dap_configurations })

