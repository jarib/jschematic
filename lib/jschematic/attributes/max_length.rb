require 'jschematic/element'

module Jschematic
  module Attributes
    class MinLength
      include Jschematic::Element

      def initialize(length)
        @length = length
      end

      def accepts?(instance)
        return true unless String === instance
        (instance.length >= @length) || fail_validation!("minimum length of #{@length}", instance.length)
      end
    end
  end
end
