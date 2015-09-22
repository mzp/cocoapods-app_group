# cocoapods-app_group

This plugin provide customizable app group.

Because app group is strong bound to AppleID, it is hard to distribute iOS project using app group. This plugin enable each user to customize app group name at setup phase. This make easy to distribute your iOS project.

## Requirements

 * CocoaPods 0.36

## Installation
not yet.

```
gem install cocoapods-app_group
```

## Setup
### 1. Setup Podfile
Put followings to `Podfile`:

```ruby
plugin 'cocoapods-app_group'

# or specify targets
# plugin 'cocoapods-app_group', targets: ['Foo', 'Bar']
```

Then running `pod install` will prompt for the keys not yet set and you can ensure everyone has the same setup.

### 2. Save app group name
Save group name by running following command:

```
pod app-group GROUP_NAME
```

### 3. Generate wrapper class
Generate wrapper class by running following command:

```
pod install
```

### 4. Enable app group of each target
Open `*.xcworkspace` and enable app group of each target. Use `group.$(APP_IDENTIFIER)` as app group name.

### 5. Write code
Write code using wrapper class:

```objc
#import <Foundation/Foundation.h>

@interface AppGroup : NSObject
+ (NSString *)appGroupID;
+ (NSString *)pathForResource:(NSString *)subpath;
+ (NSUserDefaults*)userDefaults;
@end
```

## Using at swift project
### Using the bridge header

If you want to make your keys available to your whole project:

1. Make sure you have a [bridging header](https://developer.apple.com/library/prerelease/ios/documentation/Swift/Conceptual/BuildingCocoaApps/MixandMatch.html) already setup.
2. In the bridging header, import the generated key file:
```objectivec
#import <AppGroup/AppGroup.h>
```

### Importing the framework

If you've added the `use_frameworks!` and only want your Keys to be available in
specific files, simply use Swift's `import` statement. The name of the generated
module is `AppGroup`.

```swift
import AppGroup
```

## Thanks

This was built with a lot of help from [@banjun](https://github.com/banjun).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

