import React from 'react';
import { Image, StyleSheet, View, TouchableOpacity } from 'react-native';
import { BottomNavigation, Text, Button } from 'react-native-paper';
import FontAwesome5 from 'react-native-vector-icons/FontAwesome5';
import * as RootNavigation from '../RootNavigation';
// const IndexRoute = () => <Text></Text>;
// const indexIcon = <FontAwesome5 name={'book-opencommopen-bookents'} solid />;
// const ScanRoute = () => <Text></Text>;
// const scanIcon = <FontAwesome5 name={'barcode'} solid />;
// const SyncRoute = () => <Text></Text>;
// const syncIcon = <FontAwesome5 name={'sync'} solid />;

export default function Footer() {

  // const [index, setIndex] = React.useState(0);
  // const [routes] = React.useState([
  //   { key: 'scan', title: 'Scan', icon: `${scanIcon}` },    
  //   { key: 'index', title: 'Index', icon: `${indexIcon}` },
  //   { key: 'sync', title: 'Sync', icon: `${syncIcon}` },
  // ]);

  // const renderScene = BottomNavigation.SceneMap({
  //   index: IndexRoute,
  //   scan: ScanRoute,
  //   sync: SyncRoute,
  // });

  // return (
  //   <BottomNavigation
  //     navigationState={{ index, routes }}
  //     onIndexChange={setIndex}
  //     renderScene={renderScene}
  //   />
  // );


  return (
    <View style={styles.footerStyle}>
      <Button
        style={styles.buttons}
        onPress={() =>
          RootNavigation.navigate('Scan')
        }
      >
        <FontAwesome5 name={'barcode'} solid style={styles.icons} />
      </Button>

      <Button style={styles.buttons} onPress={() =>
        RootNavigation.navigate('Index')
      }>
        <FontAwesome5 name={'book-open'} solid style={styles.icons} />
      </Button>

      <Button style={styles.buttons}>
        <FontAwesome5 name={'paper-plane'} solid style={styles.icons} />
      </Button>

      <Button style={styles.buttons}>
        <FontAwesome5 name={'sync-alt'} solid style={styles.icons} />
      </Button>

    </View>
  )
}

const styles = StyleSheet.create({
  footerStyle: {
    position: 'absolute',
    display: 'flex',
    left: 0,
    right: 0,
    bottom: -10,
    backgroundColor: '#f9d392',
    flexDirection: 'row',
    height: 70,
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  icons: {
    color: '#282828',
    fontSize: 25,

  },
  buttons: {
    marginBottom: 15,
  },
});