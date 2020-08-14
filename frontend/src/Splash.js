import React from 'react';
import { Image, StyleSheet, Text, View, TouchableOpacity, Button } from 'react-native';

export default function Splash({ navigation }) {
  return (
    <View>
      <Button
        title="Go to Index"
        onPress={() =>
          navigation.navigate('Index')
        }
      />
      <Button
        title="Go to Login"
        onPress={() =>
          navigation.navigate('LogIn')
        }
      />
      <Text>HI splash</Text>
    </View>
  )
}