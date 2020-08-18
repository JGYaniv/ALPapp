import React, { useContext } from "react";
import {
  Image,
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  Button,
} from "react-native";
import { styles } from '../../config/stylesheets/IndexStyle'

export default function IndexItem(props){

    const handleShowBook = (event => {

            props.navigation.navigate("Show", {
                book: props.book
            });

        });

    return(
        <View style={props.style}>
            <Text style={[styles.author]}>{props.book.author}</Text>
            <Text style={[styles.title]} onPress={handleShowBook} >{props.book.title}</Text>
        </View>
    )
}