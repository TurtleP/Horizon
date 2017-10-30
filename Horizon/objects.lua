local json = require('Horizon.json')

local oldNewFont = love.graphics.newFont
function love.graphics.newFont(path)
	if type(path) ~= "string" then
		return oldNewFont(path)
	end

	if not love.filesystem.isFile(path .. ".png") then
		error("Missing " .. path .. ".png!")
	elseif not love.filesystem.isFile(path .. ".json") then
		error("Missing " .. path .. ".json!")
	end

	local font = {}

	font.glyphs = json:decode(love.filesystem.read(path .. ".json"))
	font.bitmap = love.graphics.newImage(path .. ".png")
	font.size = font.glyphs.info.size
	font.chars = {}

	for k, v in pairs(font.glyphs.chars) do
		table.insert(font.chars, 
			{
				glyph = k:char(), 
				quad = love.graphics.newQuad(v.x, v.y, v.width, v.height, font.bitmap:getWidth(), font.bitmap:getHeight()), 
				xadvance = v.xadvance, 
				xoffset = v.xoffset, 
				yoffset = v.yoffset, 
				width = v.width, 
				height = v.height
			}
		)
	end

	font.getHeight = function()
		return font.glyphs.common.lineHeight
	end

	font.getWidth = function(text)
		local width = 0

		for i = 1, #text do
			width = width + font.chars[i - 1].xadvance
		end

		return width
	end

	return font
end