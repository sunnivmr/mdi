--
--
--	----------------------------------------------------------
--	Mosaic | OF Visual Patching Developer Platform
--
--
--	Mosaic is distributed under the MIT License. This gives everyone the
--    freedoms to use Mosaic in any context: commercial or non-commercial,
--    public or private, open or closed source.
--
--    See https://github.com/d3cod3/Mosaic for documentation
--	----------------------------------------------------------
--
--
--	empty.lua: A Lua script template for Mosaic,
--	mimicking the standard OF app structure
--
--


-- variables for mouse interaction
mouseX = 0
mouseY = 0

posY = 0

r = 0
g = 0
b = 0

----------------------------------------------------
function setup()

end

----------------------------------------------------
function update()
	posY = posY + 1

	if posY > OUTPUT_HEIGHT then
		posY = 0
	end

	r = of.random(128, 255)
	g = of.random(128, 255)
	b = of.random(128, 255)

end

----------------------------------------------------
function draw()
	of.background(0, 0, 0)

	--- Straight white line
	of.setLineWidth(4)
	of.setColor(255)
	of.drawLine(0, posY, OUTPUT_WIDTH, posY)

	--- Diagonal flashing lines
	of.setLineWidth(5)
	of.setColor(r, g, b)
	of.drawLine(0, posY, OUTPUT_WIDTH, posY+500)
	of.drawLine(0, posY+500, OUTPUT_WIDTH, posY)

	of.drawLine(0, posY, OUTPUT_WIDTH, posY-500)
	of.drawLine(0, posY-500, OUTPUT_WIDTH, posY)


	--- Circles going right
	of.setColor(255, 166, 0)
	of.drawCircle(posY, posY, 0, 30)

	of.setColor(166, 255, 0)
	of.drawCircle(150+posY, posY, 0, 60)

	of.setColor(166, 166, 255)
	of.drawCircle(150+posY, posY, 0, 30)

	of.setColor(0, 166, 255)
	of.drawCircle(300+posY, posY, 0, 40)

	of.setColor(166, 0, 255)
	of.drawCircle(400+posY, posY, 0, 30)

	of.setColor(255, 0, 166)
	of.drawCircle(550+posY, posY, 0, 60)

	--- Circles stationary
	of.setColor(166, 255, 0)
	of.drawCircle(800, posY, 0, 50)

	--- Circles going left
	of.setColor(0, 255, 166)
	of.drawCircle(800-posY, posY, 0, 50)

	of.setColor(0, 166, 255)
	of.drawCircle(950-posY, posY, 0, 30)

	of.setColor(255, 166, 255)
	of.drawCircle(800-posY, posY, 0, 20)

	of.setColor(0, 166, 255)
	of.drawCircle(950-posY, posY, 0, 30)

	of.setColor(166, 0, 255)
	of.drawCircle(1100-posY, posY, 0, 35)

	of.setColor(0, 166, 255)
	of.drawCircle(1250-posY, posY, 0, 45)

end

----------------------------------------------------
function exit()

end


-- input callbacks

----------------------------------------------------
function keyPressed(key)

end

function keyReleased(key)

end

function mouseMoved(x,y)
	mouseX = x
	mouseY = y
end

function mouseDragged(x,y)
	mouseX = x
	mouseY = y
end

function mouseReleased(x,y)

end

function mouseScrolled(x,y)

end
