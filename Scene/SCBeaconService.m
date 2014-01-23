//
//  SCBeaconService.m
//  Scene
//
//  Created by Patrick Tescher on 1/22/14.
//  Copyright (c) 2014 WillCall. All rights reserved.
//

@import CoreLocation;
#import "SCBeaconService.h"
#import "Beacon.h"
#import "UserProfile.h"

static const NSString *scBeaconUUID = @"73098895-DE70-4DAD-8E5D-05D3105C2C84";
static const NSString *scBeaconIdentifier = @"Beacon of the Scene";

@interface SCBeaconService () <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation SCBeaconService

+ (SCBeaconService*)sharedService {
    static SCBeaconService *beaconService;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        beaconService = [SCBeaconService new];
    });
    return beaconService;
}

- (CLBeaconRegion*)beaconRegion {
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:scBeaconUUID.copy];
    return [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:self.profile.major.intValue minor:self.profile.minor.intValue identifier:scBeaconIdentifier.copy];
}

- (void)startScanningForBeacons {
    [self.locationManager startMonitoringForRegion:[self beaconRegion]];
}

- (CLLocationManager*)locationManager {
    if (_locationManager) {
        return _locationManager;
    }

    _locationManager = [CLLocationManager new];
    _locationManager.delegate = self;
    return _locationManager;
}

- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error {
    NSLog(@"DEBUG: Region monitoring failed - %@", error.localizedDescription);
}

- (void)locationManager:(CLLocationManager *)manager rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region withError:(NSError *)error {
    NSLog(@"DEBUG: Beacon ranging failed - %@", error.localizedDescription);
}

- (void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region {
    if ([region isKindOfClass:[CLBeaconRegion class]]) {
        CLBeaconRegion *beaconRegion = (CLBeaconRegion*)region;
        switch (state) {
            case CLRegionStateInside:
                NSLog(@"Inside region: %@", region.identifier);
                [manager startRangingBeaconsInRegion:beaconRegion];
                break;

            default:
                NSLog(@"Outside region: %@", region.identifier);
                [manager stopMonitoringForRegion:beaconRegion];
                break;
        }
    }
}

- (NSString*)stringFromProximity:(CLProximity)proximity {
    switch (proximity) {
        case CLProximityFar:
            return @"Far";
            break;
        case CLProximityNear:
            return @"Near";
            break;
        case CLProximityImmediate:
            return @"Immediate";
            break;
        case CLProximityUnknown:
            return @"Unknown";
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    for (CLBeacon *beacon in beacons) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"major = %@ AND minor = %@", beacon.major, beacon.minor];
        Beacon * dbBeacon = [Beacon MR_findFirstWithPredicate:predicate];
        if (dbBeacon == nil) {
            dbBeacon = [Beacon MR_createEntity];
            dbBeacon.major = beacon.major;
            dbBeacon.minor = beacon.minor;
            dbBeacon.proximityUUID = region.proximityUUID.UUIDString;
            dbBeacon.identifier = region.identifier;
            dbBeacon.firstSeenAt = [NSDate date];
        }
        dbBeacon.lastSeenAt = [NSDate date];
        dbBeacon.proximity = [self stringFromProximity:beacon.proximity];
        dbBeacon.accuracy = @(beacon.accuracy);
        dbBeacon.rssi = @(beacon.rssi);
        [dbBeacon.managedObjectContext MR_saveToPersistentStoreWithCompletion:nil];
    }
}

@end
