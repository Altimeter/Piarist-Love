debug = true

function love.load(arg)

	x = 0
	y = 0
	xchange = 5
	ychange = 5
end

function love.update(dt)

	if love.keyboard.isDown("right")
		then
		x = x + xchange
	elseif love.keyboard.isDown("left")
		then
		x = x - xchange
	end

	if love.keyboard.isDown("up")
		then
		y = y - xchange
	elseif love.keyboard.isDown("down")
		then
		y = y + xchange
	end

	if love.keyboard.isDown("1") and love.keyboard.isDown("3")
		then
			love.event.quit()
		end

end

function love.draw(dt)
	love.graphics.setColor(255,0,0)
	love.graphics.circle("fill", x30, y10, 60, 60)
	love.graphics.setColor(0,255,0)
	love.graphics.circle("fill", 200+x, y+200, 60, 60)
	love.graphics.setColor(0,255,255)
        love.graphics.square("fill", x-200, y-200, 60, 60)
	love.graphics.setColor(255,0,255)
	love.graphics.circle("fill", x+200, y-200, 60, 60)
	love.graphics.setColor(0,0,255)
	love.graphics.circle("fill", x-200, y+200, 60, 60)

end
