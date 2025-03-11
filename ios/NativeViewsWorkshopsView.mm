#import "NativeViewsWorkshopsView.h"

#import "generated/RNNativeViewsWorkshopsViewSpec/ComponentDescriptors.h"
#import "generated/RNNativeViewsWorkshopsViewSpec/EventEmitters.h"
#import "generated/RNNativeViewsWorkshopsViewSpec/Props.h"
#import "generated/RNNativeViewsWorkshopsViewSpec/RCTComponentViewHelpers.h"

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@interface NativeViewsWorkshopsView () <RCTNativeViewsWorkshopsViewViewProtocol>

@end

@implementation NativeViewsWorkshopsView {
    UIView * _view;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<NativeViewsWorkshopsViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const NativeViewsWorkshopsViewProps>();
    _props = defaultProps;

    _view = [[UIView alloc] init];

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<NativeViewsWorkshopsViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<NativeViewsWorkshopsViewProps const>(props);

    if (oldViewProps.color != newViewProps.color) {
      if (newViewProps.color.compare("green")) {
        auto green = [UIColor colorWithRed:50 / 255.0f green:168 / 255.0f blue:82 / 255.0f alpha:1.0f];
        [_view setBackgroundColor:green];
      }
    }

    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> NativeViewsWorkshopsViewCls(void)
{
    return NativeViewsWorkshopsView.class;
}

@end
