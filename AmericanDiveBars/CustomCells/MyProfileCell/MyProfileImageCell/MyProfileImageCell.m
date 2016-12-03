//
//  MyProfileImageCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 10/2/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import "MyProfileImageCell.h"

@implementation MyProfileImageCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellUI:(BOOL)editable {
    
    self.btnSelectImage.layer.cornerRadius = self.btnSelectImage.frame.size.height/2;
    self.btnSelectImage.layer.masksToBounds = YES;
    
    if (editable) {
        [self.btnEditProfile setBackgroundImage:[UIImage imageNamed:@"edit-profile.png"] forState:UIControlStateNormal];
        self.btnSelectImage.hidden = NO;
        self.imgUser.layer.borderColor = [[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor];
    }
    else {
        [self.btnEditProfile setBackgroundImage:[UIImage imageNamed:@"edit-profile-gray.png"] forState:UIControlStateNormal];
        self.btnSelectImage.hidden = YES;
        self.imgUser.layer.borderColor = [[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor];
    }
    
    
    self.imgUser.layer.borderWidth = 0.8;
    self.imgUser.layer.cornerRadius = self.imgUser.frame.size.height /2;
    self.imgUser.layer.masksToBounds = YES;    
}

@end
