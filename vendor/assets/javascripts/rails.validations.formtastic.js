/*!
 * Client Side Validations - Formtastic - v2.0.0.beta.2
 * https://github.com/dockyard/client_side_validations-formtastic
 *
 * Copyright (c) 2012 DockYard, LLC
 * Licensed under the MIT license
 * http://www.opensource.org/licenses/mit-license.php
 */

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

