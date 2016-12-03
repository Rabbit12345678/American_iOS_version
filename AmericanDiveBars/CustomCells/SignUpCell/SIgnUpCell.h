//
//  LoginCell.h
//  AmericanDiveBars
//
//  Created by admin on 31/08/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextField *txtNickName;
@property (strong, nonatomic) IBOutlet UITextField *txtFName;
@property (strong, nonatomic) IBOutlet UITextField *txtLName;
@property (nonatomic, strong) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtMobile;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtConfirmPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtBirthDay;

@property (strong, nonatomic) IBOutlet UIImageView *imgGenderIcon;
@property (strong, nonatomic) IBOutlet UIButton *btnFemale;
@property (strong, nonatomic) IBOutlet UIButton *btnMale;

@property (strong, nonatomic) IBOutlet UIButton *btnCheckBox;

@property (strong, nonatomic) IBOutlet UIButton *btnSignUp;
@end
