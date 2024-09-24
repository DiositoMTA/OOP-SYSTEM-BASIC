
function ClaseBase()
    local clase = {}

    function clase:new()
        local obj = {}
        setmetatable(obj, self)
        self.__index = self
        return obj
    end

    return clase
end

function ExtenderClase(baseClase)
    local nuevaClase = ClaseBase()
    setmetatable(nuevaClase, {__index = baseClase})
    return nuevaClase
end

Vehiculo = ClaseBase()

function Vehiculo:new(tipo, velocidad, color)
    local obj = ClaseBase().new(self)
    obj.tipo = tipo
    obj.velocidad = velocidad
    obj.color = color
    return obj
end

function Vehiculo:hacerBocina()
    outputChatBox("AUTO " .. self.tipo .. " COLOR " .. self.color, 255, 255, 0)
end

function Vehiculo:acelerar()
    outputChatBox("AUTO " .. self.tipo .. " VELOCIDAD " .. tostring(self.velocidad) .. " km/h", 0, 255, 0)
end

Auto = ExtenderClase(Vehiculo)

function Auto:new(velocidad, color, modelo)
    local obj = Vehiculo.new(self, "Auto", velocidad, color)
    obj.modelo = modelo
    return obj
end

function Auto:acelerar()
    outputChatBox("AUTO " .. self.modelo .. " VELOCIDAD PICO: " .. tostring(self.velocidad) .. " km/h", 0, 255, 255)
end

addCommandHandler("crearveh", function(player)
    local miVehiculo = Vehiculo:new("Moto", 120, "Rojo")
    miVehiculo:hacerBocina()
    miVehiculo:acelerar()

    local miAuto = Auto:new(180, "Azul", "Deportivo")
    miAuto:hacerBocina()
    miAuto:acelerar()
end)
