local ehn, ns = ...
ns.watch_leaked_globals()

local ModuleState = Class("ModuleState")
ModuleState.dependency_chains = OrderedHash()

function ModuleState:initialize(module)
  self.module = module
  self.default_state = module:default_state()
  self.enabled = false
  self.dependency_chains[module] = {
    dependencies = module:dependencies(), -- TODO: Make this an Array
    dependants   = OrderedHash()
  }
  for i, module_we_depend_on in ipairs(self:dependencies()) do
    self.dependency_chains[module_we_depend_on][self.module]
  end
end

function ModuleState:dependencies()
  return self.dependency_chain[self.module].dependencies
end

function ModuleState:dependants()
  return self.dependency_chain[self.module].dependants
end


function ModuleState:enable()
  self:enable_dependencies()
  self.enabled = true
  self.module:enable()
end

function ModuleState:disable()
  self:disable_dependants()
  self.enabled = false
  self.module:disable()
end