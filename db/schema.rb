# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_08_153219) do

  create_table "columns_priv", primary_key: ["Host", "Db", "User", "Table_name", "Column_name"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0", comment: "Column privileges", force: :cascade do |t|
    t.string "Host", limit: 60, default: "", null: false
    t.string "Db", limit: 64, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.string "Table_name", limit: 64, default: "", null: false
    t.string "Column_name", limit: 64, default: "", null: false
    t.timestamp "Timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "Column_priv", limit: 31, default: "", null: false, collation: "utf8_general_ci"
  end

  create_table "component", primary_key: "component_id", id: :integer, unsigned: true, options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "Components", force: :cascade do |t|
    t.integer "component_group_id", null: false, unsigned: true
    t.text "component_urn", null: false
  end

  create_table "db", primary_key: ["Host", "Db", "User"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0", comment: "Database privileges", force: :cascade do |t|
    t.string "Host", limit: 60, default: "", null: false
    t.string "Db", limit: 64, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.string "Select_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Insert_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Update_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Delete_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Drop_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Grant_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "References_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Index_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Alter_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_tmp_table_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Lock_tables_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_view_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Show_view_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_routine_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Alter_routine_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Execute_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Event_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Trigger_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.index ["User"], name: "User"
  end

  create_table "default_roles", primary_key: ["HOST", "USER", "DEFAULT_ROLE_HOST", "DEFAULT_ROLE_USER"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0", comment: "Default roles", force: :cascade do |t|
    t.string "HOST", limit: 60, default: "", null: false
    t.string "USER", limit: 32, default: "", null: false
    t.string "DEFAULT_ROLE_HOST", limit: 60, default: "%", null: false
    t.string "DEFAULT_ROLE_USER", limit: 32, default: "", null: false
  end

  create_table "engine_cost", primary_key: ["cost_name", "engine_name", "device_type"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0", force: :cascade do |t|
    t.string "engine_name", limit: 64, null: false
    t.integer "device_type", null: false
    t.string "cost_name", limit: 64, null: false
    t.float "cost_value"
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "comment", limit: 1024
    t.virtual "default_value", type: :float, as: "(case `cost_name` when _utf8mb4\\'io_block_read_cost\\' then 1.0 when _utf8mb4\\'memory_block_read_cost\\' then 0.25 else NULL end)"
  end

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_favorites_on_store_id"
    t.index ["user_id", "store_id"], name: "index_favorites_on_user_id_and_store_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "func", primary_key: "name", id: :string, limit: 64, default: "", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0", comment: "User defined functions", force: :cascade do |t|
    t.boolean "ret", default: false, null: false
    t.string "dl", limit: 128, default: "", null: false
    t.string "type", limit: 9, null: false, collation: "utf8_general_ci"
  end

  create_table "general_log", id: false, options: "ENGINE=CSV DEFAULT CHARSET=utf8", comment: "General log", force: :cascade do |t|
    t.timestamp "event_time", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.text "user_host", limit: 16777215, null: false
    t.bigint "thread_id", null: false, unsigned: true
    t.integer "server_id", null: false, unsigned: true
    t.string "command_type", limit: 64, null: false
    t.binary "argument", limit: 16777215, null: false
  end

  create_table "global_grants", primary_key: ["USER", "HOST", "PRIV"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0", comment: "Extended global grants", force: :cascade do |t|
    t.string "USER", limit: 32, default: "", null: false
    t.string "HOST", limit: 60, default: "", null: false
    t.string "PRIV", limit: 32, default: "", null: false, collation: "utf8_general_ci"
    t.string "WITH_GRANT_OPTION", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
  end

  create_table "gtid_executed", primary_key: ["source_uuid", "interval_start"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "source_uuid", limit: 36, null: false, comment: "uuid of the source where the transaction was originally executed."
    t.bigint "interval_start", null: false, comment: "First number of interval."
    t.bigint "interval_end", null: false, comment: "Last number of interval."
  end

  create_table "help_category", primary_key: "help_category_id", id: :integer, limit: 2, unsigned: true, default: nil, options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0", comment: "help categories", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.integer "parent_category_id", limit: 2, unsigned: true
    t.text "url", null: false
    t.index ["name"], name: "name", unique: true
  end

  create_table "help_keyword", primary_key: "help_keyword_id", id: :integer, unsigned: true, default: nil, options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0", comment: "help keywords", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.index ["name"], name: "name", unique: true
  end

  create_table "help_relation", primary_key: ["help_keyword_id", "help_topic_id"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0", comment: "keyword-topic relation", force: :cascade do |t|
    t.integer "help_topic_id", null: false, unsigned: true
    t.integer "help_keyword_id", null: false, unsigned: true
  end

  create_table "help_topic", primary_key: "help_topic_id", id: :integer, unsigned: true, default: nil, options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0", comment: "help topics", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.integer "help_category_id", limit: 2, null: false, unsigned: true
    t.text "description", null: false
    t.text "example", null: false
    t.text "url", null: false
    t.index ["name"], name: "name", unique: true
  end

  create_table "innodb_index_stats", primary_key: ["database_name", "table_name", "index_name", "stat_name"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "database_name", limit: 64, null: false
    t.string "table_name", limit: 199, null: false
    t.string "index_name", limit: 64, null: false
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "stat_name", limit: 64, null: false
    t.bigint "stat_value", null: false, unsigned: true
    t.bigint "sample_size", unsigned: true
    t.string "stat_description", limit: 1024, null: false
  end

  create_table "innodb_table_stats", primary_key: ["database_name", "table_name"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "database_name", limit: 64, null: false
    t.string "table_name", limit: 199, null: false
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "n_rows", null: false, unsigned: true
    t.bigint "clustered_index_size", null: false, unsigned: true
    t.bigint "sum_of_other_index_sizes", null: false, unsigned: true
  end

  create_table "password_history", primary_key: ["Host", "User", "Password_timestamp"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0", comment: "Password history for user accounts", force: :cascade do |t|
    t.string "Host", limit: 60, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.timestamp "Password_timestamp", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.text "Password"
  end

  create_table "plugin", primary_key: "name", id: :string, limit: 64, default: "", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0", comment: "MySQL plugins", force: :cascade do |t|
    t.string "dl", limit: 128, default: "", null: false
  end

  create_table "prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.integer "prefcode"
    t.string "prefname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "procs_priv", primary_key: ["Host", "Db", "User", "Routine_name", "Routine_type"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0", comment: "Procedure privileges", force: :cascade do |t|
    t.string "Host", limit: 60, default: "", null: false
    t.string "Db", limit: 64, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.string "Routine_name", limit: 64, default: "", null: false, collation: "utf8_general_ci"
    t.string "Routine_type", limit: 9, null: false
    t.string "Grantor", limit: 93, default: "", null: false
    t.string "Proc_priv", limit: 27, default: "", null: false, collation: "utf8_general_ci"
    t.timestamp "Timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["Grantor"], name: "Grantor"
  end

  create_table "proxies_priv", primary_key: ["Host", "User", "Proxied_host", "Proxied_user"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0", comment: "User proxy privileges", force: :cascade do |t|
    t.string "Host", limit: 60, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.string "Proxied_host", limit: 60, default: "", null: false
    t.string "Proxied_user", limit: 32, default: "", null: false
    t.boolean "With_grant", default: false, null: false
    t.string "Grantor", limit: 93, default: "", null: false
    t.timestamp "Timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["Grantor"], name: "Grantor"
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["store_id"], name: "index_reviews_on_store_id"
    t.index ["user_id", "store_id"], name: "index_reviews_on_user_id_and_store_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "role_edges", primary_key: ["FROM_HOST", "FROM_USER", "TO_HOST", "TO_USER"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0", comment: "Role hierarchy and role grants", force: :cascade do |t|
    t.string "FROM_HOST", limit: 60, default: "", null: false
    t.string "FROM_USER", limit: 32, default: "", null: false
    t.string "TO_HOST", limit: 60, default: "", null: false
    t.string "TO_USER", limit: 32, default: "", null: false
    t.string "WITH_ADMIN_OPTION", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
  end

  create_table "server_cost", primary_key: "cost_name", id: :string, limit: 64, options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0", force: :cascade do |t|
    t.float "cost_value"
    t.timestamp "last_update", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "comment", limit: 1024
    t.virtual "default_value", type: :float, as: "(case `cost_name` when _utf8mb4\\'disk_temptable_create_cost\\' then 20.0 when _utf8mb4\\'disk_temptable_row_cost\\' then 0.5 when _utf8mb4\\'key_compare_cost\\' then 0.05 when _utf8mb4\\'memory_temptable_create_cost\\' then 1.0 when _utf8mb4\\'memory_temptable_row_cost\\' then 0.1 when _utf8mb4\\'row_evaluate_cost\\' then 0.1 else NULL end)"
  end

  create_table "servers", primary_key: "Server_name", id: :string, limit: 64, default: "", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0", comment: "MySQL Foreign Servers table", force: :cascade do |t|
    t.string "Host", limit: 64, default: "", null: false
    t.string "Db", limit: 64, default: "", null: false
    t.string "Username", limit: 64, default: "", null: false
    t.string "Password", limit: 64, default: "", null: false
    t.integer "Port", default: 0, null: false
    t.string "Socket", limit: 64, default: "", null: false
    t.string "Wrapper", limit: 64, default: "", null: false
    t.string "Owner", limit: 64, default: "", null: false
  end

  create_table "slave_master_info", primary_key: "Channel_name", id: :string, limit: 64, comment: "The channel on which the slave is connected to a source. Used in Multisource Replication", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0", comment: "Master Information", force: :cascade do |t|
    t.integer "Number_of_lines", null: false, comment: "Number of lines in the file.", unsigned: true
    t.text "Master_log_name", null: false, collation: "utf8_bin", comment: "The name of the master binary log currently being read from the master."
    t.bigint "Master_log_pos", null: false, comment: "The master log position of the last read event.", unsigned: true
    t.string "Host", limit: 64, collation: "utf8_bin", comment: "The host name of the master."
    t.text "User_name", collation: "utf8_bin", comment: "The user name used to connect to the master."
    t.text "User_password", collation: "utf8_bin", comment: "The password used to connect to the master."
    t.integer "Port", null: false, comment: "The network port used to connect to the master.", unsigned: true
    t.integer "Connect_retry", null: false, comment: "The period (in seconds) that the slave will wait before trying to reconnect to the master.", unsigned: true
    t.boolean "Enabled_ssl", null: false, comment: "Indicates whether the server supports SSL connections."
    t.text "Ssl_ca", collation: "utf8_bin", comment: "The file used for the Certificate Authority (CA) certificate."
    t.text "Ssl_capath", collation: "utf8_bin", comment: "The path to the Certificate Authority (CA) certificates."
    t.text "Ssl_cert", collation: "utf8_bin", comment: "The name of the SSL certificate file."
    t.text "Ssl_cipher", collation: "utf8_bin", comment: "The name of the cipher in use for the SSL connection."
    t.text "Ssl_key", collation: "utf8_bin", comment: "The name of the SSL key file."
    t.boolean "Ssl_verify_server_cert", null: false, comment: "Whether to verify the server certificate."
    t.float "Heartbeat", null: false
    t.text "Bind", collation: "utf8_bin", comment: "Displays which interface is employed when connecting to the MySQL server"
    t.text "Ignored_server_ids", collation: "utf8_bin", comment: "The number of server IDs to be ignored, followed by the actual server IDs"
    t.text "Uuid", collation: "utf8_bin", comment: "The master server uuid."
    t.bigint "Retry_count", null: false, comment: "Number of reconnect attempts, to the master, before giving up.", unsigned: true
    t.text "Ssl_crl", collation: "utf8_bin", comment: "The file used for the Certificate Revocation List (CRL)"
    t.text "Ssl_crlpath", collation: "utf8_bin", comment: "The path used for Certificate Revocation List (CRL) files"
    t.boolean "Enabled_auto_position", null: false, comment: "Indicates whether GTIDs will be used to retrieve events from the master."
    t.text "Tls_version", collation: "utf8_bin", comment: "Tls version"
    t.text "Public_key_path", collation: "utf8_bin", comment: "The file containing public key of master server."
    t.boolean "Get_public_key", null: false, comment: "Preference to get public key from master."
    t.text "Network_namespace", collation: "utf8_bin", comment: "Network namespace used for communication with the master server."
  end

  create_table "slave_relay_log_info", primary_key: "Channel_name", id: :string, limit: 64, comment: "The channel on which the slave is connected to a source. Used in Multisource Replication", options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0", comment: "Relay Log Information", force: :cascade do |t|
    t.integer "Number_of_lines", null: false, comment: "Number of lines in the file or rows in the table. Used to version table definitions.", unsigned: true
    t.text "Relay_log_name", null: false, collation: "utf8_bin", comment: "The name of the current relay log file."
    t.bigint "Relay_log_pos", null: false, comment: "The relay log position of the last executed event.", unsigned: true
    t.text "Master_log_name", null: false, collation: "utf8_bin", comment: "The name of the master binary log file from which the events in the relay log file were read."
    t.bigint "Master_log_pos", null: false, comment: "The master log position of the last executed event.", unsigned: true
    t.integer "Sql_delay", null: false, comment: "The number of seconds that the slave must lag behind the master."
    t.integer "Number_of_workers", null: false, unsigned: true
    t.integer "Id", null: false, comment: "Internal Id that uniquely identifies this record.", unsigned: true
  end

  create_table "slave_worker_info", primary_key: ["Channel_name", "Id"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0", comment: "Worker Information", force: :cascade do |t|
    t.integer "Id", null: false, unsigned: true
    t.text "Relay_log_name", null: false, collation: "utf8_bin"
    t.bigint "Relay_log_pos", null: false, unsigned: true
    t.text "Master_log_name", null: false, collation: "utf8_bin"
    t.bigint "Master_log_pos", null: false, unsigned: true
    t.text "Checkpoint_relay_log_name", null: false, collation: "utf8_bin"
    t.bigint "Checkpoint_relay_log_pos", null: false, unsigned: true
    t.text "Checkpoint_master_log_name", null: false, collation: "utf8_bin"
    t.bigint "Checkpoint_master_log_pos", null: false, unsigned: true
    t.integer "Checkpoint_seqno", null: false, unsigned: true
    t.integer "Checkpoint_group_size", null: false, unsigned: true
    t.binary "Checkpoint_group_bitmap", null: false
    t.string "Channel_name", limit: 64, null: false, comment: "The channel on which the slave is connected to a source. Used in Multisource Replication"
  end

  create_table "slow_log", id: false, options: "ENGINE=CSV DEFAULT CHARSET=utf8", comment: "Slow log", force: :cascade do |t|
    t.timestamp "start_time", precision: 6, default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.text "user_host", limit: 16777215, null: false
    t.time "query_time", precision: 6, null: false
    t.time "lock_time", precision: 6, null: false
    t.integer "rows_sent", null: false
    t.integer "rows_examined", null: false
    t.string "db", limit: 512, null: false
    t.integer "last_insert_id", null: false
    t.integer "insert_id", null: false
    t.integer "server_id", null: false, unsigned: true
    t.binary "sql_text", limit: 16777215, null: false
    t.bigint "thread_id", null: false, unsigned: true
  end

  create_table "stores", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.string "name_hurigana"
    t.string "smoking"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prefecture"
    t.string "city"
    t.string "city_street"
    t.string "genre"
    t.string "business_hours"
    t.string "holiday"
    t.integer "lunch_min"
    t.integer "lunch_max"
    t.integer "dinner_min"
    t.integer "dinner_max"
    t.string "image"
  end

  create_table "tables_priv", primary_key: ["Host", "Db", "User", "Table_name"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0", comment: "Table privileges", force: :cascade do |t|
    t.string "Host", limit: 60, default: "", null: false
    t.string "Db", limit: 64, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.string "Table_name", limit: 64, default: "", null: false
    t.string "Grantor", limit: 93, default: "", null: false
    t.timestamp "Timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "Table_priv", limit: 98, default: "", null: false, collation: "utf8_general_ci"
    t.string "Column_priv", limit: 31, default: "", null: false, collation: "utf8_general_ci"
    t.index ["Grantor"], name: "Grantor"
  end

  create_table "time_zone", primary_key: "Time_zone_id", id: :integer, unsigned: true, options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0", comment: "Time zones", force: :cascade do |t|
    t.string "Use_leap_seconds", limit: 1, default: "N", null: false
  end

  create_table "time_zone_leap_second", primary_key: "Transition_time", id: :bigint, default: nil, options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0", comment: "Leap seconds information for time zones", force: :cascade do |t|
    t.integer "Correction", null: false
  end

  create_table "time_zone_name", primary_key: "Name", id: :string, limit: 64, options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0", comment: "Time zone names", force: :cascade do |t|
    t.integer "Time_zone_id", null: false, unsigned: true
  end

  create_table "time_zone_transition", primary_key: ["Time_zone_id", "Transition_time"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0", comment: "Time zone transitions", force: :cascade do |t|
    t.integer "Time_zone_id", null: false, unsigned: true
    t.bigint "Transition_time", null: false
    t.integer "Transition_type_id", null: false, unsigned: true
  end

  create_table "time_zone_transition_type", primary_key: ["Time_zone_id", "Transition_type_id"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 STATS_PERSISTENT=0", comment: "Time zone transition types", force: :cascade do |t|
    t.integer "Time_zone_id", null: false, unsigned: true
    t.integer "Transition_type_id", null: false, unsigned: true
    t.integer "Offset", default: 0, null: false
    t.integer "Is_DST", limit: 1, default: 0, null: false, unsigned: true
    t.string "Abbreviation", limit: 8, default: "", null: false
  end

  create_table "user", primary_key: ["Host", "User"], options: "/*!50100 TABLESPACE `mysql` */ ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin STATS_PERSISTENT=0", comment: "Users and global privileges", force: :cascade do |t|
    t.string "Host", limit: 60, default: "", null: false
    t.string "User", limit: 32, default: "", null: false
    t.string "Select_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Insert_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Update_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Delete_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Drop_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Reload_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Shutdown_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Process_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "File_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Grant_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "References_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Index_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Alter_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Show_db_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Super_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_tmp_table_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Lock_tables_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Execute_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Repl_slave_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Repl_client_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_view_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Show_view_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_routine_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Alter_routine_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_user_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Event_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Trigger_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_tablespace_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "ssl_type", limit: 9, default: "", null: false, collation: "utf8_general_ci"
    t.binary "ssl_cipher", null: false
    t.binary "x509_issuer", null: false
    t.binary "x509_subject", null: false
    t.integer "max_questions", default: 0, null: false, unsigned: true
    t.integer "max_updates", default: 0, null: false, unsigned: true
    t.integer "max_connections", default: 0, null: false, unsigned: true
    t.integer "max_user_connections", default: 0, null: false, unsigned: true
    t.string "plugin", limit: 64, default: "caching_sha2_password", null: false
    t.text "authentication_string"
    t.string "password_expired", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.timestamp "password_last_changed"
    t.integer "password_lifetime", limit: 2, unsigned: true
    t.string "account_locked", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Create_role_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.string "Drop_role_priv", limit: 1, default: "N", null: false, collation: "utf8_general_ci"
    t.integer "Password_reuse_history", limit: 2, unsigned: true
    t.integer "Password_reuse_time", limit: 2, unsigned: true
    t.string "Password_require_current", limit: 1, collation: "utf8_general_ci"
    t.json "User_attributes"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "favorites", "stores"
  add_foreign_key "favorites", "users"
  add_foreign_key "reviews", "stores"
  add_foreign_key "reviews", "users"
end
