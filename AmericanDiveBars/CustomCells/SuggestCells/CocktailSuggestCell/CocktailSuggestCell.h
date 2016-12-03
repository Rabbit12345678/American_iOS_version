//
//  CocktailSuggestCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 2/18/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CocktailSuggestCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextField *txtCocktailName;
@property (strong, nonatomic) IBOutlet UITextView *txtIngredients;
@property (strong, nonatomic) IBOutlet UITextView *txtHowToMakeIt;
@property (strong, nonatomic) IBOutlet UITextField *txtBaseSpirit;
@property (strong, nonatomic) IBOutlet UITextField *txtType;
@property (strong, nonatomic) IBOutlet UITextField *txtServed;
@property (strong, nonatomic) IBOutlet UITextField *txtPreparation;
@property (strong, nonatomic) IBOutlet UITextField *txtStrength;
@property (strong, nonatomic) IBOutlet UITextField *txtDifficulty;
@property (strong, nonatomic) IBOutlet UITextField *txtFlavorProfile;

@property (nonatomic, strong) IBOutlet UIImageView *imgUser;
@property (nonatomic, strong) IBOutlet UIButton *btnSelectImage;

@property (strong, nonatomic) IBOutlet UIButton *btnSave;
@property (strong, nonatomic) IBOutlet UIButton *btnCancel;




@end
