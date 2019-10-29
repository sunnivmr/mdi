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

showRight = true
showLeft = true
showCircle = true
showStar = true

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
			if showRight then
				of.drawLine(OUTPUT_WIDTH, 0, j*y, OUTPUT_HEIGHT)
			end

			if showLeft then
				of.drawLine(x, 0, x*i, OUTPUT_HEIGHT) -- drawLine(x1, y1, x2, y2)
			end
		end
	end

	x = OUTPUT_WIDTH/2 + 10
	y = OUTPUT_HEIGHT/2 + 10

	if showCircle then
		of.fill()
		of.setColor(50, 50, 255)
		of.setCircleResolution(50)

		for i=0,200 do
			of.drawCircle(x, y, i) --drawCircle(posx, posy, radio)
		end

	end

	if showStar then
		of.fill()
		of.setColor(255, 0, 255)
		of.drawTriangle(x-100, y+50, x, y-120, x+100, y+50) -- drawTriangle(x1, y1, x2, y2, x3, y3)
		of.drawTriangle(x-100, y-50, x, y+100, x+100, y-50)
	end


end

----------------------------------------------------
function exit()

end


-- input callbacks

----------------------------------------------------
function keyPressed(key)
	if key == string.byte('r') then
		showRight = not showRight
	end

	if key == string.byte('l') then
		showLeft = not showLeft
	end

	if key == string.byte('c') then
		showCircle = not showCircle
	end

	if key == string.byte('s') then
		showStar = not showStar
	end
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
