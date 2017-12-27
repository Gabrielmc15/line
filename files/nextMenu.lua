function nextMenu_load()
	next_menu = love.graphics.newImage("images/next-menu.png")
	x_menu= (width/2)-(449/2)
	y_menu= height +20

	next_menu_fail = love.graphics.newImage("images/next-menu_fail.png")
	x_menu_fail = x_menu
	y_menu_fail = y_menu

	next_button = love.graphics.newImage("images/next-button.png")
	next_button_pressed = love.graphics.newImage("images/next-button_pressed.png")
	x_next_button = x_menu + 250
	y_next_button = y_menu + 400
	next_pressed = false
	
	try_again_button = love.graphics.newImage("images/tentar-novamente-button.png")
	try_again_button_pressed = love.graphics.newImage("images/tentar-novamente-button_pressed.png")
	x_try_again_button = x_menu_fail + 190
	y_try_again_button = y_menu_fail + 400
	try_again_pressed = false

	menu_button = love.graphics.newImage("images/menu-button.png")
	menu_button_pressed = love.graphics.newImage("images/menu-button_pressed.png")

	x_menu_button = x_menu +50
	y_menu_button = y_menu +400
	menu_pressed = false 
	----------------------------score stars---------------------------------------
	score_star_1 = love.graphics.newImage("images/score_star.png")
	score_star__1_full = love.graphics.newImage("images/score_star_full.png")
	x_score_star_1 = x_menu+20
	y_score_star_1 = y_menu +300

	score_star_2 = love.graphics.newImage("images/score_star.png")
	score_star__2full = love.graphics.newImage("images/score_star_full.png")
	x_score_star_2 = x_menu + 120
	y_score_star_2 = y_menu +300

	score_star_3 = love.graphics.newImage("images/score_star.png")
	score_star__3_full = love.graphics.newImage("images/score_star_full.png")
	x_score_star_3 = x_menu + 220
	y_score_star_3 = y_menu +300

	pontuacao = 0
	next_menu_active = false
end

function nextMenu_update(dt)
	if stage > 0 then
		-- variaveis dos botoes em funcao do menu
		x_next_button = x_menu + 250
		y_next_button = y_menu + 400
		
		x_try_again_button = x_menu_fail + 190
		y_try_again_button = y_menu_fail + 400	

		if passou then
			x_menu_button = x_menu +50
			y_menu_button = y_menu +400
		elseif fail then 
			x_menu_button = x_menu_fail +50
			y_menu_button = y_menu_fail +400
		end
		---variaveis das estrelas em funcao do menu 
		x_score_star_1 = x_menu+ 100
		y_score_star_1 = y_menu +250

		x_score_star_2 = x_menu + 180+50
		y_score_star_2 = y_menu +210

		x_score_star_3 = x_menu + 360
		y_score_star_3 = y_menu +250

		
		-- algoritmo para o menu se passou
		if passou then
			y_menu = y_menu-20
		end

		if y_menu < (height/2)-(250) then
			y_menu = (height/2)-(250)
			next_menu_active = true
			
			if pontuacao < score then
				pontuacao = pontuacao+3
			elseif pontuacao >= score then
				pontuacao = score
			end
		else next_menu_active = false
		end
		--algoritmo para o menu se falhou
		if fail then
			y_menu_fail = y_menu_fail -20
		end

		if y_menu_fail < (height/2)-(250) then
			y_menu_fail = (height/2)-(250)
			next_menu_active = true
		else next_menu_active = false
		end

		if checaToqueRectangle(x_mouse,y_mouse, x_menu, y_menu, 449, 500) or checaToqueRectangle(x_mouse,y_mouse, x_menu_fail, y_menu_fail, 449, 500) then
			love.mouse.setVisible( true )
		end

		---------------------------------clique dos botoes-------------------------------------------------------------------
		function love.mousereleased(x, y, button)
			if button == 1 and checaToqueRectangle(x_mouse,y_mouse, x_menu_button, y_menu_button, 105, 40) or checaToqueRectangle(x_mouse,y_mouse, x_next_button, y_next_button, 148, 40) or checaToqueRectangle(x_mouse,y_mouse, x_try_again_button, y_try_again_button, 239, 40) then
				pressed = true
				else pressed = false
			end
		end

		---------------------------------animação dos botoes------------------------------------------------------------------
		--menu
		if checaToqueRectangle(x_mouse,y_mouse, x_menu_button, y_menu_button, 105, 40) then
			menu_pressed = true
			if pressed then 
				stage = 0
				stage_1_play = true
				objects.ball.body:setActive( false )
				pressed = false
			end
			else menu_pressed = false
		end

		--next
		if checaToqueRectangle(x_mouse,y_mouse, x_next_button, y_next_button, 148, 40) then
			next_pressed = true
			if pressed then
				stage = 2
				stage_2_play = true
				objects.ball.body:setActive( false )
				pressed = false
			end
			else next_pressed = false
		end
		--try again
		if checaToqueRectangle(x_mouse,y_mouse, x_try_again_button, y_try_again_button, 239, 40) then
			try_again_pressed = true
			if pressed then 
				if stage == 1 then
				world:destroy( )
				stage1_load()
				nextMenu_load()
				elseif stage == 2 then
					world_2:destroy( )
					stage2_load()
					nextMenu_load()
				end
				pressed = false
			end
			else try_again_pressed = false
		end
	end
end

function nextMenu_draw()
	if stage > 0 then
		love.graphics.setColor(255,255,255)
		love.graphics.draw(next_menu_fail, x_menu_fail, y_menu_fail)
		love.graphics.draw(next_menu, x_menu, y_menu)

		-------------------------------desenhar os botoes-------------------------------------------------------------------
		--menu
		if not menu_pressed then
			love.graphics.draw(menu_button, x_menu_button, y_menu_button)
		else love.graphics.draw(menu_button_pressed, x_menu_button, y_menu_button)
		end
		--next
		if not next_pressed then
			love.graphics.draw(next_button, x_next_button, y_next_button)
		else love.graphics.draw(next_button_pressed, x_next_button, y_next_button)
		end
		--try again
		if not try_again_pressed then
			love.graphics.draw(try_again_button, x_try_again_button, y_try_again_button)
		else love.graphics.draw(try_again_button_pressed, x_try_again_button, y_try_again_button)
		end
		-------------------------------score---------------------------------------------------------
		love.graphics.setColor(0, 0, 0)
   	 	love.graphics.setFont(font)
   	 	love.graphics.print( "PONTUAÇÃO", x_menu+70, y_menu +75)
   	 	love.graphics.print( pontuacao, x_menu+195, y_menu +300)
   	 
   	 	love.graphics.setColor(255,255,255)
   	 	if pontuacao >= 100  then
   	 		love.graphics.draw(score_star__1_full, x_score_star_1, y_score_star_1, 0.523, 1, 1, 64, 64)
   	 	else love.graphics.draw(score_star_1, x_score_star_1, y_score_star_1, 0.523, 1, 1, 64, 64)
   	 	end
		
		if pontuacao >= 250 then
			love.graphics.draw(score_star__2full, x_score_star_2, y_score_star_2, 0, 1, 1, 64, 64)
		else love.graphics.draw(score_star_2, x_score_star_2, y_score_star_2, 0, 1, 1, 64, 64)
		end
		if pontuacao >= 400  then
			love.graphics.draw(score_star__3_full, x_score_star_3, y_score_star_3, -0.523, 1, 1, 64, 64)
		else love.graphics.draw(score_star_3, x_score_star_3, y_score_star_3, -0.523, 1, 1, 64, 64)
		end
   	 	--love.graphics.print( result, x_menu+120, y_menu +175)
   	 	love.graphics.setColor(255,255,255)
	end
end
