// import 'react-native-gesture-handler';
// import { StatusBar } from 'expo-status-bar';
// import React from 'react';
import React from 'react';
import 'react-native-gesture-handler';
import { NavigationContainer } from '@react-navigation/native';
import {createStackNavigator} from '@react-navigation/stack';
import { Provider as PaperProvider } from 'react-native-paper';
import Splash from './src/Splash'
import Index from './src/Index'
import Checkout from './src/Chekout'
import Show from './src/Show'
import Scan from './src/Scan' 
import Footer from './src/Footer' 
import { navigationRef } from './RootNavigation';
import { BottomNavigation, Text } from 'react-native-paper';


import { Image, StyleSheet, View, TouchableOpacity, FlatList, Button } from 'react-native';
import * as ImagePicker from 'expo-image-picker';
// import { NavigationContainer } from '@react-navigation/native';
// import { createStackNavigator } from '@react-navigation/stack';



const Stack = createStackNavigator();
// import * as Sharing from 'expo-sharing'; 

export default function App() {


  // const [selectedImage, setSelectedImage] = React.useState(null);
  // let openImagePickerAsync = async () => {
  //   let permissionResult = await ImagePicker.requestCameraRollPermissionsAsync();

  //   if (permissionResult.granted === false) {
  //     alert("Permission to access camera roll is required!");
  //     return;
  //   }

  //   let pickerResult = await ImagePicker.launchImageLibraryAsync();
  //   if (pickerResult.cancelled === true) {
  //     return;
  //   }

  //   setSelectedImage({ localUri: pickerResult.uri });
  // }

  return (
    <PaperProvider>

    
    <NavigationContainer ref={navigationRef}>
      <Stack.Navigator>
        <Stack.Screen name="Splash" component={Splash}></Stack.Screen>
        <Stack.Screen name="Index" component={Index}></Stack.Screen>
        <Stack.Screen name="Show" component={Show}></Stack.Screen>
        <Stack.Screen name="Checkout" component={Checkout}></Stack.Screen>
        <Stack.Screen name="Scan" component={Scan}></Stack.Screen>       
      </Stack.Navigator>
      <Footer/>
      {/* <View style={styles.footerStyle}>
        <Button
            title="Sc"
            onPress={() =>
                navigation.navigate('Scan')
            }
        />
        <Button
            title="Sc"
            onPress={() =>
                navigation.navigate('Scan')
            }
        />

      </View> */}
      
      {/* <View style={styles.container}>
        <Image source={{ uri: "https://i.imgur.com/TkIrScD.png" }} style={styles.logo}  />
        <Text style={styles.instructions} >
          To share a photo from your phone with a friend, just press the button below!
          </Text>
          <TouchableOpacity
          onPress={openImagePickerAsync}
          style={styles.button}>
          <Text style={styles.buttonText}>Pick a photo</Text>
        </TouchableOpacity>
      </View> */}
    </NavigationContainer>
    </PaperProvider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  logo: {
    width: 305,
    height: 159,
    marginBottom: 10,
  },
  instructions: {
    color: '#888',
    fontSize: 18,
    marginHorizontal: 15,
  }, 
  button: {
    backgroundColor: "blue",
    padding: 20,
    borderRadius: 5,
  },
  buttonText: {
    fontSize: 20,
    color: '#fff',
  }, 
  thumbnail: {
    width: 300,
    height: 300,
    resizeMode: "contain"
  },
  footerStyle: {
    position: 'absolute',
    flex:0.1,
    left: 0,
    right: 0,
    bottom: -10,
    backgroundColor:'#ffe87a',
    flexDirection:'row',
    height: 90,
    alignItems:'center',
    justifyContent: 'center',
  },
  titleStyle: {
    color: 'white'
  },
});
