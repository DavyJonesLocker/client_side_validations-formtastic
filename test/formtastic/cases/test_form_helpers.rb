require 'action_view/test_helper'
require 'formtastic/cases/helper'

class ClientSideValidations::Formtastic::FormHelpersTest < ActionView::TestCase
  include ActionViewTestSetup
  include Formtastic::Helpers::FormHelper

  def client_side_form_settings_helper
    ''
  end

  def test_semantic_form_for
    semantic_form_for(@post, :validate => true) do |f|
      concat f.input(:cost)
    end

    expected = %{<form accept-charset="UTF-8" action="/posts" class="formtastic post" data-validate="true" id="new_post" method="post" novalidate="novalidate"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div><li class="string input required stringish" id="post_cost_input"><label class=\" label\" for="post_cost">Cost<abbr title="required">*</abbr></label><input id="post_cost" name="post[cost]" type="text" />\n\n</li></form><script>//<![CDATA[\nif(window.ClientSideValidations==undefined)window.ClientSideValidations={};if(window.ClientSideValidations.forms==undefined)window.ClientSideValidations.forms={};window.ClientSideValidations.forms['new_post'] = {"type":"Formtastic::FormBuilder","inline_error_class":"inline-errors","validators":{"post[cost]":{"presence":[{"message":"can't be blank"}]}}};\n//]]></script>}
    assert_equal expected, output_buffer, "\n\n *** If you're running Ruby 1.8 and this test fails is is most likely due to 1.8's lack of insertion order persistence with Hashes ***\n"
  end

  def test_input_override
    semantic_form_for(@post, :validate => true) do |f|
      concat f.input(:cost, :validate => false)
    end

    expected = %{<form accept-charset="UTF-8" action="/posts" class="formtastic post" data-validate="true" id="new_post" method="post" novalidate="novalidate"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div><li class="string input required stringish" id="post_cost_input"><label class=\" label\" for="post_cost">Cost<abbr title="required">*</abbr></label><input id="post_cost" name="post[cost]" type="text" />\n\n</li></form><script>//<![CDATA[\nif(window.ClientSideValidations==undefined)window.ClientSideValidations={};if(window.ClientSideValidations.forms==undefined)window.ClientSideValidations.forms={};window.ClientSideValidations.forms['new_post'] = {"type":"Formtastic::FormBuilder","inline_error_class":"inline-errors","validators":{}};\n//]]></script>}
    assert_equal expected, output_buffer, "\n\n *** If you're running Ruby 1.8 and this test fails is is most likely due to 1.8's lack of insertion order persistence with Hashes ***\n"
  end

  def test_boolean
    semantic_form_for(@post, :validate => true) do |f|
      concat f.input(:cost, :as => :boolean)
    end

    expected = %{<form accept-charset="UTF-8" action="/posts" class="formtastic post" data-validate="true" id="new_post" method="post" novalidate="novalidate"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div><li class="boolean input required" id="post_cost_input"><input name="post[cost]" type="hidden" value="0" /><label class="" for="post_cost" name="post[cost]"><input id="post_cost" name="post[cost]" type="checkbox" value="1" />Cost<abbr title="required">*</abbr></label>\n\n</li></form><script>//<![CDATA[\nif(window.ClientSideValidations==undefined)window.ClientSideValidations={};if(window.ClientSideValidations.forms==undefined)window.ClientSideValidations.forms={};window.ClientSideValidations.forms['new_post'] = {"type":"Formtastic::FormBuilder","inline_error_class":"inline-errors","validators":{"post[cost]":{"presence":[{"message":"can't be blank"}]}}};\n//]]></script>}
    assert_equal expected, output_buffer
  end

  def test_boolean_ensure_no_validate_attribute
    semantic_form_for(@post, :validate => true) do |f|
      concat f.input(:cost, :as => :boolean, :validate => true)
    end

    expected = %{<form accept-charset="UTF-8" action="/posts" class="formtastic post" data-validate="true" id="new_post" method="post" novalidate="novalidate"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div><li class="boolean input required" id="post_cost_input"><input name="post[cost]" type="hidden" value="0" /><label class="" for="post_cost" name="post[cost]" validate="true"><input id="post_cost" name="post[cost]" type="checkbox" validate="true" value="1" />Cost<abbr title="required">*</abbr></label>\n\n</li></form><script>//<![CDATA[\nif(window.ClientSideValidations==undefined)window.ClientSideValidations={};if(window.ClientSideValidations.forms==undefined)window.ClientSideValidations.forms={};window.ClientSideValidations.forms['new_post'] = {"type":"Formtastic::FormBuilder","inline_error_class":"inline-errors","validators":{"post[cost]":{"presence":[{"message":"can't be blank"}]}}};\n//]]></script>}
    assert_equal expected, output_buffer
  end
end
