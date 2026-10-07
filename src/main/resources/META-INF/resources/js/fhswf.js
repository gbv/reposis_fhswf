function replaceMaskedEmails() {
  document.querySelectorAll('span.madress').forEach(span => {
    const address = span.textContent.replace(' [at] ', '@');
    const link = document.createElement('a');
    link.href = `mailto:${address}`;
    link.textContent = address;
    span.replaceWith(link);
  });
}

function ignoreEmptyFieldsOnSubmit(event) {
  const form = event.currentTarget;
  const inputs = form.querySelectorAll('input');
  inputs.forEach(input => {
    if (!input.value) {
      input.dataset.nameBackup = input.name;
      input.removeAttribute('name');
    }
  });
  // Restore field names after the form is submitted
  // setTimeout ensures this runs after the submit event completes
  setTimeout(() => {
    inputs.forEach(input => {
      if (input.dataset.nameBackup) {
        input.name = input.dataset.nameBackup;
        delete input.dataset.nameBackup;
      }
    });
  }, 0);
}

function addLoginLink() {
  document.querySelectorAll('div.alert-warning').forEach(el => {
    if (el.textContent.includes('nur angemeldete Nutzer')) {
      el.outerHTML =
        '<div role="alert" class="alert alert-warning">' +
          '<strong>Zugriffsberechtigung</strong>&nbsp;' +
          '<a href="https://publikationen.fhb.fh-swf.de/servlets/MCRLoginServlet">nur angemeldete Nutzer</a>' +
        '</div>';
    }
  });
}

function init() {
  replaceMaskedEmails();
  addLoginLink();
}

document.addEventListener("DOMContentLoaded", init);
