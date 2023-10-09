const inputTitle = document.querySelector('#input-title')
const inputForm = document.querySelector('.input-form')
const inputValue = document.querySelector('#input-val')

window.addEventListener('message', async function({data}) {
    
    if (data.show) {
        inputTitle.innerHTML = data.title
        inputForm.style.display = 'flex'
        inputValue.focus()
        zoomIn(inputForm)
    } else {
        zoomOut(inputForm)
        await delay(250)
        inputForm.style.display = 'none'
    }

})

inputForm.addEventListener('submit', async function(e) {
    e.preventDefault()
    let val = inputValue.value
    submitForm(val)
})

document.onkeyup = async function(e) {
    if(e.key == "Escape") {
        submitForm()
    }
}

async function submitForm(val) {
    fetch(`http://${GetParentResourceName()}/submit`, {body: JSON.stringify(val), method: 'POST'})
    zoomOut(inputForm)
    await delay(250)
    inputForm.style.display = 'none';
    inputValue.value = ""
}

function zoomIn(element) {
    element.animate([
        { transform: 'scale(0.5)', opacity: 0 },
        { transform: 'scale(1)', opacity: 1 }
    ], {
        duration: 250,
        iterations: 1,
        easing: 'ease-in-out'
    })
}

function zoomOut(element) {
    element.animate([
        { transform: 'scale(1)', opacity: 1 },
        { transform: 'scale(0.5)', opacity: 0 }
    ], {
        duration: 250,
        iterations: 1,
        easing: 'ease-in-out'
    })
}

function delay(ms) {
    return new Promise((resolve, reject) => {
        setTimeout(resolve, ms)
    })
}