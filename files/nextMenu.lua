function nextMenu_load()
	x_menu= (width/2)-(449/2)
	y_menu= height +20

	x_menu_fail = x_menu
	y_menu_fail = y_menu

	x_next_button = x_menu + 250
	y_next_button = y_menu + 400
	next_pressed = false
	
	x_try_again_button = x_menu_fail + 190
	y_try_again_button = y_menu_fail + 400
	try_again_pressed = false

	x_menu_button = x_menu +50
	y_menu_button = y_menu +400
	menu_pressed = false 
	----------------------------score stars---------------------------------------
	x_score_star_1 = x_menu+20
	y_score_star_1 = y_menu +300

	x_score_star_2 = x_menu + 120
	y_score_star_2 = y_menu +300

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
				if pontuacao > 100 and pontuacao < 450 then
					love.audio.play( win_sound_1 )
				elseif pontuacao == 450 then
					love.audio.play( win_sound_3 )
				end
				if pontuacao > 250 then
					love.audio.play( win_sound_2 )
				end
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
				pressed_next_menu = true
				else pressed_next_menu = false
			end
		end

		---------------------------------animação dos botoes------------------------------------------------------------------
		--menu
		if checaToqueRectangle(x_mouse,y_mouse, x_menu_button, y_menu_button, 105, 40) then
			menu_pressed = true
			if pressed_next_menu then 
				menu_load()
				pressed_next_menu = false
				love.audio.play( click )
			end
			else menu_pressed = false
		end

		--next
		if checaToqueRectangle(x_mouse,y_mouse, x_next_button, y_next_button, 148, 40) then
			next_pressed = true
			if pressed_next_menu then
				if stage == 5 then
					stage = 11
				end
				stage = stage + 1
				pressed_next_menu = false
				love.audio.play( click )
			end
			else next_pressed = false
		end

		--try again
		if checaToqueRectangle(x_mouse,y_mouse, x_try_again_button, y_try_again_button, 239, 40) then
			try_again_pressed = true
			if pressed_next_menu then 
				love.audio.play( click )
				--fail = true
				if stage == 1 then
					world_1:destroy( )
					stage1_load()
				elseif stage == 2 then
					world_2:destroy( )
					stage2_load()				
				elseif stage == 3 then
					world_3:destroy( )
					stage3_load()
				elseif stage == 4 then
					world_4:destroy( )
					stage4_load()
				elseif stage == 5 then
					world_5:destroy( )
					stage5_load()
				end
				pressed_next_menu = false
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
			love.graphics.draw(score_star__2_full, x_score_star_2, y_score_star_2, 0, 1, 1, 64, 64)
		else love.graphics.draw(score_star_2, x_score_star_2, y_score_star_2, 0, 1, 1, 64, 64)
		end
		if pontuacao >= 400  then
			love.graphics.draw(score_star__3_full, x_score_star_3, y_score_star_3, -0.523, 1, 1, 64, 64)
		else love.graphics.draw(score_star_3, x_score_star_3, y_score_star_3, -0.523, 1, 1, 64, 64)
		end
   	 	love.graphics.setColor(255,255,255)
	end
end
