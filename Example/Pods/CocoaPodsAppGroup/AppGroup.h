#import <Foundation/Foundation.h>

@interface AppGroup : NSObject
+ (NSString *)appGroupID;
+ (NSString *)pathForResource:(NSString *)subpath;
+ (NSURL *)urlForResource:(NSString *)subpath;
+ (NSUserDefaults*)userDefaults;
@end
