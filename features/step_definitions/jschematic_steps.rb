When /^the schema is '(.+)'$/ do |schema|
  @schema = parse(schema)
end

When "the schema is:" do |schema|
  @schema = parse(schema)
end

Then /^'(.+)' should be acceptable JSON$/ do |json|
  @json = parse(json)
  assert_valid(@json, @schema)
end

Then "this JSON should be acceptable:" do |json|
  @json = parse(json)
  assert_valid(@json, @schema)
end

module JschematicWorld
  def parse(json)
    Yajl::Parser.parse(json)
  rescue Yajl::ParseError => e
    raise "Parsing '#{json}' failed with #{e.to_s}"
  end

  def assert_valid(json, schema)
    JSON::Schema.validate(json, schema) # sanity check

    type = schema["type"].capitalize
    klass = case
            when type == "Object"
              Hash
            when type == "Number"
              Float # or Fixnum or Bignum
            when type == "Integer"
              Fixnum # or Bignum 
            else
              constantize(type)
            end

    json.should be_an_instance_of(klass)
  end

  def constantize(string)
    Kernel.const_get(string)
  end
end

World(JschematicWorld)
