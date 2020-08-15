import React, { useContext } from 'react';
import { Text, View, SafeAreaView, ScrollView } from 'react-native';
import { Button, List } from "react-native-paper";
import { styles } from '../config/stylesheets/ShowStyle'
import { GlobalContext } from './GlobalContext'

export default function Show({ navigation }) {
  const cont = useContext(GlobalContext)
  console.log('cont', cont)

  const [expanded, setExpanded] = React.useState(true);
  const handlePress = () => setExpanded(!expanded);
  const copy = dummyData.res.copies.filter(copy => cont.bookToShow.id === copy.book_id)
  console.log('copy', copy)
  const checkOutHistory = dummyData.res.checkouts.filter(checkout => copy[0].id === checkout.copy_id)
  console.log('checkout', checkOutHistory)
  const hanldeUser = (userId) => {
    const user = dummyData.res.users.filter(user => userId === user.id)[0]
    return `${user.first_name} ${user.last_name}`
  }
  return (
      </Button>
      <View style={styles.list}>
        <Text style={styles.listItem}>ISBN : {cont.bookToShow.isbn}</Text >
        <Text style={styles.listItem}>Author: {cont.bookToShow.author}</Text>
        <Text style={styles.listItem}>Title: {cont.bookToShow.title}</Text>
        <Text style={styles.listItem}>Genre: {cont.bookToShow.genre}</Text>
      </View>
      <List.Accordion
        title="Check out History"
        left={props => <List.Icon {...props} icon="folder" />}
        expanded={expanded}
        onPress={handlePress}>

        {checkOutHistory.length > 0 ? checkOutHistory.map(checkout => {
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

