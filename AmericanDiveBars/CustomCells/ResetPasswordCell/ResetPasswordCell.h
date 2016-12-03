//
//  ResetPasswordCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/9/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResetPasswordCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UITextField *txtVarifCode;
@property (strong, nonatomic) IBOutlet UITextField *txtNewPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtConfirmNewPassword;
@property (strong, nonatomic) IBOutlet UIButton *btnResetPassword;

-(void)configureCellUI;
@end
