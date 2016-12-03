//
//  CocktailSuggestCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 2/18/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import "CocktailSuggestCell.h"

@implementation CocktailSuggestCell

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
    
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtCocktailName
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtBaseSpirit
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtType
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtServed
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtPreparation
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtStrength
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtDifficulty
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtFlavorProfile
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [self.txtCocktailName setTextColor:[UIColor whiteColor]];
    [self.txtBaseSpirit setTextColor:[UIColor whiteColor]];
    [self.txtType setTextColor:[UIColor whiteColor]];
    [self.txtServed setTextColor:[UIColor whiteColor]];
    [self.txtPreparation setTextColor:[UIColor whiteColor]];
    [self.txtStrength setTextColor:[UIColor whiteColor]];
    [self.txtDifficulty setTextColor:[UIColor whiteColor]];
    [self.txtFlavorProfile setTextColor:[UIColor whiteColor]];
    
    [self.txtIngredients setTextColor:[UIColor whiteColor]];
    [self.txtHowToMakeIt setTextColor:[UIColor whiteColor]];
    
    [self.txtCocktailName setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtBaseSpirit setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtType setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtServed setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtPreparation setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtStrength setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtDifficulty setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtFlavorProfile setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.txtIngredients setContentInset:UIEdgeInsetsMake(-2, 0, 0, 0)];
    [self.txtHowToMakeIt setContentInset:UIEdgeInsetsMake(-2, 0, 0, 0)];
    
    [self setBorderAndCornerRadius_WhileNoEditing];
}

-(void)setBorderAndCornerRadius_WhileNoEditing {
    self.txtIngredients.layer.borderWidth = 0.8;
    self.txtIngredients.layer.borderColor = [[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor];
    self.txtIngredients.layer.cornerRadius = 5;
    self.txtIngredients.layer.masksToBounds = YES;
    
    self.txtHowToMakeIt.layer.borderWidth = 0.8;
    self.txtHowToMakeIt.layer.borderColor = [[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor];
    self.txtHowToMakeIt.layer.cornerRadius = 5;
    self.txtHowToMakeIt.layer.masksToBounds = YES;

}


@end
