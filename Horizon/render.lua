local Screen = Enum.new({"top", "bottom"})
local CURRENT_SCREEN = Screen.top

local IS_3D = false

function love.graphics.set3D(enable) --stubbed
	assert(type(enable) == "boolean")
	IS_3D = enable
end

function love.graphics.setDepth(depth) --stubbed
	assert(type(depth) == "number")
end

function love.graphics.setScreen(screen)
	assert(Screen[screen] and type(screen) == "string")
	CURRENT_SCREEN = Screen[screen]
end

function love.graphics.getScreen()
	return CURRENT_SCREEN
end

local function translateCoordinates(x, y)
	if not x then
		x = 0
	end

	if not y then
		y = 0
	end

	if love.graphics.getScreen() == "bottom" then
		x = x + 40
		y = y + 240
	end

	return x, y
end

local oldGraphicsDraw = love.graphics.draw
function love.graphics.draw(image, quad, x, y,...)
	x, y = translateCoordinates(x, y)

	if not quad then
		oldGraphicsDraw(image, x, y, ...)
	else
		oldGraphicsDraw(image, quad, x, y, ...)
	end
end

local oldGraphicsRectangle = love.graphics.rectangle
function love.graphics.rectangle(mode, x, y, ...)
	x, y = translateCoordinates(x, y)

	oldGraphicsRectangle(mode, x, y, ...)
end

local oldGraphicsLine = love.graphics.line
function love.graphics.line(x, y, x2, y2)
	x, y = translateCoordinates(x, y)
	x2, y2 = translateCoordinates(x2, y2)

	oldGraphicsLine(x, y, x2, y2)
end

local oldGraphicsCircle = love.graphics.circle
function love.graphics.circle(mode, x, y, ...)
	x, y = translateCoordinates(x, y)

	oldGraphicsCircle(mode, x, y, ...)
end

local oldGraphicsPrint = love.graphics.print
function love.graphics.print(text, x, y, ...)
	x, y = translateCoordinates(x, y)

	oldGraphicsPrint(text, x, y, ...)
end

local oldGraphicsGetWidth = love.graphics.getWidth
function love.graphics.getWidth()
	if love.graphics.getScreen() == "bottom" then
		return 320
	end
	return 400
end

function love.graphics.getRendererInfo()
	return "OpenGL ES", "1.1", "Digital Media Professionals Inc.", "DMP PICA200"
end

local oldGraphicsGetHeight = love.graphics.getHeight
function love.graphics.getHeight()
	return 240
end

local function renderSpace()
	love.graphics.setColor(128, 128, 128)

	love.graphics.rectangle("fill", 0, 240, 40, 240)
	love.graphics.rectangle("fill", 360, 240, 40, 240)
end

local oldDraw = love.draw
function love.draw()
	oldDraw()

	renderSpace()

	love.graphics.setColor(255, 255, 255)
end