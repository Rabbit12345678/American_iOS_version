//
//  ContactUsFormCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 10/21/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactUsFormCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtSubject;

@property (strong, nonatomic) IBOutlet UITextView *txtComment;

@property (strong, nonatomic) IBOutlet UIButton *btnSubmit;


-(void)configureCellUI;

@end
