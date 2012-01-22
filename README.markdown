# ClientSideValidations-Formtastic #

[![Build Status](http://travis-ci.org/dockyard/client_side_validations-formtastic.png)](http://travis-ci.org/dockyard/client_side_validations-formtastic)

Formtastic plugin for [ClientSideValidations](https://github.com/bcardarella/client_side_validations)

## Installation ##

In your Gemfile add the following:

```ruby
gem 'formtastic'
gem 'client_side_validations'
gem 'client_side_validations-formtastic', :require => 'client_side_validations/formtastic'
```

Order matters here. `Formtastic` and `ClientSideValidations` need to be
required **before** `ClientSideValidations-Formtastic`.

[Follow the remaining installation instructions for ClientSideValidations](https://github.com/bcardarella/client_side_validations/README.markdown)

Add the following line to `app/assets/javascripts/application.js`

```javascript
//= require rails.validations.formtastic
```

Again, order matters. You should add this line after the require for `rails.validations` as described in the `ClientSideValidations` installation instructions.

## Usage ##

The usage is the same as `ClientSideValidations`, just pass `:validate => true` to the form builder

```ruby
<%= semantic_form_for @book, :validate => true |book| do %>
  <%= book.input :name %>
<% end %>
```

Per-input options are done with `:validate`

```ruby
<%= book.input :name, :validate => { :presence => true, :uniqueness => false }
```

## Authors ##

[Brian Cardarella](http://twitter.com/bcardarella)

## Versioning ##

This gem mixes Semantic Versioning

## Want to help? ##

Stable branches are created based upon each minor version

## Legal ##

DockYard, LLC &copy; 2012

[@dockyard](http://twitter.com/dockyard)

[Licensed under the MIT license](http://www.opensource.org/licenses/mit-license.php)
