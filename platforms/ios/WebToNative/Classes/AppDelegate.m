/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

//
//  AppDelegate.m
//  WebToNative
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import <OneSignal/OneSignal.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{

    if (@available(iOS 12.0, *)) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDarkContent animated:YES];
    } else {
        // Fallback on earlier versions
        //
            UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarManager"] valueForKey:@"statusBar"];
            if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
                statusBar.backgroundColor = [UIColor blackColor];
            }
    }

    self.viewController = [[MainViewController alloc] init];
    // Remove this method to stop OneSignal Debugging
  // [OneSignal setLogLevel:ONE_S_LL_VERBOSE visualLevel:ONE_S_LL_NONE];
  
  // // OneSignal initialization
  // [OneSignal initWithLaunchOptions:launchOptions];
  // [OneSignal setAppId:@"80507234-d249-4584-87c4-401181ee31ef"];

  // // promptForPushNotifications will show the native iOS notification permission prompt.
  // // We recommend removing the following code and instead using an In-App Message to prompt for notification permission (See step 8)
  // [OneSignal promptForPushNotificationsWithUserResponse:^(BOOL accepted) {
  //   NSLog(@"User accepted notifications: %d", accepted);
  // }];
  
  // Set your customer userId
  // [OneSignal setExternalUserId:@"userId"];
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
    
}

@end
