import React, { useContext } from 'react';
import { Image, StyleSheet, View, TouchableOpacity } from 'react-native';
import { BottomNavigation, Text, Button } from 'react-native-paper';
import FontAwesome5 from 'react-native-vector-icons/FontAwesome5';
import * as RootNavigation from '../RootNavigation';
import { GlobalContext } from './GlobalContext'

export default () => {

  const cont = useContext(GlobalContext)
  if (cont.isLoggedIn === false) {
    return (
      <View></View>
    )
  } else {
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