//
//  RNTwitterSDKLoginManager.m
//  RNTwitterSDKLoginManager
//
//  Created by Ato on 03/03/2018.
//  Copyright © 2018 Muso. All rights reserved.
//

#import "RNTwitterSDKLoginManager.h"

#import <React/RCTUtils.h>
#import <React/RCTConvert.h>

#import <TwitterKit/TWTRKit.h>

@implementation RNTwitterSDKLoginManager

RCT_EXPORT_MODULE(TwitterLoginManager);

#pragma mark - Object Lifecycle

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(logIn:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    [self _loginWithCompletion:resolve rejecter:reject];
};

RCT_EXPORT_METHOD(logOut)
{
    TWTRSessionStore *store = [[Twitter sharedInstance] sessionStore];
    NSString *userID = store.session.userID;
    [store logOutUserID:userID];
}

#pragma mark - Helper Methods

- (void)_loginWithCompletion:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject
{
    [[Twitter sharedInstance] logInWithCompletion:^(TWTRSession * _Nullable session, NSError * _Nullable error) {
        if (error) {
            reject(@"TwitterSDK", @"Login Error", error);
        } else {
            resolve(RCTBuildResultDictionary(session));
        }
    }];
}

static NSDictionary *RCTBuildResultDictionary(TWTRSession *session)
{
    return @{
        @"authToken": session.authToken,
        @"authTokenSecret": session.authTokenSecret,
        @"userID": session.userID,
        @"userName": session.userName
    };
}

@end
