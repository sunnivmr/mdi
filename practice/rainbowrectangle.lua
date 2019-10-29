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
--
--


-- variables for mouse interaction
mouseX = 0
mouseY = 0

c = of.Color()
h = 0

----------------------------------------------------
function setup()
	h = OUTPUT_HEIGHT/255
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0, 0, 0)

	for i = 0, 255 do
		c:setHsb(i, 255, 255)
		of.setColor(c.r, c.g, c.b) -- RGB
		of.drawRectangle(0, h*i, OUTPUT_WIDTH, h)
	end

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
