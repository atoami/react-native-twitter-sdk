//
//  RNTwitterSDKRequestManager.m
//  RNTwitterSDK
//
//  Created by Ato on 05/03/2018.
//  Copyright © 2018 Muso. All rights reserved.
//

#import "RNTwitterSDKRequestManager.h"

#import <React/RCTUtils.h>
#import <React/RCTConvert.h>

#import <TwitterKit/TWTRKit.h>

@implementation RNTwitterSDKRequestManager

RCT_EXPORT_MODULE(TwitterRequestManager);

#pragma mark - Object Lifecycle

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(getVerifyCredentials:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    [self _getVerifyCredentials:resolve rejecter:reject];
};

#pragma mark - Helper Methods

- (void)_getVerifyCredentials:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject
{
    TWTRAPIClient *client = [TWTRAPIClient clientWithCurrentUser];

    NSError *clientError;
    NSURLRequest *request = [client URLRequestWithMethod:@"GET"
                                               URLString:@"https://api.twitter.com/1.1/account/verify_credentials.json"
                                              parameters:@{@"include_email": @"true", @"skip_status": @"true"}
                                                   error:&clientError];

    if (request) {
        [client sendTwitterRequest:request completion:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (connectionError) {
                reject(@"TwitterSDK", @"Request Error", connectionError);
            } else {
                NSError *jsonError;
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                resolve(json);
            }
        }];
    } else {
        reject(@"TwitterSDK", @"Client Error", clientError);
    }
}

@end

