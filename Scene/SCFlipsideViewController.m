//
//  SCFlipsideViewController.m
//  Scene
//
//  Created by Patrick Tescher on 1/22/14.
//  Copyright (c) 2014 WillCall. All rights reserved.
//

#import "SCFlipsideViewController.h"

@interface SCFlipsideViewController ()

@end

@implementation SCFlipsideViewController

- (void)awakeFromNib
{
    self.preferredContentSize = CGSizeMake(320.0, 480.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
