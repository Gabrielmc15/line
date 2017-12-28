require "conf"
require "files/stage1"
require "files/stage2"
require "files/checaToque"
require "files/menu"
require "files/nextMenu"
require "files/animation"
require "files/media"
function love.load()
	images_load()
	conf_load()
	menu_load()
	animation_load()
	stage_1_play = true
	stage_2_play = true
	nextMenu_load()
end

function love.update(dt)
	menu_update(dt)
	animation_update(dt)
	nextMenu_update(dt)
	if stage == 1 then
		if stage_1_play then
			stage1_load()
			nextMenu_load()
			stage_1_play = false
		end
		stage1_update(dt)
	end
	if stage == 2 then
		if stage_2_play then
			stage2_load()
			nextMenu_load()
			stage_2_play = false
		end
		stage2_update(dt)
	end
end
 
function love.draw()
	menu_draw()
	if stage == 1 then
		stage1_draw()
	end
	if stage == 2 then
		stage2_draw()
	end
	nextMenu_draw()
end
