button = {}
function button.load()
 startb={
  x=10,
  y=400,
  w=200,
  h=30
 }

 exitb={
  x=10,
  y=450,
  w=200,
  h=30
 }


 pauseb={
  x=300,
  y=30,
  w=30,
  h=30,
  image1=love.graphics.newImage("Images/pause1.png"),
  image2=love.graphics.newImage("Images/pause2.png")
 }

 resumeb={
  x=10,
  y=350,
  w=200,
  h=30
 }

 restartb={
  x=10,
  y=400,
  w=200,
  h=30
 }

 start=true
 working=false
 pause=false

 buttons = love.audio.newSource("Sfx/Button.mp3","static")

 highscore=0

end


function button.draw()
 local t = love.touch.getTouches()
 local x,y = -1000,-1000
 for i,v in ipairs(t) do
  x,y = love.touch.getPosition(v)
 end

 if pause==true then
  if x>restartb.x and y>restartb.y then
   if x<restartb.x+restartb.w and y<restartb.y+restartb.h then
    start=false
    working=true
    pause=false
    score=0
    buttons:play()
    love.graphics.rectangle("fill",restartb.x,restartb.y,restartb.w,restartb.h,5)
    love.graphics.setColor(0,0,0)
    love.graphics.print("RESTART",restartb.x+restartb.w/2-18,restartb.y+restartb.h/2-8)
    love.graphics.setColor(1,1,1)
   end
  end
 end

 if pause==true then
  if x>resumeb.x and y>resumeb.y then
   if x<resumeb.x+resumeb.w and y<resumeb.y+resumeb.h then
    start=false
    working=true
    pause=false
    buttons:play()
    love.graphics.rectangle("fill",resumeb.x,resumeb.y,resumeb.w,resumeb.h,5)
    love.graphics.setColor(0,0,0)
    love.graphics.print("RESUME",resumeb.x+resumeb.w/2-18,resumeb.y+resumeb.h/2-8)
    love.graphics.setColor(1,1,1)
   end
  end
 end
 

 if start==false and working==true then
  if x>pauseb.x and y>pauseb.y then
   if x<pauseb.x+pauseb.w and y<pauseb.y+pauseb.h then
    start=false
    working=false
    pause=true
    buttons:play()
    love.graphics.rectangle("fill",pauseb.x,pauseb.y,pauseb.w,pauseb.h,5)
    love.graphics.setColor(0,0,0)
    love.graphics.draw(pauseb.image2,pauseb.x+5,pauseb.y+5)
    love.graphics.setColor(1,1,1)
   end
  end
 end
 
 
 if start==true then
  if x>startb.x and y>startb.y then
   if x<startb.x+startb.w and y<startb.y+startb.h then
    start=false
    working=true
    buttons:play()
    love.graphics.rectangle("fill",startb.x,startb.y,startb.w,startb.h,5)
    love.graphics.setColor(0,0,0)
    love.graphics.print("START",startb.x+startb.w/2-18,startb.y+startb.h/2-8)
    love.graphics.setColor(1,1,1)
   end
  end
 end
 
 if start==true or pause==true then
  if x>exitb.x and y>exitb.y then
   if x<exitb.x+exitb.w and y<exitb.y+exitb.h then
    love.event.quit()
    love.graphics.rectangle("fill",exitb.x,exitb.y,exitb.w,exitb.h,5)
    love.graphics.setColor(0,0,0)
    love.graphics.print("EXIT",exitb.x+exitb.w/2-13,exitb.y+exitb.h/2-8)
    love.graphics.setColor(1,1,1)
   end
  end
 end
end 
 
function button.update(dt)

 if score>highscore then highscore=highscore+1 end

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
