//
//  SCMainViewController.h
//  Scene
//
//  Created by Patrick Tescher on 1/22/14.
//  Copyright (c) 2014 WillCall. All rights reserved.
//

#import "SCFlipsideViewController.h"

@interface SCMainViewController : UIViewController <SCFlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end
