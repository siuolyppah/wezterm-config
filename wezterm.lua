local appearance = require("appearance")

local key_bindings = require("keybindings")

-- Deeply merge configurations
local function merge_configs(config, ...)
	local configs = { ... }
	for _, additional_config in ipairs(configs) do
		for k, v in pairs(additional_config) do
			if type(v) == "table" and type(config[k]) == "table" then
				-- If both are tables, merge them recursively
				merge_configs(config[k], v)
			else
				-- Otherwise, just set the value
				config[k] = v
			end
		end
	end
end

local config = {}

merge_configs(config, appearance, key_bindings)

return config
