exports('log', function (title, name, text, footer, options)
    local logs = ""
    local webhook = options.webhook
    local color = options.color
    local title = title
    logs = {
        {
            ["color"] = color,
            ["title"] = title,
            ["description"] = text,
            ["footer"] = {["text"]=footer}
        }
    }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({["username"] = name , embeds = logs}), { ['Content-Type'] = 'application/json' })
end)