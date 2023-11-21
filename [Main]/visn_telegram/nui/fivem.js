var po_location = "";
var po_area = "";
var po_price = 0;
let telegramNumber = 0;

window.addEventListener('message', (event) => {
    const data = event.data.data;

    switch (event.data.type) {
        case "open":
            preloadTelegrams(data.telegrams);
            preloadContacts(data.contacts);
            setLocation(data.location, data.area);
            setTelegramNumber(data.number);

            telegramNumber = data.number;
            po_location = data.location;
            po_area = data.area;
            po_price = data.price;

            $("#price").text(data.price.toFixed(2));

            loadTelegrams(1);
            loadContacts(1);

            $(".telegram_dashboard .telegram_table_filter input").val("");

            $(".telegram").hide();
            $(".container").show();
            $(".telegram_dashboard").fadeIn("fast");
            break;

        case "refreshData":
            preloadTelegrams(data.telegrams);
            preloadContacts(data.contacts);
            loadTelegrams(1);
            loadContacts(1);
            break;

        case "openTelegram":
            const telegramData = data[0];
            if(telegramData == undefined) return;
            
            $(".telegram_message_simple .title_content").text(telegramData.title);
            $(".telegram_message_simple .message_content").text(telegramData.content);
            $(".telegram_message_simple .telegram_sender_text").text(telegramData.sender);
            $(".telegram_message_simple .telegram_recipient_text").text(telegramData.receiver);
            $(".telegram_message_simple .telegram_date_text").text(getDateFormat(new Date(telegramData.date)));

            $(".telegram_message_simple .telegram_location_text").text(telegramData.sender_location);
            $(".telegram_message_simple .telegram_area_text").text(telegramData.sender_area);

            $(".telegram").hide();
            $(".container").show();
            $(".telegram_message_simple").fadeIn("fast");
            break;

        case "close":
            $(".container").hide();
            $(".telegram").hide();
            $(".input_field").hide();
            $(".telegram_dashboard .telegram_table_filter input").val("");
            break;
    }
});

function refreshData() {
    fetch(`https://${GetParentResourceName()}/refreshData`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({})
    });
}

function addContact(name, number, note) {
    if (name == "" || number == "") return;

    fetch(`https://${GetParentResourceName()}/addContact`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            name: name,
            number: number,
            note: note
        })
    });

    const highestId = Math.max.apply(Math, contacts.map(function (o) { return o.id; }))
    const data = {
        id: highestId + 1,
        name: name,
        number: number,
        note: note
    };

    contacts.push(data);
    loadContacts(1);
}

function sendTelegram(title, content, receiver, sender) {
    if (title == "" || content == "" || receiver == "" || sender == "") return;
    if (receiver == telegramNumber) return;

    fetch(`https://${GetParentResourceName()}/sendTelegram`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            sender: sender,
            location: po_location,
            area: po_area,
            title: title,
            content: content,
            receiver: receiver,
            price: po_price
        })
    }).then((response) => response.json());

    $(".telegram").hide();
    $(".telegram_dashboard").show();
}

function readTelegram(id, telegramId) {
    if (id == "" || telegramId == "") return;

    fetch(`https://${GetParentResourceName()}/readTelegram`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            id: id,
            telegramId: telegramId
        })
    }).then((response) => response.json());
}

function deleteTelegram(id) {
    if (id == "") return;

    fetch(`https://${GetParentResourceName()}/deleteTelegram`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            id: id
        })
    });

    telegrams = telegrams.filter(function (telegram) {
        return telegram.id != id;
    });

    loadTelegrams(1);
}

function retrieveTelegram(id) {
    if (id == "") return;

    fetch(`https://${GetParentResourceName()}/retrieveTelegram`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            id: id
        })
    });
}

function deleteContact(id) {
    if (id == "") return;

    fetch(`https://${GetParentResourceName()}/deleteContact`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({
            id: id
        })
    });

    contacts = contacts.filter(function (contact) {
        return contact.id != id;
    });

    loadContacts(1);
}

function closeMenu() {
    fetch(`https://${GetParentResourceName()}/closeMenu`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({})
    }).then((response) => response.json());

    $(".container").hide();
    $(".telegram").hide();
}