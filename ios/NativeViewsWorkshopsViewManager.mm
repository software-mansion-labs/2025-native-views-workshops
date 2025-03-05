#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import "RCTBridge.h"

@interface NativeViewsWorkshopsViewManager : RCTViewManager
@end

@implementation NativeViewsWorkshopsViewManager

RCT_EXPORT_MODULE(NativeViewsWorkshopsView)

- (UIView *)view
{
  return [[UIView alloc] init];
}

RCT_EXPORT_VIEW_PROPERTY(color, NSString)

@end
