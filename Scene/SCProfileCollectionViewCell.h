//
//  SCProfileCollectionViewCell.h
//  Scene
//
//  Created by Patrick Tescher on 1/22/14.
//  Copyright (c) 2014 WillCall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCProfileCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *profileLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UIButton *introduceButton;

@end
