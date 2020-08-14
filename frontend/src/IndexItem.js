import React, { useContext } from "react";
import {
  Image,
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  Button,
} from "react-native";
import { styles } from '../config/stylesheets/IndexStyle'
import { GlobalContext } from './GlobalContext'

export default function IndexItem(props){
    const cont = useContext(GlobalContext)

    const handleShowBook = (event => {

            props.navigation.navigate("Show")
            cont.showBook(props.book)
        });

    return(
        <View style={props.style}>
            <Text style={[styles.author]}>{props.book.author}</Text>
            <Text style={[styles.title]} onPress={handleShowBook} >{props.book.title}</Text>
        </View>
    )
}