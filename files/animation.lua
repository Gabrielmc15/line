function animation_load()
    star = newstar(love.graphics.newImage("images/star.png"), 30, 30, 0.5)
end

function animation_update(dt)
    star.currentTime = star.currentTime + dt
    if star.currentTime >= star.duration then
        star.currentTime = star.currentTime - star.duration
    end
end

function animation_draw()
    local spriteNum = math.floor(star.currentTime / star.duration * #star.quads) + 1
    love.graphics.draw(star.spriteSheet, star.quads[spriteNum], 100, 100, 0, 1)
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
