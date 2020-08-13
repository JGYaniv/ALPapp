import { StyleSheet, StatusBar } from "react-native";
import colors from '../colors';

export const styles = StyleSheet.create({
  container: {
    paddingTop: Platform.OS == "android" ? StatusBar.currentHeight : 0,
    flex: 1,
    backgroundColor: colors.secondary,
    // marginBottom: "15%",
  },
  inputsContainer: {
    marginHorizontal: "5%",
  },
  input: {
    marginBottom: "2%",
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