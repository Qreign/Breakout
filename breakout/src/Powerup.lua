Powerup = Class{}

function Powerup:init(x, y, key)
	self.x = x
	self.y = y
	self.dx = 0
	self.dy = 30
	self.width = 16
	self.height = 16
	if key then
		self.skin = math.random(9, 10)
	else
		self.skin = 9
	end
	self.collided = false
end

function Powerup:update(dt)
		self.y = self.y + self.dy * dt
end

function Powerup:collides(target)
	-- first, check to see if the left edge of either is farther to the right
	-- than the right edge of the other
	if self.x > target.x + target.width or target.x > self.x + self.width then
		return false
	end

	-- then check to see if the bottom edge of either is higher than the top
	-- edge of the other
	if self.y > target.y + target.height or target.y > self.y + self.height then
		return false
	end

	-- if the above aren't true, they're overlapping
	return true
end

function Powerup:render()
		love.graphics.draw(gTextures['main'], gFrames['powerups'][self.skin], self.x, self.y)
end

function Powerup.showKey(key)
	if key then
		love.graphics.draw(gTextures['main'], gFrames['powerups'][10], 5, 5)
	end

end
