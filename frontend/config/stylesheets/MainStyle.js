import { StyleSheet, StatusBar } from "react-native";
import colors from '../colors';

export const styles = StyleSheet.create({
  container: {
    paddingTop: Platform.OS == "android" ? StatusBar.currentHeight : 0,
    flex: 1,
    backgroundColor: colors.white,
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'center',
    alignItems: 'center'
  },

  button: {
    backgroundColor: colors.primary,
    marginBottom: '10%',
    borderRadius: 30,
    height: 60,
    width: 200,
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'center',
    alignItems: 'center',
    fontSize: 30,
    color: 'black',
    shadowColor: colors.shadow,
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
  }
});