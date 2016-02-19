
var contacts = new Contacts();

// Create a new contact if its a new one. Otherwise, nothing to do
contacts.newContact(function () {
  // Callback returns the retrieved or created contact as the first param and 
  // the error (if it was not 404) as a second param.
  // Because site aways is started in Home page, register a Home visit
  contacts.pageVisited(contacts.pages.home, function () {
    // Callback returns the visited page as the first param and the error as a second param.
  });
});

// Function called for the onClick event of the link_to tags
var pageVisited = function (page) {
  console.log('Visited the "' + page + '" page.');
  contacts.pageVisited(page, function () {
    // Callback returns the visited page as the first param and the error as a second param.
  });
};

// Function called in the onSubmit of the form
var submitForm = function (event, form) {
  event.preventDefault();
  // Serializes the form data into a object
  var formObject = $(form).serializeObject();
  // Updates the contact
  contacts.updateContact(formObject, function () {
    console.log('Updated.');
    window.location.replace("/contact");
  });
};
