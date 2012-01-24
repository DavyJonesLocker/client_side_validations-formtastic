###
  Client Side Validations - Formtastic - v<%= ClientSideValidations::Formtastic::VERSION %>
  https://github.com/dockyard/client_side_validations-formtastic

  Copyright (c) <%= DateTime.now.year %> DockYard, LLC
  Licensed under the MIT license
  http://www.opensource.org/licenses/mit-license.php
###

ClientSideValidations.formBuilders['Formtastic::FormBuilder'] = 
  add: (element, settings, message) ->
    if element.data('valid') != false
      wrapper = element.closest('li')
      errorElement = $('<p/>', { class: settings.inline_error_class, text: message })
      wrapper.addClass('error')
      wrapper.append(errorElement)
    else
      element.parent().find("p.#{settings.inline_error_class}").text(message)

  remove: (element, settings) ->
    wrapper = element.closest('li.error')
    errorElement = wrapper.find("p.#{settings.inline_error_class}")
    wrapper.removeClass('error')
    errorElement.remove()

