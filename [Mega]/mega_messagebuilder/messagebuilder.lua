MessageBuilder = {}

function MessageBuilder:new(msg) 
    local this = {
        msg = msg
    }
    setmetatable(this, self)
    self.__index = self;
    return this
end

function MessageBuilder:setParam(param, value)
    self.msg = self.msg:gsub(param, value)
    return self
end

function MessageBuilder:build()
    return self.msg
end