module CocoaPods
  module AppGroup
    class Setup
      def call
        FileUtils.mkdir_p pod_path

        %w(AppGroup.podspec.json AppGroup.h AppGroup.m).each do |name|
          Template.new(template(name)).call pod_path.join(name)
        end

        add_to_targets pod_path.relative_path_from(root)
      end

      private

      def add_to_targets(path, targets: nil)
        if targets
          # Iterate through each target specified in the Keys plugin
          targets.each do |target|
            # Find a matching Pod target
            pod_target = podfile.root_target_definitions.flat_map(&:children).find do |target|
              target.label == "Pods-#{target}"
            end

            if pod_target
              pod_target.store_pod 'AppGroup', path: pod_path.to_path
            else
              Pod::UI.puts "Could not find a target named '#{target}' in your Podfile. Stopping keys".red
            end
          end
        else
          # otherwise let it go in global
          podfile.pod 'AppGroup', path: pod_path.to_path
        end
      end

      def root
        Pod::Config.instance.installation_root
      end

      def pod_path
        root.+('Pods/CocoaPodsAppGroup/')
      end

      def template(name)
        Pathname(__dir__) + '../../../templates' + name
      end

      def podfile
        Pod::Config.instance.podfile
      end

      def options
        podfile.plugins['cocoapods-app_group']
      end
    end
  end
end
