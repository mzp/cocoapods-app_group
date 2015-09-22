#import "AppGroup.h"

static NSString * const kAppIdentifier = @"<%= store.read :app_group %>";

@implementation AppGroup

+ (NSString *)appGroupID
{
    return [NSString stringWithFormat:@"group.%@", kAppIdentifier];
}

+ (NSString *)pathForResource:(NSString *)subpath
{
    NSString *containerPath = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:[self appGroupID]].path;
    return [containerPath stringByAppendingPathComponent:subpath];
}

+ (NSUserDefaults*)userDefaults
{
    return [[NSUserDefaults alloc] initWithSuiteName: [self appGroupID]];
}

@end
