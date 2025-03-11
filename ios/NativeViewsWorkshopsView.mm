#import "NativeViewsWorkshopsView.h"

#import "generated/RNNativeViewsWorkshopsViewSpec/ComponentDescriptors.h"
#import "generated/RNNativeViewsWorkshopsViewSpec/EventEmitters.h"
#import "generated/RNNativeViewsWorkshopsViewSpec/Props.h"
#import "generated/RNNativeViewsWorkshopsViewSpec/RCTComponentViewHelpers.h"

#import "RCTFabricComponentsPlugins.h"

#import <MapKit/MapKit.h>

using namespace facebook::react;

@interface NativeViewsWorkshopsView () <RCTNativeViewsWorkshopsViewViewProtocol>

@end

@implementation NativeViewsWorkshopsView {
    MKMapView * _view;
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

    _view = [MKMapView new];

    self.contentView = _view;
    
    auto tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [_view addGestureRecognizer:tapRecognizer];
  }

  return self;
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
  CLLocationCoordinate2D point = [self getCoordinates:recognizer];
  std::dynamic_pointer_cast<const facebook::react::NativeViewsWorkshopsViewEventEmitter>(_eventEmitter)
    ->onPress({
      .latitude = point.latitude,
      .longitude = point.longitude
    });
}

- (CLLocationCoordinate2D)getCoordinates:(UIGestureRecognizer *)recognizer
{
  CGPoint point = [recognizer locationInView:_view];
  return [_view convertPoint:point toCoordinateFromView:_view];
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<NativeViewsWorkshopsViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<NativeViewsWorkshopsViewProps const>(props);
    
    if (oldViewProps.mapType != newViewProps.mapType) {
      _view.mapType = parseMapType(newViewProps.mapType);
    }

    [super updateProps:props oldProps:oldProps];
}

static inline MKMapType parseMapType(const NativeViewsWorkshopsViewMapType &value) {
  switch (value) {
    case NativeViewsWorkshopsViewMapType::Standard: return MKMapTypeStandard;
    case NativeViewsWorkshopsViewMapType::Satellite: return MKMapTypeSatellite;
  }
}

- (void)handleCommand:(const NSString *)commandName args:(const NSArray *)args
{
  RCTNativeViewsWorkshopsViewHandleCommand(self, commandName, args);
}

- (void)moveTo:(float)latitude longitude:(float)longitude animated:(BOOL)animated
{
  CLLocationCoordinate2D center;
  center.latitude = latitude;
  center.longitude = longitude;
  [_view setCenterCoordinate:center animated:animated];
}

Class<RCTComponentViewProtocol> NativeViewsWorkshopsViewCls(void)
{
    return NativeViewsWorkshopsView.class;
}

@end
