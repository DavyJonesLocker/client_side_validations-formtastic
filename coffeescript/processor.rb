$:.unshift(File.expand_path('../../lib', __FILE__))

require 'client_side_validations/formtastic/version'
require 'coffee_script'
require 'erb'

root_path = File.expand_path('../..', __FILE__)
file_name = 'rails.validations.formtastic'

template = ERB.new(File.open(File.join(root_path, 'coffeescript', "#{file_name}.coffee")).read)
javascript = CoffeeScript.compile(template.result(binding))
file = File.new(File.join(root_path, "vendor/assets/javascripts/#{file_name}.js"), 'w')
file << javascript
file.close
