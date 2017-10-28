-- hawkkeys ist quasi mein erste, kleine library. Die ich einfach dafür benutzen möchte, wenn ich 
  -- beim programm schreiben schnell das programm beenden oder neu laden will.

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  elseif key == "r" then
    love.load()
  end
end
