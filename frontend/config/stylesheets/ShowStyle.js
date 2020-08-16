import { StyleSheet, StatusBar } from "react-native";
import colors from '../colors';

export const styles = StyleSheet.create({
  showMain: {
    paddingTop: Platform.OS == "android" ? StatusBar.currentHeight : 0,
    flex: 1,
    backgroundColor: colors.white,
  },
  buttons: {
    backgroundColor: colors.secondary,
    marginHorizontal: '5%',
    marginBottom: '2%',
    marginTop: '2%'
  },
  list: {
    marginHorizontal: '5%',
    backgroundColor: colors.lightgray,
    shadowOffset: {
      width: 0,
      height: 2,
    },
    paddingHorizontal: '2%',
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
    elevation: 5,
  },
  listItem: {
    borderColor: colors.gray,
    borderBottomColor: colors.gray,
    borderBottomWidth: 1,
    height: 45,
    textAlignVertical: 'center',
  }
})