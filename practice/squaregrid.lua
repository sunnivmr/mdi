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


-- variables for mouse interaction
mouseX = 0
mouseY = 0

----------------------------------------------------
function setup()

end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0, 0, 0)

	of.setColor(255)
	x = OUTPUT_WIDTH/20
	y = OUTPUT_HEIGHT/10
	of.setLineWidth(4)

	for i=1, 20 do
		for j=1, 20 do
			of.drawLine(x*i, 0, x*i, OUTPUT_HEIGHT) -- drawLine(x1, y1, x2, y2)
			of.drawLine(0, y*j, OUTPUT_WIDTH, y*j)
		end
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
