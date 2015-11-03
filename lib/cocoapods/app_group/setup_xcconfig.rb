module CocoaPods
  module AppGroup
    class SetupXcconfig
      def initialize(installer)
        @installer = installer
      end

      def call
        pod_targets.each do |target|
          if target.name == 'AppGroup'
            target.spec_consumers.first.spec.attributes_hash['user_target_xcconfig'] = {"APP_IDENTIFIER"=> store.read(:app_group)}
            
            target.root_spec.attributes_hash['pod_target_xcconfig'] = {
                "APP_IDENTIFIER" => store.read(:app_group),
                "GCC_PREPROCESSOR_DEFINITIONS" => 'APP_IDENTIFIER=${APP_IDENTIFIER}',
            }
          end
        end
      end

      private

      attr_reader :installer

      def pod_targets
        installer.pod_targets
      end

      def store
        @store ||= Store.new
      end
    end
  end
end
