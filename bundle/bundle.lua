-- bundled with tape

local __tape = { -- bundled with tape
	http = game:GetService('HttpService'), chunks = {}, -- string -> function
	require = require, cache = {}, -- string -> any
	scripts = {} -- script -> instance -> script
}
local function require(module)
	if typeof(module) == 'Instance' then
		local name = __tape.scripts[module]
		if name then module = name end
	end
	if typeof(module) ~= 'string' then
		return __tape.require(module)
	end

	local fn = __tape.chunks[module]
	if not fn then error(('tape: module %s not found'):format(module)) end

	local cache = __tape.cache[module]
	if cache then return cache.value end

	local s, e = pcall(fn, __tape.scripts[module])
	if not s then error(('tape: error executing %s: %s'):format(module, e)) end

	__tape.cache[module] = { value = e }
	return e
end

__tape.json = function(str)
	return function() return __tape.http:JSONDecode(str) end
end

__tape.buildTree = function(str)
	local function recurse(t, parent)
		local pair, children = unpack(t)
		local name, link = unpack(pair)
		local proxy = Instance.new(link and 'ModuleScript' or 'Folder')
		proxy.Parent = parent
		proxy.Name = name
		if link then
			__tape.scripts[proxy] = link
			__tape.scripts[link] = proxy
		end
		for _, v in pairs(children) do recurse(v, proxy) end
		return proxy
	end
	recurse(__tape.http:JSONDecode(str))
end

-- module: init.lua
__tape.chunks["init.lua"] = function(script)
return print("We be workin")
end

-- tree
__tape.buildTree("[[\"src\",\"init.lua\"],[]]")

return require("init.lua")
