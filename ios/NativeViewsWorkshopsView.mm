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
    
    UITapGestureRecognizer *tapRecognizer = [
      [UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)
    ];
    tapRecognizer.numberOfTapsRequired = 1;
    tapRecognizer.numberOfTouchesRequired = 1;
    [_view addGestureRecognizer:tapRecognizer];

    UIPanGestureRecognizer *panRecognizer = [
      [UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)
    ];
    panRecognizer.delegate = self;
    [_view addGestureRecognizer:panRecognizer];
  }

  return self;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
  return YES;
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
  CLLocationCoordinate2D point = [self getCoordinates: recognizer];
  std::dynamic_pointer_cast<const facebook::react::NativeViewsWorkshopsViewEventEmitter>(_eventEmitter)
    ->onPress({
      .latitude = point.latitude,
      .longitude = point.longitude
    });
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
  CLLocationCoordinate2D point = [self getCoordinates: recognizer];
  std::dynamic_pointer_cast<const facebook::react::NativeViewsWorkshopsViewEventEmitter>(_eventEmitter)
    ->onRegionChange({
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
    case NativeViewsWorkshopsViewMapType::Hybrid: return MKMapTypeHybrid;
  }
}

Class<RCTComponentViewProtocol> NativeViewsWorkshopsViewCls(void)
{
    return NativeViewsWorkshopsView.class;
}

@end
