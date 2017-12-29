function images_load()
	------------------------------------menu----------------------------------------
	play_button = love.graphics.newImage("images/menu/play-button.png")
	play_button_pressed = love.graphics.newImage("images/menu/play-button_pressed.png")
	scores_button = love.graphics.newImage("images/menu/scores-button.png")
	scores_button_pressed = love.graphics.newImage("images/menu/scores-button_pressed.png")
	exit_button = love.graphics.newImage("images/menu/exit-button.png")
	exit_button_pressed = love.graphics.newImage("images/menu/exit-button_pressed.png")

	----------------------------------next menu-------------------------------------
	next_menu = love.graphics.newImage("images/next_menu/next-menu.png")
	next_menu_fail = love.graphics.newImage("images/next_menu/next-menu_fail.png")
	next_button = love.graphics.newImage("images/next_menu/next-button.png")
	next_button_pressed = love.graphics.newImage("images/next_menu/next-button_pressed.png")
	try_again_button = love.graphics.newImage("images/next_menu/tentar-novamente-button.png")
	try_again_button_pressed = love.graphics.newImage("images/next_menu/tentar-novamente-button_pressed.png")
	menu_button = love.graphics.newImage("images/next_menu/menu-button.png")
	menu_button_pressed = love.graphics.newImage("images/next_menu/menu-button_pressed.png")

	----------------------------------score stars---------------------------------------
	score_star_1 = love.graphics.newImage("images/score_stars/score_star.png")
	score_star__1_full = love.graphics.newImage("images/score_stars/score_star_full.png")
	score_star_2 = love.graphics.newImage("images/score_stars/score_star.png")
	score_star__2_full = love.graphics.newImage("images/score_stars/score_star_full.png")
	score_star_3 = love.graphics.newImage("images/score_stars/score_star.png")
	score_star__3_full = love.graphics.newImage("images/score_stars/score_star_full.png")

	-------------------------------------ball---------------------------------------------
	arrow_right= love.graphics.newImage("images/ball/arrow-right.png")
	stage_play_button= love.graphics.newImage("images/ball/stage-play-button.png")
	stage_replay_button= love.graphics.newImage("images/ball/stage-replay-button.png")
	stage_help_button= love.graphics.newImage("images/ball/stage-help-button.png")
	ball = love.graphics.newImage("images/ball/ball.png")
	beach_ball = love.graphics.newImage("images/ball/beach-ball.png")
	golf_ball =love.graphics.newImage("images/ball/golf-ball.png") 

	-------------------------------------flag-------------------------------------------
	flag = love.graphics.newImage("images/scenario/flag.png")
	booster = love.graphics.newImage("images/scenario/speed-booster.png")
end


----------------------------animação das estrelas-----------------------------------
function animation_load()
    star = newstar(love.graphics.newImage("images/score_stars/star.png"), 30, 30, 0.5)
end

function animation_update(dt)
    star.currentTime = star.currentTime + dt
    if star.currentTime >= star.duration then
        star.currentTime = star.currentTime - star.duration
    end
end

function animation_draw()
    local spriteNum = math.floor(star.currentTime / star.duration * #star.quads) + 1
    love.graphics.draw(star.spriteSheet, star.quads[spriteNum], 100, 100, 0, 1)
end

function newstar(image, width, height, duration)
    local star = {}
    star.spriteSheet = image;
    star.quads = {};

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(star.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    star.duration = duration or 1
    star.currentTime = 0

    return star
end
---------------------------------------------------------------------------------------