function menu_load()
	pressed = false
	nextMenu_load()
	stage = 0
	x_play_button=(width/2) - 100
	y_play_button=(height/2) +100
	play_pressed= false

	x_scores_button=(width/2) - 100
	y_scores_button=y_play_button + 70
	scores_pressed= false

	x_exit_button=(width/2)-100
	y_exit_button=y_scores_button + 70
	exit_pressed= false
	------------------------variaveis necessarias---------------
	total_score = 0
	score = 0
	final_score = 0
	score_update = false
	-------------------------controle das fases-----------------
	stage_1_play = true
	stage_2_play = true
	stage_3_play = true
	stage_4_play = true
	stage_5_play = true
end

function menu_update(dt)
	--[[if love.keyboard.isDown("escape") then
		love.window.close( )
	end--]]
	------------------para somar e subtrair score-----------------------
	if score_update then
		total_score = score + final_score 
		score_update = false
	end
	if fail  then 
		score_update = true
	end
	if passou and win_sound_playable then
		love.audio.play( win_sound )
		win_sound_playable = false
	end

	x_mouse, y_mouse = love.mouse.getPosition( )
	if stage == 0 then
		function love.mousereleased(x, y, button)
			if stage == 0 then
				if button == 1 and (checaToqueRectangle(x_mouse,y_mouse, x_play_button, y_play_button, 200, 50) or checaToqueRectangle(x_mouse,y_mouse, x_scores_button, y_scores_button, 200, 50) or checaToqueRectangle(x_mouse,y_mouse, x_exit_button, y_exit_button, 200, 50) ) then
					pressed_menu = true
					else pressed_menu = false
				end
			end
		end
		--botao play
		if checaToqueRectangle(x_mouse,y_mouse, x_play_button, y_play_button, 200, 50) then
			play_pressed = true
			if pressed_menu then
				stage = 1
				pressed_menu= false
				love.audio.play( click )
			end
			else play_pressed = false
		end
		--botao scores menu
		if checaToqueRectangle(x_mouse,y_mouse, x_scores_button, y_scores_button, 200, 50) then
			scores_pressed = true
			if pressed_menu then
				stage = 0
				pressed_menu= false
				love.audio.play( click )
			end
			else scores_pressed = false
		end
		--botao sair
		if checaToqueRectangle(x_mouse,y_mouse, x_exit_button, y_exit_button, 200, 50) then
			exit_pressed = true
			if pressed_menu then
				love.window.close( )
				pressed_menu= false
				love.audio.play( click )
			end
			else exit_pressed = false
		end
	end
end

function menu_draw()
	if stage == 0 then
		if not play_pressed then
			love.graphics.draw(play_button, x_play_button, y_play_button)
		else love.graphics.draw(play_button_pressed, x_play_button, y_play_button)
		end
		if not scores_pressed then
			love.graphics.draw(scores_button, x_scores_button, y_scores_button)
		else love.graphics.draw(scores_button_pressed, x_scores_button, y_scores_button)
		end
		if not exit_pressed then
			love.graphics.draw(exit_button, x_exit_button, y_exit_button)
		else love.graphics.draw(exit_button_pressed, x_exit_button, y_exit_button)
		end
	end
	if stage > 0 then 
		love.graphics.setColor(0, 0, 0)
   		love.graphics.setFont(font_low)
		love.graphics.print( "pontuação total: " .. total_score, width- 250, 45)
		love.graphics.print( "fase : " .. stage , width- 100, 20)
		love.graphics.setColor(255, 255, 255)
	end
end