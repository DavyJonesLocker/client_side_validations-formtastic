module ClientSideValidations::Formtastic::Inputs; end

['boolean_input'].each do |input|
  require "client_side_validations/formtastic/inputs/#{input}"
  klass_name = input.camelcase
  "Formtastic::Inputs::#{input.camelcase}".constantize.send(:include, "ClientSideValidations::Formtastic::Inputs::#{klass_name}".constantize)
end
