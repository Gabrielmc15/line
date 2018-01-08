function stage5_load()
	stage_5_play = false
	nextMenu_load()
	sideMenu_load()
	win_sound_playable = true
	world_5 = love.physics.newWorld(0, 8*64, true)
	objects = {}
	---------------------------------platform--------------------------------------------------------
	objects.platform_right = {}
	objects.platform_right.body = love.physics.newBody(world_5, width/2,(height*1/5)-19)
	objects.platform_right.shape = love.physics.newRectangleShape(150, 15)
	objects.platform_right.fixture = love.physics.newFixture(objects.platform_right.body, objects.platform_right.shape)
	--------------------------------ball--------------------------------------------------
	objects.ball = {}
	objects.ball.body = love.physics.newBody(world_5, width/2 ,(height*1/5)-47, "dynamic")
	objects.ball.shape = love.physics.newCircleShape(21)
	objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape)
	objects.ball.body:setActive( false )
	x_ball, y_ball = objects.ball.body:getX(), objects.ball.body:getY()
	rotation = math.pi
	beach_ball_active = false
	yoga_ball_active = true

	--------------------------------side bar--------------------------------------------------
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
	stage_help = true
	stage_arrow = true
	stage_ball = true
	help = false
	-------------------------espaço indesenhavel----------------------------------------
	grey_space = false
	-------------------------line---------------------------------------------------------
	mouse_positions = {}
	size = 4,5
	width_line = -100
	height_line = -100
	draw= true
	--line
	objects.line={}
	objects.line.body = love.physics.newBody(world_5, width_line, height_line)
	objects.line.shape = love.physics.newCircleShape(size)
	objects.line.fixture = love.physics.newFixture(objects.line.body, objects.line.shape)
	-----------------------flag---------------------------------------------------------
	x_flag=width*3/4
	y_flag=3/4*height+50
	passou= false
	fail=false
	------------------------stars------------------------------------------------------
	score= 0
	x_star1= x_ball - 15
	y_star1= y_ball - 100
	star_1_collision = false

	x_star2= width*3/4 - 90
	y_star2= 3/4*height - 25
	star_2_collision = false

	x_star3= width/2 - 32
	y_star3= height/2 - 175
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

function stage5_update(dt)
	world_5:update(dt)
	sideMenu_update(dt)
	x_mouse, y_mouse = love.mouse.getPosition( )
	x, y = love.mouse.getPosition( )
	velocX_bola, velocY_bola = objects.ball.body:getLinearVelocity( )
	x_ball, y_ball = objects.ball.body:getX(), objects.ball.body:getY()

	------------------------line-----------------------------------------

	if draw or stage_play then
		love.mouse.setVisible( false )
	end
	if checaToqueRectangle(x_mouse,y_mouse, x_stage_play_button, y_stage_play_button, 64, 64) then
		love.mouse.setVisible( true )
	end
	color_black = {0, 0, 0}
	down = love.mouse.isDown(1)

	if down and draw and not grey_space then
		mouse_positions[#mouse_positions + 1] = {color_black, x, y, size}
		width_line = x
		height_line = y
		objects.line={}
		objects.line.body = love.physics.newBody(world_5, width_line, height_line)
		objects.line.shape = love.physics.newCircleShape(size)
		objects.line.fixture = love.physics.newFixture(objects.line.body, objects.line.shape)
	end


	------------------------ball--------------------------------------------
	if  not((passou and  fail) and  next_menu_active) then
		if not passou then
			rotation=rotation+velocX_bola/1000
		end
		if checaToqueRectangle(x_mouse, y_mouse, -10, -10 , 100 , height+10 ) then 
			love.mouse.setVisible( true )
			draw = false
		end
		if stage_play then 
			draw = true
		end
	end
	--------------------------------------------------espaço indesenhavel----------------------------------------
	if checaToqueRectangle(x_mouse,y_mouse, -10, -10, width*1/4 +10, height +10) or checaToqueRectangle(x_mouse,y_mouse, width -(width*1/4), -10, width*1/4, height +10) or checaToqueRectangle(x_mouse,y_mouse, width/2 - 75, -10, 150, height+10) then
		grey_space = true
		draw = false
	elseif stage_play then 
		grey_space = false
		draw = true
	end

end

function stage5_draw()
   	love.graphics.setFont(font_low)
   	----------------------------espaço indesenhavel-------------------------
   	love.graphics.setColor(84,68,68, 255/3)
   	love.graphics.rectangle( "fill", -10, -10, width*1/4 +10, height +10)
   	love.graphics.rectangle( "fill", width -(width*1/4) , -10, width*1/4, height +10 )
   	love.graphics.rectangle( "fill", width/2 - 75, -10, 150, height +10 )
   	love.graphics.setColor(255, 255, 255)
------------------------------ball--------------------------------------

	love.graphics.setColor(0, 0, 0)
	love.graphics.polygon("fill", objects.platform_right.body:getWorldPoints(objects.platform_right.shape:getPoints()))
	--love.graphics.setColor(255, 0, 0, 150)
	love.graphics.setColor(255, 255, 255)
	if beach_ball_active then
		love.graphics.draw(beach_ball, objects.ball.body:getX(), objects.ball.body:getY(),rotation, 1, 1, 21, 21)
	elseif yoga_ball_active then
		love.graphics.draw(ball, objects.ball.body:getX(), objects.ball.body:getY(),rotation, 1, 1, 21, 21)
	end
	if stage_play then
		if arrow_right_active then
			love.graphics.draw( arrow_right, x_arrow_right, y_arrow_right)
		elseif arrow_left_active then
			love.graphics.draw( arrow_left, x_arrow_left, y_arrow_left)
		end
	end

-----------------------------stars----------------------------------------

	love.graphics.setFont(font_low)
	love.graphics.setColor(255, 255, 255)
	local spriteNum = math.floor(star.currentTime / star.duration * #star.quads) + 1
  	if not star_1_collision then
  		love.graphics.setColor(255, 255, 255)
  		love.graphics.draw(star.spriteSheet, star.quads[spriteNum], x_star1, y_star1, 0, 1)
  	else love.graphics.setColor(0, 0, 0,opacity1)
  		love.graphics.print( score, x_score_1, y_score_1)
  	end
  	if not star_2_collision then
  		love.graphics.setColor(255, 255, 255)
  		love.graphics.draw(star.spriteSheet, star.quads[spriteNum], x_star2, y_star2, 0, 1)
  	else love.graphics.setColor(0, 0, 0,opacity2)
  		love.graphics.print( score, x_score_2, y_score_2)
  	end
  	if not star_3_collision then
  		love.graphics.setColor(255, 255, 255)
  		love.graphics.draw(star.spriteSheet, star.quads[spriteNum], x_star3, y_star3, 0, 1)
  	else love.graphics.setColor(0, 0, 0,opacity3)
  		love.graphics.print( score, x_score_3, y_score_3)
  	end
  	love.graphics.setColor(255, 255, 255)
  	--------------------------help-----------------------------------------
  	if help then
		love.graphics.setColor(255, 255, 255)
		love.graphics.rectangle( "fill", (width/3 - 75), (height/10) , 700 , (height*4/10))
		love.graphics.setColor(0, 0, 0)
		love.graphics.rectangle( "line", (width/3- 75), (height/10) , 700 , (height*4/10))
		love.graphics.print( "Cuidado! a bola de praia pode ricocheteiar", (width/3- 75) + 60 , (height/10) + 30)
		love.graphics.print( "Não é possível desenhar nas áreas escuras", (width/3 - 75) +70 , (height/10) + 80)
		love.graphics.print( " O botão com a bola troca de bola", (width/3- 75) + 50 , (height/10) + 135)
		love.graphics.print( " No decorrer do jogo novos objetos e novas interações irão", (width/3- 75) + 50 , (height/10) + 175)
		love.graphics.print( 'aparecer, então quando precisar de ajuda clique no botão "help"', (width/3- 75) + 15 , (height/10) + 200)
		love.graphics.print( '"esc" para sair do menu de ajuda', 350 + (width/3 - 75) , (height/10)+ (height*4/10) -50 )
		love.graphics.setColor(255, 255, 255)
		love.graphics.draw( beach_ball, (width/3- 75) + 15 , (height/10) + 25)
		love.graphics.draw( stage_ball_button, (width/3- 75) + 15 , (height/10) + 135, 0, 1/2, 1/2)
		love.graphics.draw( stage_help_button, (width/3- 75) + 15 , (height/10) + 170, 0, 1/2, 1/2)
		love.graphics.setColor(84,68,68, 255/3)
   		love.graphics.rectangle( "fill", (width/3 - 75) +15 , (height/10) + 75 , 50 , 50)
	end
	-------------------------side menu--------------------------------------
	sideMenu_draw()
end