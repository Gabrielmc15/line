function love.load()
    text = "Type away! -- "
end
 
function love.textinput(t)
    text = text .. t
end
 
function love.draw()
    love.graphics.printf(text, 0, 0, love.graphics.getWidth())
end

