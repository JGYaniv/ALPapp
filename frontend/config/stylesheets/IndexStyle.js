import { StyleSheet, StatusBar } from "react-native";
import colors from '../colors';

export const styles = StyleSheet.create({
  container: {
    margin: "2%",
    marginTop: 4,
    paddingTop: Platform.OS == "android" ? StatusBar.currentHeight : 0,
    // flex: 1,
    borderRadius: 4,
    backgroundColor: colors.lightgray,
    shadowColor: colors.shadow,
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,

    elevation: 5,
    // padding: "2%"
    // marginBottom: "15%",
  },
  noBorderBook: {
    padding: 8,
    margin: 2,
    // marginHorizontal: "5%",
    display: "flex",
    flexDirection: "row",
    // justifyContent: "space-between"
  },
  book: {
    padding: 8,
    margin: 2,
    // marginHorizontal: "5%",
    display: "flex",
    flexDirection: "row",
    borderBottomColor: colors.gray,
    borderBottomWidth: 1
    // justifyContent: "space-between"
  },
  author: {
    marginBottom: "2%",
    width: "30%"
  },
  title: {
    marginBottom: "2%",
    paddingRight: "10%"
  },
  searchcontainer: {
    margin: "2%",
  },
  lowerButtons: {
    // flexDirection: 'column',
    marginHorizontal: "5%",
    // height: "10%",
  },
  buttons: {
    // flex: 1,
    backgroundColor: colors.primary,
    marginBottom: '5%'
  },
  buttonText: {
    fontSize: 20,
  },
});