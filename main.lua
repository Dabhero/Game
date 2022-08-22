function love.load()
 require "scene"
 require "button"
 scene.load()
 button.load()


 floor = love.graphics.newImage("Images/floor.png")
 toilet = love.graphics.newImage("Images/toilet.png")
 shit = love.graphics.newImage("Images/shit.png")
 scoin = love.graphics.newImage("Images/scoin.png")

 fart = love.audio.newSource("Sfx/Fart.mp3","static")

 touchx=0
 touchy=0
 
 toiletx=40
 toilety=100

 score = 0

 tlid={
  x=120,
  y=257,
  w=120,
  h=120
 }

 shits={}

 s=2

 shitp = love.graphics.newParticleSystem(shit,100)

 shitp:setParticleLifetime(0,1)
 shitp:setLinearAcceleration(-3000,-3000,3000,3000)
 shitp:setColors(1, 1, 1, 1, 1, 1, 1, 0)
 shitp:setSizeVariation(1)

 --set portrait
 love.window.setMode(1,2,{resizable=false })

end

function love.update(dt)
 scene.update(dt)
 button.update(dt)
 love.graphics.setDefaultFilter("nearest","nearest",10)
 shitp:update(dt)
 if s<1 then s=1 end


 
end

function love.draw()

 local t = love.touch.getTouches()
 local x,y = x,y
 for i,v in ipairs(t) do
  x,y = love.touch.getPosition(v)
 end

 love.graphics.push()
 love.graphics.scale(2,2)
 love.graphics.draw(floor)
 love.graphics.pop()

 if working==true then
  love.graphics.draw(scoin,10,10)
  love.graphics.setColor(0,0,0)
  love.graphics.print("Score = "..score,50,19)
  love.graphics.setColor(1,1,1)
 
  --shadow
  love.graphics.setColor(0,0,0,0.3)
  love.graphics.circle("fill",180,315,100)
  love.graphics.setColor(1,1,1)

  --particle
  love.graphics.push()
  love.graphics.scale(2,2)
  love.graphics.draw(shitp,toiletx+50,toilety+50)
  love.graphics.pop()

  --toilet
  love.graphics.push()
  love.graphics.scale(2,2)
  love.graphics.draw(toilet,toiletx,toilety)
  love.graphics.pop()
 
  --pause button
  love.graphics.setColor(0,0,0)
  love.graphics.rectangle("line",pauseb.x,pauseb.y,pauseb.w,pauseb.h,5)
  love.graphics.draw(pauseb.image1,pauseb.x+5,pauseb.y+5)
  love.graphics.setColor(1,1,1)
 end


 

 if touchpress==true and touchreleased==nil and working==true then
  if x>tlid.x-22 and x<tlid.x+tlid.w then
   if y>tlid.y-20 and y<tlid.y+tlid.h then
    shitp:emit(100)
    score=score+1
    fart:play()
   end
  end
 end

 if touchpress==true and touchreleased==nil and working==true then
    tlid.x=1000
    tlid.y=1000
 else
  tlid.x=120
  tlid.y=257
 end

  scene.draw()
  button.draw()

end

function love.touchpressed( id, x, y, dx, dy, pressure )
	touchpress=true
	touchreleased=nil
end

function love.touchmoved( id, x, y, dx, dy, pressure )
	touchmoved=true
	touchreleased=nil
end

function love.touchreleased( id, x, y, dx, dy, pressure )
	touchreleased=true	
	touchmoved=nil
	touchpress=nil
end
