module CocoaPods
  module AppGroup
    module Hook
      def install!
        Setup.new.call if enabled?
        super
      end

      def generate_pods_project
        SetupXcconfig.new(self).call if enabled?
        super
      end

      private

      def enabled?
        podfile && podfile.plugins && !podfile.plugins['cocoapods-app_group'].nil?
      end

    end
  end
end
Pod::Installer.prepend CocoaPods::AppGroup::Hook
