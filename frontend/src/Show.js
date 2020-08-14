import React, { useContext } from 'react';
import { Text, View, SafeAreaView, ScrollView } from 'react-native';
import { Button, List } from "react-native-paper";
import { styles } from '../config/stylesheets/ShowStyle'
import { GlobalContext } from './GlobalContext'
const cont = useContext(GlobalContext)
console.log('cont', cont)

export default function Show({ navigation }) {

  const [expanded, setExpanded] = React.useState(true);
  const handlePress = () => setExpanded(!expanded);

  return (


    <SafeAreaView style={styles.container}>
      <ScrollView style={styles.scrollView}>
        <Button
          mode='contained'
          onPress={() => navigation.navigate("Checkout")}
          style={styles.buttons}
          disabled={book.totalItems - book.CheckedOut === 0}
        >
          Checkout
      </Button>
        <View style={styles.list}>
          < Text > {cont.bookToShow.isbn}</Text >
          <Text>{cont.bookToShow.author}</Text>
          <Text>{cont.bookToShow.title}</Text>
          <Text>{cont.bookToShow.genre}</Text>

        </View>
        {/* <List.Accordion
          title="Check out History"
          left={props => <List.Icon {...props} icon="folder" />}
          expanded={expanded}
          onPress={handlePress}>
          {book.CheckOutHistory.length > 0 ? book.CheckOutHistory.map((user, idx) => {
            return <List.Item key={idx} title={user} />
          }) : null}
        </List.Accordion> */}
      </ScrollView>
    </SafeAreaView >
  )
}

