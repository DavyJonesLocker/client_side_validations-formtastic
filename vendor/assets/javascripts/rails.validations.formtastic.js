ClientSideValidations.formBuilders['Formtastic::FormBuilder'] = {
  add: function(element, settings, message) {
    if (element.data('valid') !== false) {
      var wrapper = element.closest('li');
      wrapper.addClass('error');
      var errorElement = $('<p class="' + settings.inline_error_class + '">' + message + '</p>');
      wrapper.append(errorElement);
    } else {
      element.parent().find('p.' + settings.inline_error_class).text(message);
    }
  },
  remove: function(element, settings) {
    var wrapper = element.closest('li.error');
    wrapper.removeClass('error');
    var errorElement = wrapper.find('p.' + settings.inline_error_class);
    errorElement.remove();
  }
}

