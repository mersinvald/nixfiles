local function has_value(arr, value)
  for i, v in ipairs(arr) do
    if v == value then
      return true
    end
  end
  return false
end
