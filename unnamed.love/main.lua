debug = true

function love.load(arg)

	x =50
        y = 0
	badspeed = 5
	dy = 0
	g = 0.06
	jumpPower = 15
	xchange = 5
	ychange = 5
	circsize = 30
	ymin = circsize
	xmin = circsize
	ymax = love.window.getHeight() - 2*circsize 
	xmax = love.window.getWidth() - circsize 
	badx = xmax
	bady = ymax
	shootx = 75
	shooty = 75
	shootsize = 25
	shootlive = false
	shootspeed = 70
	gameon = false
	credits = 1

	canAcceptCredits = false
end

function love.update(dt)

	if love.keyboard.isDown("1") and love.keyboard.isDown("3")
		then
			love.event.quit()
		end

	if love.keyboard.isDown("4")
		then
			if canAcceptCredits == true
				then
					credits = credits + 1
					canAcceptCredits = false
				end
		else
			canAcceptCredits = true
		end
	
	
	if gameon == true
		then

		if y >= ymax
			then
				y = ymax
				dy = 0
				if love.keyboard.isDown("up")
					then
						dy = -jumpPower
					end

			else
				dy = dy + g
			end

		y = y + dy
		dy = dy + g
	

		if y < ymin
			then
				y = ymin
				dy = 0
			end

		if love.keyboard.isDown(" ") and shootlive == false
			then
				shootlive = true
				shootx = x
				shooty = y + circsize
			end

		if shootlive == true
			then
				if shootx > xmax + circsize
				then
					shootlive = false
				else
					shootx = shootx + shootspeed
				end
			end

		if badx < xmin - circsize
			then
				badx = xmax + circsize
				bady = love.math.random(ymin, ymax)
			else
				badx = badx - badspeed
			end
		if (shooty-bady)^2 + (shootx-badx)^2 < (shootsize + circsize)^2
			then
				shootlive = false
				badx = -50
			end


		else
		if love.keyboard.isDown("5") and credits > 0
			then
			gameon = true
			credits = credits - 1
		end
	end

end

function love.draw(dt)

	love.graphics.setColor(255,255,255)
	love.graphics.print("Credits: ", 0, 0)
	love.graphics.print(credits, 60, 0)

	if gameon == true
		then
		love.graphics.setColor(255,0,0)
		love.graphics.rectangle("fill", x, y, circsize, 2*circsize)
		love.graphics.setColor(255,180,180)
		love.graphics.circle("fill", badx, bady, circsize, circsize)
		if shootlive == true
			then
				love.graphics.setColor(255,255,0)
				love.graphics.circle("fill", shootx, shooty, shootsize, shootsize)
			end

	end
end
