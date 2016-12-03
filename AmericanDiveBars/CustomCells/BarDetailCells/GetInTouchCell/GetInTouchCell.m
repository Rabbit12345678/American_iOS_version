//
//  GetInTouchCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 9/15/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "GetInTouchCell.h"

@implementation GetInTouchCell

- (void)awakeFromNib {
    // Initialization code
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellUI
{
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    
    [CommonUtils setLeftImageToTextField:self.txtName andImage:@"name.png" andImgWidth:25 andImgHeight:25 withPadding:35];
    [CommonUtils setLeftImageToTextField:self.txtPhone andImage:@"mobile.png" andImgWidth:25 andImgHeight:25 withPadding:35];
    [CommonUtils setLeftImageToTextField:self.txtEmail andImage:@"email.png" andImgWidth:25 andImgHeight:25 withPadding:35];
    
    [self.txtName setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtPhone setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtEmail setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.txtComment setContentInset:UIEdgeInsetsMake(-2, -4, 0, 0)];
}

@end
