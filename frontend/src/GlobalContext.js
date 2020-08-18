import React from 'react';
export const defaultState = {
    isLoggedIn: false,
    thing: "is working",
    toggleLogin: () => {},
    currentUser: null,
    loginUser: () => {},
    logOut: () => {}
}
export const GlobalContext = React.createContext(defaultState);