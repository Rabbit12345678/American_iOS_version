//
//  BarSuggestCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 4/11/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BarSuggestCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextField *txtBarName;
@property (strong, nonatomic) IBOutlet UITextView *txtStreet;
@property (strong, nonatomic) IBOutlet UITextField *txtCity;
@property (strong, nonatomic) IBOutlet UITextField *txtState;
@property (strong, nonatomic) IBOutlet UITextField *txtPhone;
@property (strong, nonatomic) IBOutlet UITextField *txtZip;

@property (strong, nonatomic) IBOutlet UIButton *btnSave;
@property (strong, nonatomic) IBOutlet UIButton *btnCancel;

@end
