function stage6_load()
	stage_6_play = false
	nextMenu_load()
	sideMenu_load()
	win_sound_playable = true
	world_6 = love.physics.newWorld(0, 5*64, true)
	objects = {}
	---------------------------------platform--------------------------------------------
	objects.platform_ball = {}
	objects.platform_ball.body = love.physics.newBody(world_6, 100,(height*9/10))
	objects.platform_ball.shape = love.physics.newRectangleShape(300, 50)
	objects.platform_ball.fixture = love.physics.newFixture(objects.platform_ball.body, objects.platform_ball.shape)

	objects.platform_middle = {}
	objects.platform_middle.body = love.physics.newBody(world_6, 0,(height/2+50))
	objects.platform_middle.shape = love.physics.newRectangleShape(width*3, 75)
	objects.platform_middle.fixture = love.physics.newFixture(objects.platform_middle.body, objects.platform_middle.shape)
	--------------------------------ball--------------------------------------------------
	objects.ball = {}
	objects.ball.body = love.physics.newBody(world_6, 210,(height*9/10)-47, "dynamic")
	objects.ball.shape = love.physics.newCircleShape(21)
	objects.ball.fixture = love.physics.newFixture(objects.ball.body, objects.ball.shape)
	x_ball, y_ball = objects.ball.body:getX(), objects.ball.body:getY()
	objects.ball.body:setActive( false )
	rotation = math.pi

	--------------------------------side bar--------------------------------------------------
	x_stage_play_button= 15
	y_stage_play_button= 50

	x_stage_replay_button = x_stage_play_button 
	y_stage_replay_button = height - 150

	x_stage_help_button =  x_stage_play_button 
	y_stage_help_button = height - 75

	x_arrow_right =  x_ball + 40
	y_arrow_right =  y_ball - 35

	stage_play = true --controle
	stage_replay=true -- controle
	stage_help = true
	help = false
	-------------------------line---------------------------------------------------------
	mouse_positions = {}
	size = 4,5
	width_line = -100
	height_line = -100
	draw= true
	--line
	objects.line={}
	objects.line.body = love.physics.newBody(world_6, width_line, height_line)
	objects.line.shape = love.physics.newCircleShape(size)
	objects.line.fixture = love.physics.newFixture(objects.line.body, objects.line.shape)
	-----------------------flag---------------------------------------------------------
	x_flag=150
	y_flag=(height/2)-115
	passou= false
	fail=false
	--------------------------portal----------------------------------------------
	x_portal_1= width - 100 +27
	y_portal_1= height*4/5 +90

	x_portal_2= width- 30 
	y_portal_2= height/4 +25
	portal_active = true
	------------------------------speed booster------------------------------------
	x_booster_1= x_ball + 200
	y_booster_1= y_ball - 50

	x_booster_2= x_portal_2 - 300
	y_booster_2= height /2 
	------------------------stars------------------------------------------------------
	score= 0
	x_star1= x_flag + width*1/5
	y_star1= y_flag + 75
	star_1_collision = false

	x_star2= width/2 + 200
	y_star2= height-180
	star_2_collision = false

	x_star3= x_portal_2 - 100
	y_star3= y_portal_2 + 50
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

function stage6_update(dt)
	world_6:update(dt)
	sideMenu_update(dt)
	x_mouse, y_mouse = love.mouse.getPosition( )
	x, y = love.mouse.getPosition( )
	velocX_bola, velocY_bola = objects.ball.body:getLinearVelocity( )
	x_ball, y_ball = objects.ball.body:getX(), objects.ball.body:getY()

	------------------------line-----------------------------------------

	if draw then
		love.mouse.setVisible( false )
	end
	if checaToqueRectangle(x_mouse,y_mouse, x_stage_play_button, y_stage_play_button, 64, 64) then
		love.mouse.setVisible( true )
	end
	color_black = {0, 0, 0}
	down = love.mouse.isDown(1)

	if down and draw then
		mouse_positions[#mouse_positions + 1] = {color_black, x, y, size}
		width_line = x
		height_line = y
		objects.line={}
		objects.line.body = love.physics.newBody(world_6, width_line, height_line)
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
	----------------------------------portal---------------------------------------------
	if checaToqueRectangle(objects.ball.body:getX(),objects.ball.body:getY(), x_portal_1-54,  y_portal_1 -150 , 50, 140) and portal_active then 
		objects.ball.body:setPosition(x_portal_2 -50, y_portal_2 -75)
		objects.ball.body:setLinearVelocity(-velocX_bola, velocY_bola)
		love.audio.play( portal_sound )
		portal_active = false
	else portal_active = true
	end
	-----------------------------booster---------------------------------------
	if checaToqueRectangle(x_ball, y_ball, x_booster_1, y_booster_1, 64, 64)then
		objects.ball.body:applyForce(1500, 0)
		love.audio.play( booster_sound )
	elseif checaToqueRectangle(x_ball, y_ball, x_booster_2-64, y_booster_2-64, 64, 64) then
		objects.ball.body:applyForce(-1500, 0)
		love.audio.play( booster_sound )
	end
end

function stage6_draw()
   	love.graphics.setFont(font_low)
   	----------------------------portal----------------------------------------
	local spriteNum = math.floor(portal.currentTime / portal.duration * #portal.quads) + 1
    love.graphics.draw(portal.spriteSheet, portal.quads[spriteNum], x_portal_1, y_portal_1, math.rad(180), 1)
    love.graphics.draw(portal.spriteSheet, portal.quads[spriteNum], x_portal_2, y_portal_2, math.rad(180), 1)
	------------------------------ball--------------------------------------
	love.graphics.setColor(0, 0, 0)
	love.graphics.polygon("fill", objects.platform_ball.body:getWorldPoints(objects.platform_ball.shape:getPoints()))
	love.graphics.polygon("fill", objects.platform_middle.body:getWorldPoints(objects.platform_middle.shape:getPoints()))
	love.graphics.setColor(255, 255, 255)
	love.graphics.draw(ball, objects.ball.body:getX(), objects.ball.body:getY(),rotation, 1, 1, 21, 21)
	if stage_play then
		love.graphics.draw( arrow_right, x_arrow_right, y_arrow_right)
	end
	---------------------------booster-----------------------------------
	love.graphics.draw( booster, x_booster_1, y_booster_1)
	love.graphics.draw( booster, x_booster_2, y_booster_2,  math.rad(180))

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
		love.graphics.print( "* Use o mouse para desenhar na tela", (width/3- 75) + 15 , (height/10) + 25)
		love.graphics.print( "* O objetivo é fazer com que a bola toque na bandeira", (width/3- 75) + 15, (height/10) + 50)
		love.graphics.print( " para cada estrela você ganha 100 pontos e para cada ", (width/3- 75) + 40, (height/10) + 75)
		love.graphics.print( "  estrela extra você ganha + 50 pontos ", (width/3- 75) + 15 , (height/10) + 100)
		love.graphics.print( 'O botão "play" impulsiona a bola na direção da seta', (width/3- 75) + 50 , (height/10) + 135)
		love.graphics.print( 'O botão "replay" reinicia a fase', (width/3- 75) + 50 , (height/10) + 170)
		love.graphics.print( " No decorrer do jogo novos objetos e novas interações irão", (width/3- 75) + 50 , (height/10) + 205)
		love.graphics.print( 'aparecer, então quando precisar de ajuda clique no botão "help"', (width/3- 75) + 15 , (height/10) + 230)
		love.graphics.print( '"esc" para sair do menu de ajuda', 350 + (width/3 - 75) , (height/10)+ (height*4/10) -50 )
		love.graphics.setColor(255, 255, 255)
		love.graphics.draw(star.spriteSheet, star.quads[spriteNum], (width/3- 75) + 15 , (height/10) + 75, 0, 1)
		love.graphics.draw( stage_play_button, (width/3- 75) + 15 , (height/10) + 135, 0, 1/2, 1/2)
		love.graphics.draw( stage_replay_button, (width/3- 75) + 15 , (height/10) + 170, 0, 1/2, 1/2)
		love.graphics.draw( stage_help_button, (width/3- 75) + 15 , (height/10) + 205, 0, 1/2, 1/2)
	end
	-------------------------side menu--------------------------------------
	sideMenu_draw()
end

