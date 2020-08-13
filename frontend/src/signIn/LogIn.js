import React, { useState } from "react";
import { TextInput, Button } from "react-native-paper";
import { StyleSheet, StatusBar, View } from "react-native";

import InitialPicture from './initialPicture'
import { styles } from '../../config/stylesheets/SingInStyle'

import colors from "../../config/colors";

export default function LogIn({ navigation }) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");


  return (
    <View style={[styles.container]}>
      <InitialPicture />
      <View style={styles.inputsContainer}>
        <TextInput
          mode="outlined"
          label="Email"
          value={email}
          style={styles.input}
          onChangeText={(email) => setEmail(email)}
        />
        <TextInput
          mode="outlined"
          label="Password"
          value={password}
          style={styles.input}
          onChangeText={(password) => setPassword(password)}
        />
      </View>
      <View style={styles.lowerButtons}>
        <Button
          mode='contained'
          // onPress={() => navigation.navigate("LogIn")}
          onPress={() => console.log("LogIn")}
          style={styles.buttons}
        >
          Login
        </Button>
        <Button
          mode='contained'
          onPress={() => navigation.navigate("SignUp")}
          style={styles.buttons}
        >
          Sign up
        </Button>
      </View>
    </View>
  );
}