require 'json'

module CocoaPods
  module AppGroup
    class Store
      attr_reader :path

      def initialize(path = default_root)
        @path = path
      end

      def read(name)
        table[name.to_s]
      end

      def write(name, value)
        saving { table[name.to_s] = value }
      end

      private

      def default_root
        Pod::Config.instance.installation_root.join('.cocoapods_appgroup')
      end

      def table
        @table ||= JSON.parse File.read(path)
      rescue Errno::ENOENT, JSON::ParserError
        @table ||= {}
      end

      def saving(&f)
        f.call.tap do
          File.open(path, 'w+') do |io|
            JSON.dump table, io
          end
        end
      end
    end
  end
end
