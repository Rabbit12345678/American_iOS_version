//
//  ContactUsFormCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 10/21/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import "ContactUsFormCell.h"

@implementation ContactUsFormCell

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
    
    [self configureTextField:self.txtName];
    [self configureTextField:self.txtEmail];
    [self configureTextField:self.txtSubject];
    
    [self.txtComment setContentInset:UIEdgeInsetsMake(-2, 0, 0, 0)];
}

-(void)configureTextField:(UITextField *)textField {
    
    [CommonUtils setBorderAndCorner_ForTextField:textField
                                 forCornerRadius:2.5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:53.0/255.0 alpha:1.0] CGColor]];
    
    [textField setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [textField setTextColor:[UIColor whiteColor]];
    
    
    self.txtComment.layer.cornerRadius = 2.5;
    self.txtComment.layer.borderColor = [[UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:53.0/255.0 alpha:1.0] CGColor];
    self.txtComment.layer.borderWidth = 0.8f;
}

@end
