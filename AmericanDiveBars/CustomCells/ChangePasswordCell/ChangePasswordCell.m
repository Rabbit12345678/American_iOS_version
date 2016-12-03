//
//  EditPasswordTableViewCell.m
//  BreetyNetwork
//
//  Created by admin on 30/01/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "ChangePasswordCell.h"

@implementation ChangePasswordCell

- (void)awakeFromNib {
    // Initialization code
    [self.contentView setBackgroundColor:[UIColor clearColor]];
    [self setBackgroundColor:[UIColor clearColor]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureUI {
    [CommonUtils setBorderAndCorner_ForTextField:self.txtOldPass
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtNewPass
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtConfirmPass
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [self.txtOldPass setTextColor:[UIColor whiteColor]];
    [self.txtNewPass setTextColor:[UIColor whiteColor]];
    [self.txtConfirmPass setTextColor:[UIColor whiteColor]];
    
    [self.txtOldPass setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtNewPass setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtConfirmPass setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];

}

@end
