import React from 'react';
import { Image, StyleSheet, Text, View, TouchableOpacity} from 'react-native';
import { TextInput, Button } from "react-native-paper";
import { styles } from '../config/stylesheets/SingInStyle';
import InitialPicture from './signIn/initialPicture'

export default function Splash({ navigation }) {
  return (
    <View style={[styles.container]}>
      {/* <Button
        title="Go to Index"
        onPress={() =>
          navigation.navigate('SignUp')
        }
      />
      <Button
        title="Go to Login"
        onPress={() =>
          navigation.navigate('LogIn')
        }
      />
      <Text>HI splash</Text> */}
      <InitialPicture />
            <View style={styles.lowerButtons}>
        <Button
          mode='contained'
          // onPress={() => navigation.navigate("LogIn")}
          onPress={() =>
            navigation.navigate('SignUp')
          }
          style={styles.buttons}
        >
          Login
        </Button>
        <Button
          mode='contained'
          onPress={() =>
            navigation.navigate('SignUp')
          }
          style={styles.buttons}
        >
          Sign up
        </Button>
      </View>
    </View>
  )
}