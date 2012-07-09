require 'formtastic/cases/helper'

class ClientSideValidations::Formtastic::FormBuilderTest < Test::Unit::TestCase
  def test_client_side_form_js_hash
    expected = {
      :type => 'Formtastic::FormBuilder',
      :inline_error_class => 'inline-errors'
    }
    builder = Formtastic::FormBuilder.new(:user, nil, {}, {}, Proc.new {})
    assert_equal expected, builder.client_side_form_settings(nil, nil)
  end
end
