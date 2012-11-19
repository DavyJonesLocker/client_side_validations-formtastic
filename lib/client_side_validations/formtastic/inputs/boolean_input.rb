module ClientSideValidations::Formtastic::Inputs::BooleanInput
  def self.included(base)
    base.class_eval do
      alias_method_chain :check_box_html, :client_side_validations_formtastic
    end
  end

  def check_box_html_with_client_side_validations_formtastic
    builder.send(:build_validation_options, method, options)
    check_box_html_without_client_side_validations_formtastic
  end
end
