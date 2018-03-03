/**
 * @flow
 * @format
 */
'use strict';

const TwitterLoginManager = require('react-native').NativeModules.TwitterLoginManager;

export type LoginResult = {
  authToken: string,
  authTokenSecret: string,
  userID: string,
  userName: string,
};

module.exports = {
  /**
   * Logs the user in.
   */
  logIn(): Promise<LoginResult> {
    return TwitterLoginManager.logIn();
  },

  /**
   * Logs out the user.
   */
  logOut() {
    TwitterLoginManager.logOut();
  },
};
