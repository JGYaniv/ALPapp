import React from 'react';
export const defaultState = {
    isLoggedIn: false,
    thing: "is working",
    toggleLogin: () => {}
}
export const GlobalContext = React.createContext(defaultState);