function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  elseif key == "r" then
    love.load()
  end
end
