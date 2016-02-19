
var Contacts = (function ($) {
  function Contacts () {
    console.log('Contacts lib is up!');
    // Get or create the random contact key
    this.key = $.cookie('contact_key') || Math.random().toString(36).substring(7);
  };

  Contacts.prototype.pages = {
    'home': 'home',
    'prices': 'prices',
    'aboutus': 'aboutus',
    'contact': 'contact'
  };

  // Helper method for get transactions
  var get = function (url, done, error) {
    $.ajax({
      method: 'GET',
      url: url,
    })
      .done(done)
      .error(error);
  };

  // Helper method for post transactions
  var post = function (url, data, done, error) {
    $.ajax({
      method: 'POST',
      url: url,
      data: data
    })
      .done(done)
      .error(error);
  };

  // Helper method for put transactions
  var put = function (url, data, done, error) {
    $.ajax({
      method: 'PUT',
      url: url,
      data: data
    })
      .done(done)
      .error(error);
  };

  // When page is loaded
  Contacts.prototype.newContact = function (callback) {
    // Gets the contact_key from cookies or create a new one
    get('/api/contacts/key/' + this.key, function (contact) {
      console.log('Contact exists. Nothing to do for now.');
      callback(contact);
    }, function (error) {
      if (error.status == 404) {
        console.log('Contact does not exist. Creating...');
        post('/api/contacts', { key: this.key }, function (contact) {
          console.log('Contact created.')
          callback(contact);
        });
      }
      callback(null, error);
    }.bind(this));
  };

  // When visiting a page (every time)
  Contacts.prototype.pageVisited = function (page, callback) {
    // Here the contact will aways exist
    post('/api/contacts/key/' + this.key + '/addvisit', { page: page }, function (visit) {
      console.log('Added a new visit.');
      callback(visit);
    }, function (error) {
      callback(null, error);
    });
  };

  // When updating a contact
  Contacts.prototype.updateContact = function (data, callback) {
    put('/api/contacts/key/' + this.key, data, function (contact) {
      callback(contact);
    }, function (error) {
      callback(null, error);
    });
  };

  return Contacts;
})(jQuery);
