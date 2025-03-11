import { View, StyleSheet, Button } from 'react-native';
import { NativeViewsWorkshopsView } from 'react-native-native-views-workshops';

export default function App() {
  return (
    <View style={styles.container}>
      <NativeViewsWorkshopsView color="#32a852" style={styles.box} />
      <View style={styles.buttonBar}>
        <Button title="Press me" onPress={() => {}} />
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
