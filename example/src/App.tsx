import { useRef } from 'react';
import { View, StyleSheet, Button } from 'react-native';
import {
  NativeViewsWorkshopsView,
  Commands,
  type Coordinates,
} from 'react-native-native-views-workshops';

export default function App() {
  const viewRef = useRef(null);

  const handleMoveTo = () => {
    if (viewRef.current) {
      Commands.moveTo(viewRef.current, 50.04, 19.96, true);
    }
  };

  const addMarker = (position: Coordinates) => {
    if (viewRef.current) {
      Commands.addMarker(
        viewRef.current,
        position.latitude,
        position.longitude
      );
    }
  };

  return (
    <View style={styles.container}>
      <NativeViewsWorkshopsView
        ref={viewRef}
        style={styles.box}
        mapType="standard"
        onPress={(event) => {
          addMarker(event.nativeEvent);
        }}
        cameraCenter={{ latitude: 50.04, longitude: 19.96 }}
      />
      <View style={styles.buttonBar}>
        <Button title="moveTo" onPress={handleMoveTo} />
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    paddingBottom: 30,
  },
  box: {
    width: '100%',
    flex: 1,
  },
  buttonBar: {
    width: '100%',
    flexDirection: 'row',
    justifyContent: 'space-around',
    paddingTop: 20,
  },
});
