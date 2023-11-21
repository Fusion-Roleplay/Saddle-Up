let telegrams = []
let contacts = [];
let localizationData = undefined;
var year = 1823;

function setYear(data) {
    year = data;
}

function formatAMPM(date) {
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    minutes = minutes < 10 ? '0' + minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;
    return strTime;
}

function getDateFormat(date) {
    return `${date.getDate()}/${date.getMonth() + 1}/${year} ${formatAMPM(date)}`;
}

function showTelegrams(data) {
    $("#telegrams_list").empty();
    data.forEach(telegram => {
        let sender = telegram.sender;
        let senderNumber = extractNumber(sender);

        let text = "" + telegram.sender;

        if (senderNumber) {
            let contact = contacts.find(contact => contact.number == senderNumber);
            if (contact) text = contact.name + " [" + contact.number + "]";
            if (sender.length > 20) text = sender.substring(0, 20) + "...";
        }

        $("#telegrams_list").append(`
            <tr data-opened="${telegram.opened}" data-id=${telegram.id}>
                <td ${!telegram.opened ? "style='font-weight: 600;'" : ""}>${telegram.title}</td>
                <td ${!telegram.opened ? "style='font-weight: 600;'" : ""}>${text}</td>
                <td ${!telegram.opened ? "style='font-weight: 600;'" : ""}>${getDateFormat(new Date(telegram.date))}</td>
                <td class="trash" style="padding-left: 1px;"><img class="trash_bin" style="margin-right: 3px" src="assets/img/trash.png"><img class="retrieve" src="assets/img/receive.png"></td>
            </tr>
        `);
    });

    $(".telegram_dashboard .telegram_table tr").off("click");
    $(".telegram_dashboard .telegram_table tr").click(function () {
        if ($(".telegram_dashboard .telegram_table tr .trash img.retrieve:hover").length != 0) return;

        const telegram = telegrams.find(telegram => telegram.id == $(this).attr("data-id"));
        if (telegram == undefined) return;

        $(".telegram_message .telegram_location_text").text(telegram.sender_location);
        $(".telegram_message .telegram_area_text").text(telegram.sender_area);
        $(".telegram_message .telegram_sender_text").text(telegram.sender);
        $(".telegram_message .telegram_date_text").text(getDateFormat(new Date(telegram.date)));
        $(".telegram_message .telegram_recipient_text").text(telegram.receiver);
        $(".telegram_message .title_content").text(telegram.title);
        $(".telegram_message .message_content").text(telegram.content);

        $(".telegram").hide();
        $(".telegram_message").show();

        readTelegram(telegram.id, telegramNumber);
        telegrams.find(t => t.id == telegram.id).opened = true;
    });

    $(".telegram_dashboard .telegram_table tr .trash img.trash_bin").off("click");
    $(".telegram_dashboard .telegram_table tr .trash img.trash_bin").click(function () {
        const id = $(this).parent().parent().attr("data-id");
        deleteTelegram(id);
    });

    $(".telegram_dashboard .telegram_table tr .trash img.retrieve").click(function (e) {
        const id = $(this).parent().parent().attr("data-id");
        retrieveTelegram(id);
    });
}

function showContacts(data) {
    $("#contacts_list").empty();
    data.forEach(contact => {
        $("#contacts_list").append(`
            <tr data-id=${contact.id} data-number=${contact.number}>
                <td>${contact.name}</td>
                <td>${contact.number}</td>
                <td>${contact.note}</td>
                <td class="trash" style="padding-left: 1px;"><img src="assets/img/trash.png"></td>
            </tr>
        `);
    });

    $(".telegram_contacts .telegram_table tr").off("click");
    $(".telegram_contacts .telegram_table tr").click(function () {
        $(".telegram_compose .telegram_location_text").text("Saint Denis");
        $(".telegram_compose .telegram_area_text").text("Saint Denis");

        $(".telegram_compose .telegram_sender_input input").val(telegramNumber);
        $(".telegram_compose .telegram_recipient_input input").val($(this).attr("data-number"));
        $(".telegram_compose .title_input input").val("");
        $(".telegram_compose .message_input textarea").val("");
        $(".telegram_compose .telegram_date_text").text(getDateFormat(new Date(Date.now())));

        $(".telegram").hide();
        $(".telegram_compose").show();

        $(".telegram_compose .telegram_sender_input input").focus();

        $(".telegram_compose .telegram_sender_input input").off("focus");
        $(".telegram_compose .telegram_sender_input input").on("focus", function () {
            $(".telegram_compose .telegram_sender_input input")[0].setSelectionRange(0, 0);
        });

        $("#send_number").prop("checked", true);

        if (!$(".telegram_compose .telegram_sender_input input").val().includes(telegramNumber))
            $(".telegram_compose .telegram_sender_input input").val($(".telegram_compose .telegram_sender_input input").val() + " " + telegramNumber);
    });

    $(".telegram_contacts .telegram_table tr .trash").off("click");
    $(".telegram_contacts .telegram_table tr .trash").click(function () {
        const id = $(this).parent().attr("data-id");
        deleteContact(id);
    });
}

function preloadTelegrams(data) {
    telegrams = JSON.parse(data);
}

function preloadContacts(data) {
    contacts = JSON.parse(data);
}

function loadTelegrams(page = 1) {
    telegrams.sort((a, b) => {
        if (a.opened && !b.opened) return 1;
        if (!a.opened && b.opened) return -1;
        if (a.date > b.date) return -1;
        if (a.date < b.date) return 1;
        if (a.title > b.title) return 1;
        if (a.title < b.title) return -1;
        return 0;
    });

    const telegramsPerPage = 6;
    const telegramsToDisplay = telegrams.slice((page - 1) * telegramsPerPage, page * telegramsPerPage);
    const pages = Math.max(Math.ceil(telegrams.length / telegramsPerPage), 1);

    $(".telegram_dashboard .telegram_siting_maxpage").text(pages);
    $(".telegram_dashboard .telegram_siting_page").text(page);
    showTelegrams(telegramsToDisplay);

    $(".telegram_dashboard .telegram_siting_first").off("click");
    $(".telegram_dashboard .telegram_siting_prev").off("click");
    $(".telegram_dashboard .telegram_siting_next").off("click");
    $(".telegram_dashboard .telegram_siting_last").off("click");

    $(".telegram_dashboard .telegram_table_filter input").off("input");
    $(".telegram_dashboard .telegram_table_filter input").on("input", function () {
        const filter = $(this).val().toLowerCase();
        const filteredTelegrams = telegrams.filter(telegram => (telegram.title.toLowerCase().includes(filter) || telegram.sender.toLowerCase().includes(filter)));
        const telegramsToDisplay = filteredTelegrams.slice((page - 1) * telegramsPerPage, page * telegramsPerPage);
        const pages = Math.max(Math.ceil(filteredTelegrams.length / telegramsPerPage), 1);

        $(".telegram_dashboard .telegram_siting_maxpage").text(pages);
        $(".telegram_dashboard .telegram_siting_page").text(page);
        showTelegrams(telegramsToDisplay);
    });

    $(".telegram_dashboard .telegram_siting_first").click(() => {
        loadTelegrams(1);
    });

    $(".telegram_dashboard .telegram_siting_prev").click(() => {
        loadTelegrams(Math.max(page - 1, 1));
    });

    $(".telegram_dashboard .telegram_siting_next").click(() => {
        loadTelegrams(Math.min(page + 1, pages));
    });

    $(".telegram_dashboard .telegram_siting_last").click(() => {
        loadTelegrams(pages);
    });
}

function loadContacts(page) {
    contacts.sort((a, b) => (a.name > b.name) ? 1 : -1);

    const contactsPerPage = 6;
    const contactsToDisplay = contacts.slice((page - 1) * contactsPerPage, page * contactsPerPage);
    const pages = Math.max(Math.ceil(contacts.length / contactsPerPage), 1);

    $(".telegram_contacts .telegram_siting_maxpage").text(pages);
    $(".telegram_contacts .telegram_siting_page").text(page);

    $(".telegram_contacts .telegram_siting_first").off("click");
    $(".telegram_contacts .telegram_siting_prev").off("click");
    $(".telegram_contacts .telegram_siting_next").off("click");
    $(".telegram_contacts .telegram_siting_last").off("click");

    $(".telegram_contacts .telegram_table_filter input").off("input");
    $(".telegram_contacts .telegram_table_filter input").on("input", function () {
        page = 1;

        const filter = $(this).val().toLowerCase();
        const filteredContacts = contacts.filter(contact => (contact.name.toLowerCase().includes(filter) || contact.number.toLowerCase().includes(filter)));
        const contactsToDisplay = filteredContacts.slice((page - 1) * contactsPerPage, page * contactsPerPage);
        const pages = Math.max(Math.ceil(filteredContacts.length / contactsPerPage), 1);

        $(".telegram_contacts .telegram_siting_maxpage").text(pages);
        $(".telegram_contacts .telegram_siting_page").text(page);
        showContacts(contactsToDisplay);
    });

    $(".telegram_contacts .telegram_siting_first").click(() => {
        loadContacts(1);
    });

    $(".telegram_contacts .telegram_siting_prev").click(() => {
        loadContacts(Math.max(page - 1, 1));
    });

    $(".telegram_contacts .telegram_siting_next").click(() => {
        loadContacts(Math.min(page + 1, pages));
    });

    $(".telegram_contacts .telegram_siting_last").click(() => {
        loadContacts(pages);
    });

    showContacts(contactsToDisplay);
}

$(".close_button").click(function () {
    $(".telegram").hide();
    $(".container").hide();
    closeMenu();
});

$(".side_button").click(function () {
    const site = $(this).attr("data-site");

    if (site == "telegram_dashboard") {
        $(".input_field").hide();
        $(".telegram_dashboard .telegram_table_filter input").val("");
        loadTelegrams();
    }

    $(".telegram").hide();
    $("." + site).show();
});

$(".telegram_dashboard .compose_telegram").click(function () {
    $(".telegram").hide();
    $(".telegram_compose").show();

    $("#send_number").prop("checked", true);

    if (!$(".telegram_compose .telegram_sender_input input").val().includes(telegramNumber))
        $(".telegram_compose .telegram_sender_input input").val($(".telegram_compose .telegram_sender_input input").val() + " " + telegramNumber);

    $(".telegram_compose .message_input textarea").val("");
    $(".telegram_compose .title_input input").val("");
    $(".telegram_compose .telegram_recipient_input input").val("");
    $(".telegram_compose .telegram_sender_input input").val(telegramNumber);
    $(".telegram_compose .telegram_date_text").text(getDateFormat(new Date(Date.now())));

    $(".telegram_compose .telegram_sender_input input").off("focus");
    $(".telegram_compose .telegram_sender_input input").on("focus", function () {
        $(".telegram_compose .telegram_sender_input input")[0].setSelectionRange(0, 0);
    });

    $(".telegram_compose .telegram_sender_input input").focus();
});

$("#send_number").change(function () {
    // when checked add number to sender input otherwise remove it also with space
    const checked = $(this).is(':checked');
    const sender = $(".telegram_compose .telegram_sender_input input").val();

    if (checked) {
        if (!sender.includes(telegramNumber)) $(".telegram_compose .telegram_sender_input input").val(sender + telegramNumber);
    }
    else {
        if (sender.includes(telegramNumber)) $(".telegram_compose .telegram_sender_input input").val(sender.replace(telegramNumber, ""));
    }
});

$(".telegram_refresh").click(function () {
    refreshData();
});

$(".telegram_compose .compose_telegram").click(function () {
    const title = $(".telegram_compose .title_input input").val();
    const message = $(".telegram_compose .message_input textarea").val();
    const recipient = $(".telegram_compose .telegram_recipient_input input").val();
    let sender = $(".telegram_compose .telegram_sender_input input").val();

    if (sender == "") sender = "Unknown";

    sendTelegram(title, message, recipient, sender)
    $(".telegram_compose message_input textarea").val("");
});

$(".telegram_contacts .compose_telegram").click(function () {
    $(".input_field").fadeIn("fast");
    $(".input_value input").val("");
    $("#add_contact").attr("data-disabled", "false");
});

$("#add_contact").click(function () {
    if ($(this).attr("data-disabled") == "true") return;
    $(".input_field").fadeOut("fast");

    const name = $("#contact_name input").val();
    const number = $("#contact_number input").val();
    const note = $("#contact_note input").val();

    addContact(name, number, note);
    $(this).attr("data-disabled", "true");
});

$("#cancel_contact").click(function () {
    $(".input_field").fadeOut("fast");
});

function setLocation(location, area) {
    $(".telegram_location_text").text(location);
    $(".telegram_area_text").text(area);
}

function setTelegramNumber(number) {
    $(".telegram_number").text(number);
}

String.format = function (format) {
    var args = Array.prototype.slice.call(arguments, 1);
    return format.replace(/{(\d+)}/g, function (match, number) {
        return typeof args[number] != 'undefined'
            ? args[number]
            : match
            ;
    });
};

function translateText(/**/) {
    var args = arguments;
    if (localizationData[args[0]] != undefined)
        return String.format(localizationData[args[0]], args[1])
    else
        return null;
}

function translateElement(element) {
    const elementText = $(element).html();
    const text = elementText.split(" ")[0];

    if (text.startsWith("NUI_")) {
        const translatedText = translateText(text);
        $(element).html(elementText.replace(text, translatedText));
    }
}

$(document).keydown(function (e) {
    if (e.code == "Escape") {
        closeMenu();
    }
});

function extractNumber(text) {
    const number = $(".telegram_message .telegram_sender_text").text();
    const numberMatch = number.match(/((SD|RH|AN|VA|BW|BP)\d{4})/g);
    return numberMatch ? numberMatch[0] : null;
}


$(document).ready(() => {
    const images = [
        "assets/img/telegram_message.png",
        "assets/img/telegram_dashboard.png"
    ]

    images.forEach(image => {
        const img = new Image();
        img.src = image;
    });

    fetch(`https://${GetParentResourceName()}/loadLocalizationData`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        }
    }).then(response => response.json()).then(data => {
        fetch(`../languages/${data}.json`)
            .then(response => response.json())
            .then(data => {
                localizationData = data;

                $("div").each(function () {
                    translateElement(this);
                });

                $("input").each(function () {
                    if ($(this).attr("placeholder") != undefined && $(this).attr("placeholder").startsWith("NUI_")) {
                        const translatedText = translateText($(this).attr("placeholder"));

                        if (!translatedText) {
                            $(this).css("background", "red");
                            $(this).css("color", "black");
                            return;
                        }

                        $(this).attr("placeholder", translatedText);
                    }
                });

                $("th").each(function () {
                    translateElement(this);
                });

                $(".telegram_message .telegram_body .telegram_sender_header .add_user").click(function () {
                    const text = $(".telegram_message .telegram_sender_text").text();
                    const number = extractNumber(text);
                    $(".input_value input").val("");
                    $("#contact_number input").val(number ? number : text);
                    $(".input_field").fadeIn("fast");
                    $("#add_contact").attr("data-disabled", "false");
                });

                $(".telegram_message .telegram_body .telegram_sender_header .respond").click(function () {
                    const text = $(".telegram_message .telegram_sender_text").text();
                    const number = extractNumber(text);

                    if(!number) return;

                    $(".telegram").hide();
                    $(".telegram_compose").show();

                    $(".telegram_compose .telegram_sender_input input").val(telegramNumber);
                    $(".telegram_compose .telegram_date_text").text(getDateFormat(new Date(Date.now())));
                    $("#send_number").prop("checked", true);
                    
                    $(".telegram_compose .telegram_recipient_input input").val(number);
                });
            });
    });


    fetch(`https://${GetParentResourceName()}/getYear`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({})
    }).then((response) => response.json()
        .then((data) => {
            year = data;
        }));
});