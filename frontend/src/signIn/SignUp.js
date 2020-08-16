import React, { useState, useContext } from "react";
import {
  Image,
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  TouchableHighlight,
  Platform,
  StatusBar,
  SafeAreaView,
  Dimensions,
  ScrollView
} from "react-native";
import { TextInput, Button } from "react-native-paper";
import { GlobalContext } from '../GlobalContext'

import InitialPicture from './initialPicture'
import { styles } from '../../config/stylesheets/SingInStyle'




// const handlePress = () => {};

export default function SignUp({ navigation }) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [library, setLibrary] = useState("");
  const cont = useContext(GlobalContext)

  return (

    // <ScrollView style={[styles.scrollView]}>
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
          textContentType='password'
          style={styles.input}
          onChangeText={(password) => setPassword(password)}
        />
        <TextInput
          mode="outlined"
          label="Confirm Password"
          value={confirmPassword}
          style={styles.input}
          textContentType='password'
          onChangeText={(confirmPassword) =>
            setConfirmPassword(confirmPassword)
          }
        />
        <TextInput
          mode="outlined"
          label="Library"
          value={library}
          style={styles.input}
          onChangeText={(library) => setLibrary(library)}
        />
      </View>
      <View style={styles.lowerButtons}>
        <Button
          mode='contained'
          onPress={cont.toggleLogin}
          style={styles.buttons}
        >
          Sign up
        </Button>
        <Button
          mode='contained'
          onPress={() => navigation.navigate("LogIn")}
          style={styles.buttons}
        >
          Login
        </Button>
      </View>
    </View>
    // </ScrollView>

  );
}


