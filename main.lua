require "conf"
require "objects/objects"
require "files/stage1"
require "files/checaToque"
require "files/menu"
require "files/nextMenu"
require "files/animation"
function love.load()
	conf_load()
	menu_load()
	objects()
	animation_load()
	stage_1_play = true
	nextMenu_load()
end

function love.update(dt)
	world:update(dt)
	menu_update(dt)
	animation_update(dt)
	nextMenu_update(dt)
	if stage == 1 then
		if stage_1_play then
			stage1_load()
			stage_1_play = false
		end
		stage1_update(dt)
	end
end
 
function love.draw()
	menu_draw()
	if stage == 1 then
		stage1_draw()
	end
	nextMenu_draw()
end
