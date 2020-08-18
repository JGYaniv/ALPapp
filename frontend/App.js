import React, { useState } from 'react';
import { Image, StyleSheet, View, TouchableOpacity, FlatList, Button } from 'react-native';

import 'react-native-gesture-handler';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import { Provider as PaperProvider, BottomNavigation, Text } from 'react-native-paper';

import Splash from './src/Splash'
import Index from './src/index/Index'
import Checkout from './src/Chekout'
import Show from './src/Show'
import Scan from './src/Scan'
import Main from './src/Main'
import Footer from './src/footerheader/Footer'
import LogIn from './src/signIn/LogIn';
import SignUp from './src/signIn/SignUp';
import Dummy from './src/Dummy'
import { GlobalContext, defaultState } from './src/GlobalContext'
import { navigationRef } from './RootNavigation';


import * as ImagePicker from 'expo-image-picker';
import { StatusBar } from 'expo-status-bar';

import {
  ApolloClient,
  InMemoryCache,
  ApolloProvider,
  useQuery,
  gql
} from '@apollo/client';

const dummyData = require('./data_sample.json');

const client = new ApolloClient({
  // uri: 'http://localhost:4000/graphql',
  // uri: 'http://localhost:19002',
  cache: new InMemoryCache({
      TypePolicy: {
        User: {
          keyFields: ["id", "first_name", "last_name"],
        },
        Library: {
          keyFields: ["id", "name", "address"],
        },
        Checkout: {
          keyFields: ["id", "copy_id", "user_id", "checkout_time", "return_time"],
        },
        Copy: {
          keyFields: ["library_id", "id", "book_id", "book_number"],
        },
        Book: {
          keyFields: ["title", "author", "isbn", "genre", "id"],
        },
      },
    }
  ),
});
// https://www.apollographql.com/docs/react/caching/cache-configuration/ --- to follow


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

    this.loginUser = (user) => {
      this.setState(user => ({
        currentUser: user
      }));
    };

    this.logOut = () => {
      this.setState(user => ({
        currentUser: null
      }));
    };


    this.state = {
      isLoggedIn: false,
      thing: "is working",
      toggleLogin: this.toggleLogin,
      currentUser: null,
      loginUser: this.loginUser,
      logOut: this.logOut
    };
  }

  render() {
    return (
      // <ApolloProvider client={client}>

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
              <Stack.Screen name="Main" component={Main}></Stack.Screen>
            </Stack.Navigator>
            {/* <Dummy /> */}
            <Footer />

          </NavigationContainer>
        </PaperProvider>
     </GlobalContext.Provider> 
      // </ApolloProvider>
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
