import React from 'react';
import { Image, StyleSheet, Text, View, TouchableOpacity, Button } from 'react-native';

export default function Show({ navigation }){
    return(
        <View>
            <Button
                title="Go to Index"
                onPress={() =>
                    navigation.navigate('Index')
                }
             />
            <Text>HI show</Text>
        </View>
    )
}