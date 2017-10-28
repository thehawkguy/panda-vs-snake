Stack = Object:extend()

function Stack:new()
 self.t = {}
end

function Stack:spush(value)
  table.insert(self.t, value)
end

function Stack:spop()
  return table.remove(self.t)
end

-- spezieller Stack, der weiß, wie man mit Fonts umgeht.
FontStack = Stack:extend()

function FontStack:new()
  FontStack.super.new(self)
end

function FontStack:push(font)
  self:spush(love.graphics.getFont())
  if font then
    love.graphics.setFont(font)
  end
end

function FontStack:pop()
  love.graphics.setFont(self:spop())
end

ColorStack = Stack:extend()

function ColorStack:new()
  ColorStack.super.new(self)
end

function ColorStack:push(r, g, b, a)
  self:spush({love.graphics.getColor()})
   if a then
    love.graphics.setColor(r, g, b, a)
  end
end

function ColorStack:pop()
  local tmp = self:spop()
  love.graphics.setColor(tmp[1], tmp[2], tmp[3], tmp[4])
end
