module ClientSideValidations::Formtastic::Helpers::InputHelper
  def input(method, options = {})
    if options.key?(:validate)
      options[:input_html] ||= {}
      options[:input_html].merge!(:validate => options[:validate])
      options.delete(:validate)
    end
    super(method, options)
  end
end

::Formtastic::FormBuilder.send(:include, ::ClientSideValidations::Formtastic::Helpers::InputHelper)
