import { View, StyleSheet } from 'react-native';
import { NativeViewsWorkshopsView } from 'react-native-native-views-workshops';

export default function App() {
  return (
    <View style={styles.container}>
      <NativeViewsWorkshopsView style={styles.box} mapType="hybrid" />
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
