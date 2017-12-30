require "conf"
require "files/stage1"
require "files/stage2"
require "files/stage3"
require "files/checaToque"
require "files/menu"
require "files/nextMenu"
require "files/media"
function love.load()
	images_load()
	conf_load()
	menu_load()
	animation_load()
	nextMenu_load()
	stage_1_play = true
	stage_2_play = true
	stage_3_play = true
end

function love.update(dt)
	menu_update(dt)
	animation_update(dt)
	nextMenu_update(dt)
	if stage == 1 then
		if stage_1_play then
			nextMenu_load()
			stage1_load()
			stage_1_play = false
		end
		stage1_update(dt)
	elseif stage == 2 then
		if stage_2_play then
			nextMenu_load()
			stage2_load()
			stage_2_play = false
		end
		stage2_update(dt)
	elseif stage == 3 then
		if stage_3_play then
			nextMenu_load()
			stage3_load()
			stage_3_play = false
		end
		stage3_update(dt)
	end
	if stage > 3 then 
		stage = 0
		score = 0
		final_score = 0
		score_update = true
		stage_1_play = true
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
	if stage == 3 then
		stage3_draw()
	end
	nextMenu_draw()
end
