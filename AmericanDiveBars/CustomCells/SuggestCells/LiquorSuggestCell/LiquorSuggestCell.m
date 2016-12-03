//
//  LiquorSuggestCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 2/18/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import "LiquorSuggestCell.h"

@implementation LiquorSuggestCell

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
    
    self.btnSelectImage.layer.cornerRadius = self.btnSelectImage.frame.size.height/2;
    self.btnSelectImage.layer.masksToBounds = YES;
    
    self.imgUser.layer.borderColor = [[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor];
    self.imgUser.layer.borderWidth = 0.8;
    self.imgUser.layer.cornerRadius = self.imgUser.frame.size.height /2;
    self.imgUser.layer.masksToBounds = YES;
    
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtLiquorName
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtType
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtProof
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtProducer
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtCountry
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [self.txtLiquorName setTextColor:[UIColor whiteColor]];
    [self.txtType setTextColor:[UIColor whiteColor]];
    [self.txtProof setTextColor:[UIColor whiteColor]];
    [self.txtProducer setTextColor:[UIColor whiteColor]];
    [self.txtCountry setTextColor:[UIColor whiteColor]];

    [self.txtDesc setTextColor:[UIColor whiteColor]];

    [self.txtLiquorName setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtType setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtProof setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtProducer setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtCountry setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.txtDesc setContentInset:UIEdgeInsetsMake(-2, 0, 0, 0)];
    
    [self setBorderAndCornerRadius_WhileNoEditing];
}

-(void)setBorderAndCornerRadius_WhileNoEditing {
    self.txtDesc.layer.borderWidth = 0.8;
    self.txtDesc.layer.borderColor = [[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor];
    self.txtDesc.layer.cornerRadius = 5;
    self.txtDesc.layer.masksToBounds = YES;
}



@end
