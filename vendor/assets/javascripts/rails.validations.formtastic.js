
/*
  Client Side Validations - Formtastic - v2.2.0.rc.2
  https://github.com/dockyard/client_side_validations-formtastic

  Copyright (c) 2012 DockYard, LLC
  Licensed under the MIT license
  http://www.opensource.org/licenses/mit-license.php
*/


(function() {

  ClientSideValidations.formBuilders['Formtastic::FormBuilder'] = {
    add: function(element, settings, message) {
      var errorElement, wrapper;
      if (element.data('valid') !== false) {
        wrapper = element.closest('li');
        errorElement = $('<p/>', {
          "class": settings.inline_error_class,
          text: message
        });
        wrapper.addClass('error');
        return wrapper.append(errorElement);
      } else {
        return element.parent().find("p." + settings.inline_error_class).text(message);
      }
    },
    remove: function(element, settings) {
      var errorElement, wrapper;
      wrapper = element.closest('li.error');
      errorElement = wrapper.find("p." + settings.inline_error_class);
      wrapper.removeClass('error');
      return errorElement.remove();
    }
  };

}).call(this);
