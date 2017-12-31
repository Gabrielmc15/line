require "conf"
require "files/stage1"
require "files/stage2"
require "files/stage3"
require "files/stage4"
require "files/stage5"
require "files/checaToque"
require "files/menu"
require "files/nextMenu"
require "files/media"
function love.load()
	images_load()
	audio_load()
	conf_load()
	menu_load()
	animation_load()
	animation_fan_load()
	animation_wind_load()
	animation_portal_load()
end

function love.update(dt)
	menu_update(dt)
	animation_update(dt)
	animation_fan_update(dt)
	animation_wind_update(dt)
	animation_portal_update(dt)
	nextMenu_update(dt)
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
	end
	if stage > 5 then
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
	elseif stage == 5 then
		stage5_draw()
	end
	nextMenu_draw()
end
