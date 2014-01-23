//
//  SCBeaconService.h
//  Scene
//
//  Created by Patrick Tescher on 1/22/14.
//  Copyright (c) 2014 WillCall. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserProfile;
@interface SCBeaconService : NSObject

@property (strong, nonatomic) UserProfile *profile;

+ (SCBeaconService*)sharedService;


@end
