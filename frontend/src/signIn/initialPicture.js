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


import colors from "../../config/colors";

export default function InitialImage() {

  return (
    <Image
      resizeMode="contain"
      style={styles.image}
      source={require("../../assets/aln3.png")}
    />
  )
}

const styles = StyleSheet.create({
  image: {
    width: "100%",
    height: "35%",
  },
})