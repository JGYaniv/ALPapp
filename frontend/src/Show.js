import React, { useContext } from 'react';
import { Text, View, SafeAreaView, ScrollView } from 'react-native';
import { Button, List } from "react-native-paper";
import { styles } from '../config/stylesheets/ShowStyle'
import { GlobalContext } from './GlobalContext'
const dummyData = require('../data_sample.json');

export default function Show({ route, navigation }) {
  // const cont = useContext(GlobalContext)
  // console.log('cont', cont)

  const [expanded, setExpanded] = React.useState(true);
  const handlePress = () => setExpanded(!expanded);
  const copy = dummyData.res.copies.filter(copy => {
    // console.log('copy.book_id',copy.book_id)
    return route.params.book.id === copy.book_id
  })
  // console.log('route.params.book.id', route.params.book.id)
  // console.log('route.params.book', route.params.book)
  // console.log('copy', copy)
  let checkOutHistory;
  if (copy.length > 0){
    checkOutHistory = dummyData.res.checkouts.filter(checkout => copy[0].id === checkout.copy_id)
  }
  
  // console.log('checkout', checkOutHistory)
  const hanldeUser = (userId) => {
    const user = dummyData.res.users.filter(user => userId === user.id)[0]
    return `${user.first_name} ${user.last_name}`
  }
  return (
    <ScrollView style={[styles.scrollView]}>
      <Button
        mode="contained"
        onPress={() => navigation.navigate("Checkout")}
        style={styles.buttons}
      // disabled={book.totalItems - book.CheckedOut === 0}
      >
        Checkout
      </Button>
      <View style={styles.list}>
        <Text style={styles.listItem}>ISBN : {route.params.book.isbn}</Text >
        <Text style={styles.listItem}>Author: {route.params.book.author}</Text>
        <Text style={styles.listItem}>Title: {route.params.book.title}</Text>
        <Text style={styles.listItem}>Genre: {route.params.book.genre}</Text>
      </View>
      
      <List.Accordion
        title="Check out History"
        left={props => <List.Icon {...props} icon="folder" />}
        expanded={expanded}
        onPress={handlePress}>

        {checkOutHistory && checkOutHistory.length > 0 ? checkOutHistory.map(checkout => {
          return (
            <List.Accordion
              key={checkout.id}
              // expanded={expanded}
              // onPress={handlePress}
              title={hanldeUser(checkout.user_id)}>
              <List.Item title={`checked out: ${checkout.checkout_time}`} />
              <List.Item title={`returned: ${checkout.return_time}`} />
            </List.Accordion>
          )

        }) : null}
      </List.Accordion>
    </ScrollView>

  )
}

