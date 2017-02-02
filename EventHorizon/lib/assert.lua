local _, ns = ...

print("LOADED ASSERT", ns.utils)

function ns.utils:assert(condition, message)
  if not(condition) then self:print_with_class("ASSERTION_FAILED", message) end -- Duplicate error to chat log
  assert(condition, message)
end