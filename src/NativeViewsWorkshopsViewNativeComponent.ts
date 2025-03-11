import codegenNativeComponent, {
  type NativeComponentType,
} from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { ViewProps } from 'react-native';
import type {
  BubblingEventHandler,
  Float,
  WithDefault,
} from 'react-native/Libraries/Types/CodegenTypes';
import codegenNativeCommands from 'react-native/Libraries/Utilities/codegenNativeCommands';

export type MapType = 'standard' | 'satellite';

export type Coordinates = {
  latitude: Float;
  longitude: Float;
};

interface NativeProps extends ViewProps {
  mapType?: WithDefault<MapType, 'standard'>;
  onPress?: BubblingEventHandler<Coordinates>;
}

export default codegenNativeComponent<NativeProps>('NativeViewsWorkshopsView');

export type ViewType = NativeComponentType<NativeProps>;
interface NativeCommands {
  moveTo: (
    viewRef: React.ElementRef<ViewType>,
    latitude: Float,
    longitude: Float,
    animated?: boolean
  ) => void;
}

export const Commands: NativeCommands = codegenNativeCommands<NativeCommands>({
  supportedCommands: ['moveTo'],
});
