import React from 'react';
import { Image, Text, View } from 'react-native';
import { Button } from 'react-native-paper'
import { styles } from '../config/stylesheets/SplashStyle';


export default function Splash({ navigation }) {
  return (
    <View style={styles.container}>
      <Image
        resizeMode="contain"
        style={styles.image}
        source={require("../assets/aln1.png")}
      />
      <Button
        style={styles.button}
        mode='contained'
        onPress={() =>
          navigation.navigate('LogIn')
        }
      >
        LogIn
      </Button>
    </View>
  )
}

