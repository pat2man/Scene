//
//  Beacon.h
//  Scene
//
//  Created by Patrick Tescher on 1/22/14.
//  Copyright (c) 2014 WillCall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class UserProfile;

@interface Beacon : NSManagedObject

@property (nonatomic, retain) NSString * identifier;
@property (nonatomic, retain) NSString * proximityUUID;
@property (nonatomic, retain) NSNumber * major;
@property (nonatomic, retain) NSNumber * minor;
@property (nonatomic, retain) NSDate * lastSeenAt;
@property (nonatomic, retain) NSDate * firstSeenAt;
@property (nonatomic, retain) NSNumber * accuracy;
@property (nonatomic, retain) NSNumber * rssi;
@property (nonatomic, retain) NSString * proximity;
@property (nonatomic, retain) UserProfile *userProfile;

@end
