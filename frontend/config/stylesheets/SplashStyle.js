import { StyleSheet, StatusBar } from "react-native";
import colors from '../colors';

export const styles = StyleSheet.create({
  container: {
    paddingTop: Platform.OS == "android" ? StatusBar.currentHeight : 0,
    flex: 1,
    backgroundColor: colors.secondary,

  },

  button: {
    // flex: 1,
    backgroundColor: colors.primary,
    marginBottom: '2%',
    marginTop: '25%'
  },
  buttonText: {
    fontSize: 20,
  },
  image: {
    // flex: 1,
    width: '100%'
  }
});