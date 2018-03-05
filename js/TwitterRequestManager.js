/**
 * @flow
 * @format
 */
'use strict';

const TwitterRequestManager = require('react-native').NativeModules.TwitterRequestManager;

module.exports = {
  /**
   * Get user verify credentials
   */
  getVerifyCredentials(): Promise<Object> {
    return TwitterRequestManager.getVerifyCredentials();
  },
};
