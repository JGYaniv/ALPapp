import React from 'react';
import { Image, StyleSheet, Text, View, TouchableOpacity, Button } from 'react-native';
import Camera from 'react-native-camera';

export default function Scan({ navigation }) {
  return (
    <View>
      <Button
        title="Go to Index"
        onPress={() =>
          navigation.navigate('Index')
        }
      />
      <Text>HI scan</Text>
    </View>
  )
}