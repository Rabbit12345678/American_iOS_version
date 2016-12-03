//
//  LiquorSuggestCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 2/18/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiquorSuggestCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextField *txtLiquorName;
@property (strong, nonatomic) IBOutlet UITextView *txtDesc;
@property (strong, nonatomic) IBOutlet UITextField *txtType;
@property (strong, nonatomic) IBOutlet UITextField *txtProof;
@property (strong, nonatomic) IBOutlet UITextField *txtProducer;
@property (strong, nonatomic) IBOutlet UITextField *txtCountry;

@property (nonatomic, strong) IBOutlet UIImageView *imgUser;
@property (nonatomic, strong) IBOutlet UIButton *btnSelectImage;

@property (strong, nonatomic) IBOutlet UIButton *btnSave;
@property (strong, nonatomic) IBOutlet UIButton *btnCancel;


@end
