//
//  BeerSuggestCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 2/18/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeerSuggestCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextField *txtBeerTitle;
@property (strong, nonatomic) IBOutlet UITextView *txtDesc;
@property (strong, nonatomic) IBOutlet UITextField *txtType;
@property (strong, nonatomic) IBOutlet UITextField *txtABV;
@property (strong, nonatomic) IBOutlet UITextField *txtBrewedBy;
@property (strong, nonatomic) IBOutlet UITextField *txtCityProduced;
@property (strong, nonatomic) IBOutlet UITextField *txtState;
@property (strong, nonatomic) IBOutlet UITextField *txtCountry;
@property (strong, nonatomic) IBOutlet UITextField *txtWeb;

@property (nonatomic, strong) IBOutlet UIImageView *imgUser;
@property (nonatomic, strong) IBOutlet UIButton *btnSelectImage;

@property (strong, nonatomic) IBOutlet UIButton *btnSave;
@property (strong, nonatomic) IBOutlet UIButton *btnCancel;


@end
