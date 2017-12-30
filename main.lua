require "conf"
require "files/stage1"
require "files/stage2"
require "files/stage3"
require "files/stage4"
require "files/checaToque"
require "files/menu"
require "files/nextMenu"
require "files/media"
function love.load()
	images_load()
	conf_load()
	menu_load()
	animation_load()
	animation_fan_load()
end

function love.update(dt)
	menu_update(dt)
	animation_update(dt)
	animation_fan_update(dt)
	nextMenu_update(dt)
	if stage == 1 then
		if stage_1_play then
			stage1_load()
			stage_1_play = false
		end
		stage1_update(dt)
	elseif stage == 2 then
		if stage_2_play then
			stage2_load()
			stage_2_play = false
		end
		stage2_update(dt)
	elseif stage == 3 then
		if stage_3_play then
			stage3_load()
			stage_3_play = false
		end
		stage3_update(dt)
		elseif stage == 4 then
		if stage_4_play then
			stage4_load()
			stage_4_play = false
		end
		stage4_update(dt)
	end
	if stage > 4 then 
		menu_load()
	end
end
 
function love.draw()
	menu_draw()
	if stage == 1 then
		stage1_draw()
	elseif stage == 2 then
		stage2_draw()
	elseif stage == 3 then
		stage3_draw()
	elseif stage == 4 then
		stage4_draw()
	end
	nextMenu_draw()
end
