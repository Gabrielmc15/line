function objects()
	objects = {}	
	--platforms
	objects.platform_right = {}
	objects.platform_right.body = love.physics.newBody(world, 0,(height/4))
	objects.platform_right.shape = love.physics.newRectangleShape(300, 50)
	objects.platform_right.fixture = love.physics.newFixture(objects.platform_right.body, objects.platform_right.shape)
end