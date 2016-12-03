//
//  MyProfileImageCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 10/2/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyProfileImageCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *imgUser;
@property (nonatomic, strong) IBOutlet UIButton *btnSelectImage;
@property (nonatomic, strong) IBOutlet UIButton *btnEditProfile;

-(void)configureCellUI:(BOOL)editable;
@end
