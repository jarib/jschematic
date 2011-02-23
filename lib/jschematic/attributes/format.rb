require 'ipaddr'
require 'addressable/uri'

module Jschematic
  module Attributes
    module Format
      def self.new(format)
        case format
        when "uri"
          Uri.new
        when "ip-address", "ipv6"
          Ip.new(format)
        when "cidr"
          Cidr.new(format)
        else
          NullFormat.new
        end
      end

      class Uri
        include Jschematic::Element

        def accepts?(uri)
          Addressable::URI.parse(uri)
        rescue Addressable::URI::InvalidURIError
          false
        end
      end

      class Ip
        include Jschematic::Element

        def initialize(version)
          @method = case version
          when "ip-address"
            :ipv4?
          when "ipv6"
            :ipv6?
          end
        end

        def accepts?(addr)
          IPAddr.new(addr).send(@method)
        rescue ArgumentError
          false
        end
      end

      class Cidr
        include Jschematic::Element

        def accepts?(addr_with_cidr)
          addr, cidr = addr_with_cidr.split("/")
          return false unless cidr && (1..32).include?(cidr.to_i)
          Ip.new("ip-address").accepts?(addr)
        end
      end

      class NullFormat
        include Jschematic::Element

        def accepts?(instance)
          true
        end
      end
    end
  end
end
