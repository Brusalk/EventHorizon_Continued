local ehn, ns = ...
ns.watch_leaked_globals()

local SAVED_VARIABLE_NAME = "EventHorizonSavedVariables"

local Database = Class("Database")

-- Registry of default configs
-- When we build the default config table for AceDB, all of the specified
-- configs are flattened to produce the full default config
-- This allows modules to embed their config within EH's config system
Database.default_configs = {}

function Database:initialize()
  local db = LibStub("AceDB-3.0"):New(SAVED_VARIABLE_NAME)
  db:RegisterDefaults(self:build_default_config())
  db:SetProfile("Default")
  -- Proxy all requests made to us through to AceDB
  -- if we don't have those methods
  ns.inject_metatable(self, db)
end

function Database:build_default_config()
  return self.default_configs -- TODO: Enhance this to support giving out namespaces to modules, w/ module defined schema
end