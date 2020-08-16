import React, { useState, useContext } from "react";
import { TextInput, Button } from "react-native-paper";
import { View } from "react-native";
import { GlobalContext } from './../GlobalContext'

import InitialPicture from './initialPicture'
import { styles } from '../../config/stylesheets/SingInStyle'

export default function LogIn({ navigation }) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const cont = useContext(GlobalContext)

  const handleLogin = () => {
    cont.toggleLogin()
    navigation.navigate("Index")
  }



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
          secureTextEntry={true}
          onChangeText={(password) => setPassword(password)}
        />
      </View>
      <View style={styles.lowerButtons}>
        <Button
          mode='contained'
          // onPress={() => navigation.navigate("LogIn")}
          onPress={handleLogin}
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