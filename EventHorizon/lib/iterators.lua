local _, ns = ...

function ns.utils:array_pairs(...)
  local args = {...} -- We may lose nils
  local current_index = -1
  return function()
    current_index = current_index + 2
    return args[current_index], args[current_index+1]
  end
end