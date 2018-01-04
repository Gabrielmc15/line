function sideMenu_load()
	x_stage_play_button= 15
	y_stage_play_button= 50

	x_stage_replay_button = x_stage_play_button 
	y_stage_replay_button = height - 150

	x_stage_help_button =  x_stage_play_button 
	y_stage_help_button = height - 75

	x_stage_arrow_button =  x_stage_play_button 
	y_stage_arrow_button =  y_stage_play_button + 74

	x_arrow_right =  x_ball + 40
	y_arrow_right =  y_ball - 35
	arrow_right_active = true

	x_arrow_left =  x_ball - 104
	y_arrow_left =  y_ball - 35
	arrow_left_active = true

	x_stage_ball_button = x_stage_arrow_button
	y_stage_ball_button = y_stage_arrow_button + 74

	stage_play = true --controle
	stage_replay=true -- controle
	stage_help = true --controle
	help = false
end

function sideMenu_update(dt)
	if  not((passou and  fail) and  next_menu_active) then
		if x <= 90 then 
			love.mouse.setVisible( true )
			draw = false
		elseif stage_play then 
			draw = true
		end
		if checarToqueCircle(x_mouse, y_mouse, x_stage_play_button+32, y_stage_play_button+32, 32 ) then
			love.mouse.setVisible( true )
			if love.mouse.isDown(1) and stage_play and not passou and not fail then
				love.audio.play( click )
				if arrow_right_active then
					if beach_ball_active then
						objects.ball.body:applyForce(10000, 0)
					else
						objects.ball.body:applyForce(8000, 0)
					end
				elseif arrow_left_active then
					if beach_ball_active then
						objects.ball.body:applyForce(10000, 0)
					else
						objects.ball.body:applyForce(8000, 0)
					end
				end
				objects.ball.body:setActive( true )
				stage_play = false
				draw= false
			end
		end
		if checarToqueCircle(x_mouse, y_mouse, x_stage_replay_button+32, y_stage_replay_button+32, 32 ) then
			love.mouse.setVisible(true)
			if love.mouse.isDown(1) and stage_replay and not passou and  not fail then
				love.audio.play( click )
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
				score_update = true
			end
		end
		if checarToqueCircle(x_mouse, y_mouse, x_stage_help_button+32, y_stage_help_button+32, 32 ) then
			love.mouse.setVisible(true)
			if love.mouse.isDown(1) and stage_help and not passou and not fail and stage_play then
				love.audio.play( click )
				help = true
				stage_help = false
				stage_play=false
				draw = false
			end
		end
		if love.keyboard.isDown("escape") and help and not stage_help then
			love.audio.play( click )
			help = false
			stage_help = true
			draw = true
			stage_play=true
		end
		if love.mouse.isDown(1) and stage_play then 
			if checarToqueCircle(x_mouse, y_mouse, x_stage_arrow_button+32 , y_stage_arrow_button +32, 32 ) and stage_arrow and (stage == 2 or stage == 4 or stage == 5) then
				love.audio.play( click )
				if arrow_right_active then
					arrow_left_active = true
					arrow_right_active= false
					stage_arrow = false
				elseif arrow_left_active then
					arrow_right_active = true
					arrow_left_active = false
					stage_arrow = false
				end
				elseif checarToqueCircle(x_mouse, y_mouse, x_stage_ball_button+32 , y_stage_ball_button +32, 32 ) and stage_ball and (stage == 4 or stage == 5) then
					love.audio.play( click )
				if yoga_ball_active then
					beach_ball_active = true
					yoga_ball_active = false
					objects.ball.fixture:setRestitution(0.7)
					stage_ball = false
				elseif beach_ball_active then
					yoga_ball_active = true
					beach_ball_active = false
					objects.ball.fixture:setRestitution(0)
					stage_ball = false
				end
			end
			else stage_ball = true
				stage_arrow = true
			end
		end
end

function sideMenu_draw()
	-------------------------side bar--------------------------------------
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle( "fill", -10, -10 , 100 , height+10)
	love.graphics.setColor(0, 0, 0)
	love.graphics.rectangle( "line", -10, -10 , 100 , height+10)
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(stage_play_button, x_stage_play_button, y_stage_play_button)
	love.graphics.draw(stage_replay_button, x_stage_replay_button, y_stage_replay_button)
	love.graphics.draw(stage_help_button, x_stage_help_button, y_stage_help_button)
	if (stage == 2 or stage == 4 or stage == 5) then
		love.graphics.draw(stage_arrow_button, x_stage_arrow_button, y_stage_arrow_button)
	end
	if stage == 4 or stage == 5 then
		love.graphics.draw(stage_ball_button, x_stage_ball_button, y_stage_ball_button)
	end
end