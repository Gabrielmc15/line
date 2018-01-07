function menu_load()
	nextMenu_load()
	pressed = false
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
	stage_11_play = true
	stage_12_play = true
	--------------------------line necessarias-----------------
	mouse_positions = {}
	size = 4,5
	width_line = -100
	height_line = -100
	draw= false
	-------------------------flag necessarias------------------
	x_flag = 1
	y_flag = 1
	passou = false
	fail = false
	---------------------------star nessecarias----------------
	x_ball = 1000
	y_ball = 1000
	score= 0
	x_star1= 0
	y_star1= 0
	star_1_collision = false

	x_star2= 0
	y_star2= 0
	star_2_collision = false

	x_star3= 0
	y_star3= 0
	star_3_collision = false
	stars={}
	for i=1,4 do
		stars[i]=0
	end
	--para o efeito da pontuacao
	x_score_1=x_star1
	y_score_1=y_star1
	x_score_2=x_star2
	y_score_2=y_star2
	x_score_3=x_star3
	y_score_3=y_star3
	opacity1 = 255
	opacity2 = 255
	opacity3 = 255
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
	------------------------os botoes do menu-----------------------------
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
				stage = 12
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
		------------------------------flag---------------------------------------------------
	if y_ball > 950 then
		fail = true
	end

	if checaToqueRectangle(x_ball, y_ball, x_flag, y_flag, 84, 128) then
		passou= true
		final_score  = total_score
		objects.ball.body:setActive( false )
	end
	------------------------line-----------------------------------------
	x, y = love.mouse.getPosition( )
	---------------------------------score-------------------------------------------------
	if stage > 0 then
		if checaToqueRectangle(x_ball, y_ball, x_star1-15, y_star1-15, 60, 60) and not star_1_collision then
			stars[1]= 100
			star_1_collision = true
			y_score_1 = y_star1
			opacity1=255
			score_update = true
			love.audio.play( pick_star )
		end
		y_score_1 = y_score_1 -4
		opacity1 = opacity1 -10
	
		if checaToqueRectangle(x_ball, y_ball, x_star2-15, y_star2-15, 60, 60) and not star_2_collision then
			stars[2]= 100
			star_2_collision = true
			y_score_2 = y_star2
			opacity2 = 255
			score_update = true
			love.audio.play( pick_star )
		end
		y_score_2 = y_score_2 -4
		opacity2 = opacity2 -10
	
		if checaToqueRectangle(x_ball, y_ball, x_star3-15, y_star3-15, 60, 60) and not star_3_collision then
			stars[3]=100
			star_3_collision = true
			y_score_3 = y_star3
			opacity3 = 255
			score_update = true
			love.audio.play( pick_star )
		end
		y_score_3 = y_score_3 -4
		opacity3 = opacity3 -10
	
		if stars[1] == 100 and stars[2]== 0 and stars[3]== 0 then
			stars[4]= 0
		elseif stars[1] == 0 and stars[2]== 100 and stars[3]== 0 then
			stars[4]= 0
		elseif stars[1] == 0 and stars[2]== 0 and stars[3]== 100 then
			stars[4]= 0
		elseif stars[1] == 100 and stars[2]== 100 and stars[3]== 0 then
			stars[4]= 50
		elseif stars[1] == 100 and stars[2]== 0 and stars[3]== 100 then
			stars[4]= 50
		elseif stars[1] == 0 and stars[2]== 100 and stars[3]== 100 then
			stars[4]= 50
		elseif stars[1] == 100 and stars[2]== 100 and stars[3]== 100 then
			stars[4]= 150
		end
		score = stars[1] + stars[2] + stars[3] + stars[4]
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
	if stage > 0 and stage < 11 then 
		for i = 1, #mouse_positions do
			obj = mouse_positions[i]
	
			love.graphics.setColor(obj[1])
			love.graphics.circle("fill", obj[2], obj[3], obj[4])
		end
		if draw then
			love.graphics.setColor(0, 0, 0)
			love.graphics.circle("line", x, y, size)
			elseif not draw and stage_play and x > 90 then
			love.graphics.setColor(214, 4, 14)
			love.graphics.circle("line", x_mouse, y_mouse, size)
		end
	-------------------------score---------------------------------------
		love.graphics.setColor(255, 255, 255)
		love.graphics.setColor(0, 0, 0)
   		love.graphics.setFont(font_low)
		love.graphics.print( "pontuação total: " .. total_score, width- 250, 45)
		love.graphics.print( "fase : " .. stage , width- 100, 20)
		love.graphics.setColor(255, 255, 255)
		-------------------------------flag--------------------------------------
		love.graphics.setColor(255,255,255)
		love.graphics.draw(flag, x_flag, y_flag)
	end
end