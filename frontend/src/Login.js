import React, { useState } from "react";
import {
  Image,
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  TouchableHighlight,
  Platform,
  StatusBar,
  Button,
  SafeAreaView,
  Dimensions,
} from "react-native";
import { TextInput } from "react-native-paper";

import colors from "../config/colors";

// const handlePress = () => {};

export default function Login({ navigation }) {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [library, setLibrary] = useState("");

  return (
    <View style={[styles.container]}>
      <Image
        resizeMode="contain"
        style={styles.image}
        source={require("../assets/aln3.png")}
      />
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
        <TextInput
          mode="outlined"
          label="Confirm Password"
          value={confirmPassword}
          style={styles.input}
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
        <TouchableOpacity
          onPress={() => console.log("Sign up")}
          style={styles.buttons}
        >
          <Text style={styles.buttonText}>Sign up</Text>
        </TouchableOpacity>
        <TouchableOpacity
          onPress={() => console.log("Login")}
          style={styles.buttons}
        >
          <Text style={styles.buttonText}>Login</Text>
        </TouchableOpacity>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    paddingTop: Platform.OS == "android" ? StatusBar.currentHeight : 0,
    flex: 1,
    backgroundColor: colors.secondary,
  },
  inputsContainer: {
    marginHorizontal: "5%",
  },
  input: {
    marginBottom: "2%",
  },
  image: {
    width: "100%",
    height: "45%",
  },
  lowerButtons: {
    flexDirection: "row",
    marginHorizontal: "5%",
    height: "10%",
  },
  buttons: {
    flex: 1,
    alignItems: "center",
    justifyContent: "center",
    backgroundColor: colors.primary,
    borderColor: colors.black,
    paddingHorizontal: "2%",
  },
  buttonText: {
    fontSize: 20,
  },
});
