class CustomNotification extends HTMLElement {
    constructor(title, subtitle, duration, image) {
        super();
        this.title = title;
        this.subtitle = subtitle;
        this.duration = duration;
        this.image = image;

        this.setAttribute('class', 'notification-container');

        this.create();
        this.destroyAfter(duration);

    }

    async create() {
        
        const box = document.createElement('div');
        
        box.setAttribute('class', 'notification-box');
        box.style.opacity = 0;
        
        this.appendChild(box);
        
        const background = document.createElement('img');

        background.setAttribute('class', 'notification-background');
        background.setAttribute('src', './img/background.png');

        box.appendChild(background);

        const notificationBody = document.createElement('div');
            
        notificationBody.setAttribute('class', 'notification-body');

        box.appendChild(notificationBody);

        const notificationImage = document.createElement('div');
            
        notificationImage.setAttribute('class', 'notification-image');

        const img = document.createElement('img');
            
        img.setAttribute('src', `./img/${this.image}.png`);

        notificationImage.appendChild(img);

        notificationBody.appendChild(notificationImage);

        const notificationTitle = document.createElement('h1');
            
        notificationTitle.setAttribute('class', 'notification-title');

        notificationTitle.innerHTML = this.title;

        notificationBody.appendChild(notificationTitle);

        const notificationText = document.createElement('p');

        notificationText.setAttribute('class', 'notification-text');

        notificationText.innerHTML = this.subtitle;

        notificationBody.appendChild(notificationText);

        await Utils.delay(200);
        box.style.opacity = 1;
    }

    async destroyAfter(ms) {
        await Utils.delay(ms);
        this.style.opacity = 0;
        await Utils.delay(500);
        this.remove();
    }
}