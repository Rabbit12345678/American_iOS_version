//
//  MyProfileInfoCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 10/2/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyProfileInfoCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UITextField *txtFname;
@property (strong, nonatomic) IBOutlet UITextField *txtLname;
@property (strong, nonatomic) IBOutlet UITextField *txtUsername;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;
@property (strong, nonatomic) IBOutlet UITextView *txtAboutUser;
@property (strong, nonatomic) IBOutlet UITextView *txtAddress;
@property (strong, nonatomic) IBOutlet UITextField *txtCity;
@property (strong, nonatomic) IBOutlet UITextField *txtState;
@property (strong, nonatomic) IBOutlet UITextField *txtZip;
@property (strong, nonatomic) IBOutlet UITextField *txtMobile;
@property (strong, nonatomic) IBOutlet UITextField *txtFbLink;
@property (strong, nonatomic) IBOutlet UITextField *txtGoogleLink;
@property (strong, nonatomic) IBOutlet UITextField *txtTwitterLink;
@property (strong, nonatomic) IBOutlet UITextField *txtLinkedInLink;
@property (strong, nonatomic) IBOutlet UITextField *txtPinterestLink;
@property (strong, nonatomic) IBOutlet UITextField *txtInstagramLink;

@property (strong, nonatomic) IBOutlet UIButton *btnSave;
@property (strong, nonatomic) IBOutlet UIButton *btnCancel;
@property (strong, nonatomic) IBOutlet UIButton *btnMale;
@property (strong, nonatomic) IBOutlet UIButton *btnFemale;

-(void)configureCellUIWith_NoEditing;
-(void)configureCellUIWith_Editing;
@end
