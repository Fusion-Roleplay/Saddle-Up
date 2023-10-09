DataUtils = {}

function DataUtils:createEventStruct(dataSize)
    local struct = DataView.ArrayBuffer(8*dataSize)
    for i = 0, dataSize-1 do 
        struct:SetInt32(i*8 ,0)
    end
    struct:SetInt32(0, 0)
    return struct
end