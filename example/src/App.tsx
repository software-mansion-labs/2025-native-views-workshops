import { useRef } from 'react';
import { View, StyleSheet, Button } from 'react-native';
import {
  NativeViewsWorkshopsView,
  Commands,
} from 'react-native-native-views-workshops';

export default function App() {
  const viewRef = useRef(null);

  const handleMoveTo = () => {
    if (viewRef.current) {
      Commands.moveTo(viewRef.current, 50.04, 19.96, true);
    }
  };

  return (
    <View style={styles.container}>
      <NativeViewsWorkshopsView
        ref={viewRef}
        style={styles.box}
        mapType="hybrid"
        onPress={(event) => {
          console.log('onPress', event.nativeEvent);
        }}
        onRegionChange={(event) => {
          console.log('onRegionChange', event.nativeEvent);
        }}
      />
      <Button title="moveTo" onPress={handleMoveTo} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 300,
    height: 300,
    marginVertical: 20,
  },
});
