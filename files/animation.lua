--[[
function animation_draw()
    local spriteNum = math.floor(star.currentTime / star.duration * #star.quads) + 1
    love.graphics.draw(star.spriteSheet, star.quads[spriteNum], 100, 100, 0, 1)
end
--]]
function animation_load()
	star = newstar(love.graphics.newImage("images/score_stars/star.png"), 30, 30, 0.5)
	fan = newfan(love.graphics.newImage("images/scenario/fan.png"), 141, 63, 0.5)
	wind = newwind(love.graphics.newImage("images/scenario/wind.png"), 96, 96, 0.5)
	portal = newportal(love.graphics.newImage("images/scenario/portal.png"), 54, 180, 0.5)
end

function animation_update(dt)
	star.currentTime = star.currentTime + dt
    if star.currentTime >= star.duration then
        star.currentTime = star.currentTime - star.duration
    end

	fan.currentTime = fan.currentTime + dt
    if fan.currentTime >= fan.duration then
        fan.currentTime = fan.currentTime - fan.duration
    end

	wind.currentTime = wind.currentTime + dt
    if wind.currentTime >= wind.duration then
        wind.currentTime = wind.currentTime - wind.duration
    end

	portal.currentTime = portal.currentTime + dt
    if portal.currentTime >= portal.duration then
        portal.currentTime = portal.currentTime - portal.duration
    end
end


function newstar(image, width, height, duration)
    local star = {}
    star.spriteSheet = image;
    star.quads = {};

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(star.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    star.duration = duration or 1
    star.currentTime = 0

    return star
end
-------------------------------------animacao do ventilador--------------------------------------------------

function newfan(image, width, height, duration)
    local fan = {}
    fan.spriteSheet = image;
    fan.quads = {};

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(fan.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    fan.duration = duration or 1
    fan.currentTime = 0

    return fan
end

-------------------------------------animacao do wind--------------------------------------------------

function newwind(image, width, height, duration)
    local wind = {}
    wind.spriteSheet = image;
    wind.quads = {};

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(wind.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    wind.duration = duration or 1
    wind.currentTime = 0

    return wind
end
-----------------------------------animacao do portal--------------------------------------------

function newportal(image, width, height, duration)
    local portal = {}
    portal.spriteSheet = image;
    portal.quads = {};

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(portal.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    portal.duration = duration or 1
    portal.currentTime = 0

    return portal
end