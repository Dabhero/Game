scene = {}

function scene.load()

 require "button"
 button.load()

 text = love.graphics.newImage("Images/text.png")
 pauset = love.graphics.newImage("Images/Pause_text.png")

end

function scene.draw()
 button.draw()

 if start == true then
  love.graphics.setColor(0,0,0)
  love.graphics.push()
  love.graphics.scale(2,2)
  love.graphics.draw(text)
  love.graphics.pop()
  love.graphics.rectangle("line",startb.x,startb.y,startb.w,startb.h,5)
  love.graphics.print("START",startb.x+startb.w/2-18,startb.y+startb.h/2-8)
  
  love.graphics.rectangle("line",exitb.x,exitb.y,exitb.w,exitb.h,5)
  love.graphics.print("EXIT",exitb.x+exitb.w/2-13,exitb.y+exitb.h/2-8)
 
  love.graphics.setColor(1,1,1)
  
 
 end

 if pause == true then
  love.graphics.push()
  love.graphics.scale(2,2)
  love.graphics.draw(pauset,-40,0)
  love.graphics.pop()
  love.graphics.setColor(0,0,0)
 
  love.graphics.print("Your HighScore = "..highscore,10,300)
 
  love.graphics.rectangle("line",resumeb.x,resumeb.y,resumeb.w,resumeb.h,5)
  love.graphics.print("RESUME",resumeb.x+resumeb.w/2-18,resumeb.y+resumeb.h/2-8)
 
  love.graphics.rectangle("line",restartb.x,restartb.y,restartb.w,restartb.h,5)
  love.graphics.print("RESTART",restartb.x+restartb.w/2-18,restartb.y+restartb.h/2-8)
  
  love.graphics.rectangle("line",exitb.x,exitb.y,exitb.w,exitb.h,5)
  love.graphics.print("EXIT",exitb.x+exitb.w/2-13,exitb.y+exitb.h/2-8)
   
  love.graphics.setColor(1,1,1)
  
 end
 
end

function scene.update(dt)
 button.update(dt)
 

end