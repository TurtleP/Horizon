--Place Horizon in this directory and run with LOVE!!

function love.load()
	logo = love.graphics.newImage("icon.png")
	banner = love.graphics.newImage("banner.png")
end

function love.update(dt)
	
end

function love.draw()
	love.graphics.setScreen("top")
	love.graphics.draw(banner, love.graphics.getWidth() / 2 - banner:getWidth() / 2, love.graphics.getHeight() / 2 - banner:getHeight() / 2 + math.sin(love.timer.getTime() * 2) * 2)
	love.graphics.print("Example text :D", 50, 180)

	love.graphics.setScreen("bottom")
	love.graphics.draw(logo)
	love.graphics.print("Hello world!", 200, 120)
end

function love.mousemoved(x, y)

end

function love.keypressed(key)

end

require 'Horizon'