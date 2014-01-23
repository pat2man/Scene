//
//  SCFlipsideViewController.h
//  Scene
//
//  Created by Patrick Tescher on 1/22/14.
//  Copyright (c) 2014 WillCall. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SCFlipsideViewController;

@protocol SCFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(SCFlipsideViewController *)controller;
@end

@interface SCFlipsideViewController : UIViewController

@property (weak, nonatomic) id <SCFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
