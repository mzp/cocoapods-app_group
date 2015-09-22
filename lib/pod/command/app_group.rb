module Pod
  class Command
    class AppGroup < Command
      self.summary = 'Setup app group'
      self.description = 'Setup app group'

      self.arguments = [CLAide::Argument.new('app-group', true)]

      attr_reader :app_group

      def initialize(argv)
        @app_group = argv.shift_argument
        super
      end

      def validate!
        super
        verify_podfile_exists!
        help! 'A app-group is required.' unless app_group
      end

      def run
        store.write :app_group, app_group
      end

      def store
        @store ||= CocoaPods::AppGroup::Store.new
      end
    end
  end
end
