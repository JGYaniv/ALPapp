import React, { useState } from 'react';
import { Image, StyleSheet, View, TouchableOpacity, FlatList, Button } from 'react-native';

import 'react-native-gesture-handler';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import { Provider as PaperProvider, BottomNavigation, Text } from 'react-native-paper';

import Splash from './src/Splash'
import Index from './src/Index'
import Checkout from './src/Chekout'
import Show from './src/Show'
import Scan from './src/Scan'
import Footer from './src/Footer'
import LogIn from './src/signIn/LogIn';
import SignUp from './src/signIn/SignUp';
import Dummy from './src/Dummy'
import { GlobalContext, defaultState } from './src/GlobalContext'
import { navigationRef } from './RootNavigation';


import * as ImagePicker from 'expo-image-picker';
import { StatusBar } from 'expo-status-bar';


const Stack = createStackNavigator();

console.log('defaultState', defaultState)

class App extends React.Component {
  constructor(props) {
    super(props);

    this.toggleLogin = () => {
      this.setState(state => ({
        isLoggedIn:
          state.isLoggedIn === false
            ? true
            : false
      }));
    };

    this.showBook = (book) => {
      this.setState({
        bookToShow: book
      });
    };

    this.state = {
      isLoggedIn: false,
      thing: "is working",
      toggleLogin: this.toggleLogin,
      bookToShow: {},
      showBook: this.showBook
    };
  }

  render() {
    return (

      <GlobalContext.Provider value={this.state}>
        <PaperProvider>
          <NavigationContainer ref={navigationRef}>

            <Stack.Navigator>
              <Stack.Screen name="Splash" component={Splash}></Stack.Screen>
              <Stack.Screen name="Index" component={Index}></Stack.Screen>
              <Stack.Screen name="LogIn" component={LogIn}></Stack.Screen>
              <Stack.Screen name="SignUp" component={SignUp}></Stack.Screen>
              <Stack.Screen name="Show" component={Show}></Stack.Screen>
              <Stack.Screen name="Checkout" component={Checkout}></Stack.Screen>
              <Stack.Screen name="Scan" component={Scan}></Stack.Screen>
            </Stack.Navigator>
            <Dummy />
            <Footer />

          </NavigationContainer>
        </PaperProvider>
      </GlobalContext.Provider>
    );
  }
}

export default App

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
  logo: {
    width: 305,
    height: 159,
    marginBottom: 10,
  },
  instructions: {
    color: "#888",
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
    color: "#fff",
  },
  thumbnail: {
    width: 300,
    height: 300,
    resizeMode: "contain",
  },
  footerStyle: {
    position: 'absolute',
    flex: 0.1,
    left: 0,
    right: 0,
    bottom: -10,
    backgroundColor: '#ffe87a',
    flexDirection: 'row',
    height: 90,
    alignItems: 'center',
    justifyContent: 'center',
  },
  titleStyle: {
    color: 'white'
  },
});
