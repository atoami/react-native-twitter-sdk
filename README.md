# React Native TwitterSDK [iOS Only]
React Native TwitterSDK is a wrapper around the iOS Twitter SDK.

## Installation

Using npm:

```shell
npm install --save react-native-twitter-sdk
```

## Linking

### Manually

Download and add Twitter Kit to your project:
* Download [Twitter Kit](https://ton.twimg.com/syndication/twitterkit/ios/3.3.0/Twitter-Kit-iOS.zip) and unzip under `~/Documents/TwitterSDK` directory on your Mac.
* Drag contents to the root of your project in Xcode
* Make sure that `~/Documents/TwitterSDK` is in the Framework Search Path of your build target's Build Settings.

In XCode, in the project navigator:

* Right click _Libraries_
* Add Files to _[your project's name]_
* Go to `node_modules/react-native-twitter-sdk/ios`
* Add the `.xcodeproj` file
* Add the `libRNTwitterSDK.a` from the _RNTwitterSDK_ project to your project's _Build Phases ➜ Link Binary With Libraries_

In XCode, in the project navigator, select your project.

* Add TwitterKit to "Embedded Binaries" in your Xcode project settings
* Add TwitterKit and TwitterCore to "Linked Frameworks and Libraries" in your Xcode project settings

## Usage

Complete the following steps.
1. [Initialize Twitter Kit](https://github.com/twitter/twitter-kit-ios/wiki/Installation#initialize-twitter-kit)
2. [Configure Info.Plist](https://github.com/twitter/twitter-kit-ios/wiki/Installation#configure-infoplist)
3. [Handling Log in Redirect](https://github.com/twitter/twitter-kit-ios/wiki/Log-In-With-Twitter#handling-log-in-redirect)

```
import { TwitterLoginManager } from 'react-native-twitter-sdk';

TwitterLoginManager.logIn()
  .then(result => console.log(result))
  .catch((error) => console.log(error));
```

## Copyright and license

Code released under [the MIT license](https://github.com/atoami/react-native-twitter-sdk/blob/master/LICENSE).

## Inspiration

[react-native-fbsdk](https://github.com/facebook/react-native-fbsdk)
