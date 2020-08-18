import React, { useContext } from "react";
import {
  Image,
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  Button,
} from "react-native";
import { Searchbar } from 'react-native-paper';
import IndexItem from './IndexItem'
import { styles } from '../../config/stylesheets/IndexStyle'

import { GlobalContext } from '../GlobalContext'
const dummyData = require('../../data_sample.json');
let booksArray = dummyData.res.books;

export default ({ navigation }) => {
  const cont = useContext(GlobalContext)
  // console.log('dummyData', dummyData.res.books[0].author)
  const [searchQuery, setSearchQuery] = React.useState('');

  const onChangeSearch = query => setSearchQuery(query);



  if (cont.isLoggedIn === false) {

    return (
      <View>
        <Button
          title="Go to Login"
          onPress={() => navigation.navigate("LogIn")}
        />
        <Button
          title="change global state"

          onPress={cont.toggleLogin}
        />
      </View>
    )
  } else {

    return (
      <View>
        {/* <Button
          title="Go to Splash"
          onPress={() => navigation.navigate("Splash")}
        />
        <Button
          title="Go to Login"
          onPress={() => navigation.navigate("LogIn")}
        />
        <Text>HI index</Text> */}
        {/* <Button
          title="change global state"

          onPress={cont.toggleLogin}
        /> */}
        <View style={[styles.searchcontainer]}>
          <Searchbar
            placeholder="Search"
            onChangeText={onChangeSearch}
            value={searchQuery}
          />
        </View>



        <View style={[styles.container]}>
          {booksArray.map((book, id) => {
            return <IndexItem
              key={id}
              book={book}
              navigation={navigation}
              style={(id === booksArray.length - 1) ? styles.noBorderBook : styles.book} />
          })}
        </View>


      </View>
    );
  }
}
