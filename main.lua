require "conf"
require "files/stage1"
require "files/stage2"
require "files/stage3"
require "files/stage4"
require "files/stage5"
require "files/stage6"
require "files/stage7"
require "files/stage11"
require "files/stage12"
require "scores/scores"
require "files/checaToque"
require "files/menu"
require "files/nextMenu"
require "files/media"
require "files/animation"
require "files/sideMenu"
function love.load()
	images_load()
	audio_load()
	conf_load()
	menu_load()
	sideMenu_load()
	animation_load()
end

function love.update(dt)
	menu_update(dt)
	animation_update(dt)
	if stage < 11 then
		nextMenu_update(dt)
	end
	if stage == 1 then
		if stage_1_play then
			stage1_load()
		end
		stage1_update(dt)
	elseif stage == 2 then
		if stage_2_play then
			stage2_load()
		end
		stage2_update(dt)
	elseif stage == 3 then
		if stage_3_play then
			stage3_load()
		end
		stage3_update(dt)
	elseif stage == 4 then
		if stage_4_play then
			stage4_load()
		end
		stage4_update(dt)
	elseif stage == 5 then
		if stage_5_play then
			stage5_load()
		end
		stage5_update(dt)
	elseif stage == 6 then
		if stage_6_play then
			stage6_load()
		end
		stage6_update(dt)
	elseif stage == 7 then
		if stage_7_play then
			stage7_load()
		end
		stage7_update(dt)
	elseif stage == 11 then
		if stage_11_play then
			stage11_load()
		end
		stage11_update(dt)
	elseif stage == 12 then
		if stage_12_play then
			stage12_load()
		end
		stage12_update(dt)
	end
	if stage > 12 then
		menu_load()
	end
end

function love.draw()
	menu_draw()
	if stage > 0 and stage < 11 then
		sideMenu_draw()
	end
	if stage == 1 then
		stage1_draw()
	elseif stage == 2 then
		stage2_draw()
	elseif stage == 3 then
		stage3_draw()
	elseif stage == 4 then
		stage4_draw()
	elseif stage == 5 then
		stage5_draw()
	elseif stage == 6 then
		stage6_draw()
	elseif stage == 7 then
		stage7_draw()
	elseif stage == 11 then
		stage11_draw()
	elseif stage == 12 then
		stage12_draw()
	end
	nextMenu_draw()
end
