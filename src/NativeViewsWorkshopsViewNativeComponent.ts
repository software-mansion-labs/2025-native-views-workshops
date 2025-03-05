import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { ViewProps } from 'react-native';
import type { WithDefault } from 'react-native/Libraries/Types/CodegenTypes';

export type MapType = 'standard' | 'satellite' | 'hybrid';

interface NativeProps extends ViewProps {
  mapType?: WithDefault<MapType, 'standard'>;
}

export default codegenNativeComponent<NativeProps>('NativeViewsWorkshopsView');
