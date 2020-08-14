import React from 'react';
export const defaultState = {
    isLoggedIn: false,
    thing: "is working",
    toggleLogin: () => {},
    bookToShow: {},
    showBook: () => {}
}
export const GlobalContext = React.createContext(defaultState);