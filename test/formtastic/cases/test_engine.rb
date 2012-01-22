require 'formtastic/cases/helper'

class ClientSideValidations::Formtastic::EngineTest < Test::Unit::TestCase
  def test_client_side_form_js_hash
    assert defined?(ClientSideValidations::Formtastic::Engine)
  end
end
