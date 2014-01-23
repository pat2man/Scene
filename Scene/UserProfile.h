//
//  UserProfile.h
//  Scene
//
//  Created by Patrick Tescher on 1/22/14.
//  Copyright (c) 2014 WillCall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserProfile : NSManagedObject

@property (nonatomic, retain) NSNumber * major;
@property (nonatomic, retain) NSNumber * minor;
@property (nonatomic, retain) NSString * profileID;
@property (nonatomic, retain) NSString * profileImageURL;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * profileBody;
@property (nonatomic, retain) NSManagedObject *beacon;

@end
