require 'erb'

module CocoaPods
  module AppGroup
    class Template
      attr_reader :path

      def initialize(path)
        @path = path
      end

      def call(dest)
        File.write dest, ERB.new(content).result(binding)
      end

      private

      def content
        @content ||= File.read(path)
      end
    end
  end
end
