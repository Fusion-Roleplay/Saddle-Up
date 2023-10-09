Disease = {}

function Disease:new(disease) 
    local this = {
        name = disease.name,
        config = disease,
        data = { active = false },
    }
    this._data = CreateProxy(this.data)
    setmetatable(this, self)
    self.__index = self;
    return this
end

function Disease:setActive(active)
    self._data.active = active
end

function Disease:getActive()
    return self.data.active
end

function Disease:getData()
    return self.data
end

function Disease:setData(data)
    self.data = data
end