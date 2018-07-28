io.stdout:setvbuf("no")

function love.load()
    logo = love.graphics.newImage("icon.png")
    banner = love.graphics.newImage("banner.png")

    font = love.graphics.newFont("Gohu.10")

    iconX = 0
    iconY = 0

    lastKey = "None"
end

function love.update(dt)
    
end

function love.draw()
    love.graphics.setFont(font)

    love.graphics.setScreen("top")
    love.graphics.draw(banner, love.graphics.getWidth() / 2 - banner:getWidth() / 2, love.graphics.getHeight() / 2 - banner:getHeight() / 2 + math.sin(love.timer.getTime() * 2) * 2)
    love.graphics.print("Example text :D", 50, 180)

    love.graphics.setScreen("bottom")
    love.graphics.draw(logo, iconX, iconY)
    love.graphics.print("Hello world!", 200, 120)

    love.graphics.print("Horizon v1.0", 0, 240 - font:getHeight())

    love.graphics.print("Last Key: " .. lastKey)
end

function love.mousemoved(x, y)
    if x >= iconX and x <= iconX + logo:getWidth() and y >= iconY and y <= iconY + logo:getHeight() then
        iconX = x - logo:getWidth() / 2
        iconY = y - logo:getHeight() / 2
    end
end

function love.keypressed(key)
    lastKey = key
end

require 'Horizon'