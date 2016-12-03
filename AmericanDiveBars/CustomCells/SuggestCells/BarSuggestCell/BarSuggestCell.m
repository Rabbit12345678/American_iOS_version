//
//  BarSuggestCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 4/11/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import "BarSuggestCell.h"

@implementation BarSuggestCell

- (void)awakeFromNib {
    // Initialization code
    [self configureCellUIWith_NoEditing];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellUIWith_NoEditing
{
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtBarName
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtCity
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtState
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtPhone
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtZip
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    
    [self.txtBarName setTextColor:[UIColor whiteColor]];
    [self.txtCity setTextColor:[UIColor whiteColor]];
    [self.txtState setTextColor:[UIColor whiteColor]];
    [self.txtPhone setTextColor:[UIColor whiteColor]];
    [self.txtZip setTextColor:[UIColor whiteColor]];
    
    [self.txtStreet setTextColor:[UIColor whiteColor]];
    
    [self.txtBarName setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtCity setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtState setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtPhone setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtZip setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.txtStreet setContentInset:UIEdgeInsetsMake(-2, 0, 0, 0)];
    
    [self setBorderAndCornerRadius_WhileNoEditing];
}

-(void)setBorderAndCornerRadius_WhileNoEditing {
    self.txtStreet.layer.borderWidth = 0.8;
    self.txtStreet.layer.borderColor = [[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor];
    self.txtStreet.layer.cornerRadius = 5;
    self.txtStreet.layer.masksToBounds = YES;
}


@end
