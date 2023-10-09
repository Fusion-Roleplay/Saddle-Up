customElements.define('custom-notification-box', CustomNotification);
const MAX_NOTIFS = 3;
window.addEventListener('message', (event) => {
    showNotification(event.data.title, event.data.text, event.data.duration, event.data.image, event.data.position)
});

function showNotification(title, subtitle, duration, image, position) {
    if(document.querySelectorAll(`.${position} .notification-container`).length < MAX_NOTIFS)
        document.querySelector(`.notifications-container .${position}`).append(new CustomNotification(title, subtitle, duration, image));
}