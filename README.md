# Jschematic

Jschematic is a JSON Schema v3 Validator for Ruby. 

## Usage

   require 'jschematic'
   Jschematic.validate(json, schema)  # => true or false
   Jschematic.validate!(json, schema) # => true or raise Jschematic::ValidationError

`json` and `schema` above must be Ruby data structures, not real JSON.

Jschematic doesn't care how you turn JSON into Ruby (though we use the
fine yajl-ruby gem for testing).

## ToDo

* Implement remaining attributes for base schema validation
* Improve error reporting and handling
* Allow collection of validation results

## Testing

    $ cucumber
    $ rspec spec

## Links

* http://tools.ietf.org/html/draft-zyp-json-schema-03

## Copyright

Copyright (c) 2011 Mike Sassak. See LICENSE for details.
