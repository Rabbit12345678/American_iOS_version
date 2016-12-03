//
//  ResetPasswordCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 9/9/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "ResetPasswordCell.h"

@implementation ResetPasswordCell

- (void)awakeFromNib {
    // Initialization code
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellUI {
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    
    [CommonUtils setLeftImageToTextField:self.txtVarifCode andImage:@"password.png" andImgWidth:25 andImgHeight:25 withPadding:35];
    [CommonUtils setLeftImageToTextField:self.txtNewPassword andImage:@"password.png" andImgWidth:25 andImgHeight:25 withPadding:35];
    [CommonUtils setLeftImageToTextField:self.txtConfirmNewPassword andImage:@"password.png" andImgWidth:25 andImgHeight:25 withPadding:35];
    
    [self.txtVarifCode setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtNewPassword setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtConfirmNewPassword setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
}

@end
