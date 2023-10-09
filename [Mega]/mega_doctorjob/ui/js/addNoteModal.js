
let addNoteModal = new tingle.modal({
    footer: true,
    stickyFooter: false,
    closeMethods: ['overlay', 'button', 'escape'],
    closeLabel: "Close",
    cssClass: ['custom-modal'],
    onOpen: function() {
        let inputElement = document.querySelector('#noteText');
        inputElement.focus();
    }
});

let html = document.querySelector('#addNoteModalContent').innerHTML;

addNoteModal.setContent(html);

addNoteModal.addFooterBtn('Submit', 'custom-modal-submit tingle-btn tingle-btn--primary tingle-btn--pull-right', function() {
    let inputElement = document.querySelector('#noteText');

    fetch(`http://${GetParentResourceName()}/addNote`, {
        method: 'POST',
        body: JSON.stringify({ 
            text: inputElement.value, 
            hospital: app.hospital,
            patientCharId: app.patient.charid
        })
    })
    
    inputElement.value = ''
    addNoteModal.close();
});

let modalForm = document.querySelector('#addNoteForm');

modalForm.addEventListener('submit', function(e) {
    e.preventDefault();

    fetch(`http://${GetParentResourceName()}/addNote`, {
        method: 'POST',
        body: JSON.stringify({ 
            text: inputElement.value, 
            hospital: app.hospital
        })
    })

    inputElement.value = ''
    addNoteModal.close();
})