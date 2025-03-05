import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { ViewProps } from 'react-native';
import type {
  BubblingEventHandler,
  DirectEventHandler,
  Float,
  WithDefault,
} from 'react-native/Libraries/Types/CodegenTypes';

export type MapType = 'standard' | 'satellite' | 'hybrid';

export type Coordinates = {
  latitude: Float;
  longitude: Float;
};

interface NativeProps extends ViewProps {
  mapType?: WithDefault<MapType, 'standard'>;
  onPress?: BubblingEventHandler<Coordinates>;
  onRegionChange?: DirectEventHandler<Coordinates>;
}

export default codegenNativeComponent<NativeProps>('NativeViewsWorkshopsView');
