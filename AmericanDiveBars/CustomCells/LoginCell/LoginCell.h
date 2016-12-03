//
//  LoginCell.h
//  AmericanDiveBars
//
//  Created by admin on 31/08/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UITextField *txtEmail;
@property (nonatomic, strong) IBOutlet UITextField *txtPassword;
@property (nonatomic, strong) IBOutlet UIButton *btnSignIn;
@property (nonatomic, strong) IBOutlet UIButton *btnRememberMe;
@property (nonatomic, strong) IBOutlet UIButton *btnForgotPass;
@property (strong, nonatomic) IBOutlet UIButton *btnSignUp;
@property (strong, nonatomic) IBOutlet UIButton *btnFacebookLogin;


@end
