import React from 'react';
import { Image, Text, View } from 'react-native';
import { Button } from 'react-native-paper'
import { styles } from '../config/stylesheets/MainStyle';
import * as RootNavigation from '../RootNavigation';


export default function Main({ navigation }) {
  return (
    <View style={styles.container}>
        <Button
          style={styles.button}
          onPress={() =>
            RootNavigation.navigate('Scan')
          }
        > <Text style={{color:"black"}}>Check Out</Text></Button>
        <Button
          style={styles.button}
          onPress={() =>
            RootNavigation.navigate('Scan')
          }
        ><Text style={{color:"black"}}>Check In</Text></Button>
        <Button
          style={styles.button}
          onPress={() =>
            RootNavigation.navigate('Scan')
          }
        ><Text style={{color:"black"}}>Add Book</Text></Button>
    </View>
  )
}
