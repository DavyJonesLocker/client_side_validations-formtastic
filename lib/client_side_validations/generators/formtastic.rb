module ClientSideValidations
  module Generators
    class SimpleForm
      def self.assets
        [{
          :path => File.expand_path('../../../../vendor/assets/javascripts', __FILE__),
          :file => 'rails.validations.formtastic.js'
        }]
      end

      Generators.register_assets(self)
    end
  end
end

