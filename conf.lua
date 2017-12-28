function conf_load()
	love.physics.setMeter(64)
	width, height = love.window.getDesktopDimensions( 1 )
	--success = love.window.setMode( width, height)
	love.graphics.setBackgroundColor(255, 255, 255)
	love.window.setFullscreen( true )
	stage= 0 ---------mude isso aqui depois gabriel
	font = love.graphics.newFont( "font/antiqua.ttf",48)
	font_low = love.graphics.newFont( "font/antiqua.ttf",24)
end