//
//  MyProfileInfoCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 10/2/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import "MyProfileInfoCell.h"

@implementation MyProfileInfoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)configureCellUIWith_NoEditing
{
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtFname
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtLname
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtUsername
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtEmail
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtCity
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtState
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtZip
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtMobile
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtFbLink
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtGoogleLink
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtTwitterLink
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtLinkedInLink
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtPinterestLink
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtInstagramLink
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    [self.txtFname setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    [self.txtLname setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    [self.txtUsername setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    [self.txtEmail setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    [self.txtCity setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    [self.txtState setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    [self.txtZip setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    [self.txtMobile setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    [self.txtFbLink setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    [self.txtGoogleLink setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    [self.txtTwitterLink setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    [self.txtLinkedInLink setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    [self.txtPinterestLink setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    [self.txtInstagramLink setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    
    [self.txtAboutUser setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    [self.txtAddress setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    
    [self.txtFname setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtLname setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtUsername setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtEmail setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtCity setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtState setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtZip setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtMobile setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtFbLink setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtGoogleLink setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtTwitterLink setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtLinkedInLink setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtPinterestLink setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtInstagramLink setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.txtAboutUser setContentInset:UIEdgeInsetsMake(-2, 0, 0, 0)];
    [self.txtAddress setContentInset:UIEdgeInsetsMake(-2, 0, 0, 0)];
    
    [self setBorderAndCornerRadius_WhileNoEditing];
    
    self.btnSave.hidden = YES;
    self.btnCancel.hidden = YES;
    
    self.txtFname.enabled = NO;
    self.txtLname.enabled = NO;
    self.txtUsername.enabled = NO;
    self.txtEmail.enabled = NO;
    self.txtCity.enabled = NO;
    self.txtState.enabled = NO;
    self.txtZip.enabled = NO;
    self.txtMobile.enabled = NO;
    self.txtFbLink.enabled = NO;
    self.txtGoogleLink.enabled = NO;
    self.txtTwitterLink.enabled = NO;
    self.txtLinkedInLink.enabled = NO;
    self.txtPinterestLink.enabled = NO;
    self.txtInstagramLink.enabled = NO;
    self.txtAboutUser.editable = NO;
    self.txtAddress.editable = NO;
    
    self.btnMale.enabled = NO;
    self.btnFemale.enabled = NO;
}

-(void)setBorderAndCornerRadius_WhileNoEditing {
    self.txtAboutUser.layer.borderWidth = 0.8;
    self.txtAboutUser.layer.borderColor = [[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor];
    self.txtAboutUser.layer.cornerRadius = 5;
    self.txtAboutUser.layer.masksToBounds = YES;
    
    self.txtAddress.layer.borderWidth = 0.8;
    self.txtAddress.layer.borderColor = [[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor];
    self.txtAddress.layer.cornerRadius = 5;
    self.txtAddress.layer.masksToBounds = YES;

}

-(void)configureCellUIWith_Editing
{
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtFname
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtLname
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor]];

    [CommonUtils setBorderAndCorner_ForTextField:self.txtUsername
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtEmail
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor]];

    [CommonUtils setBorderAndCorner_ForTextField:self.txtCity
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor]];

    [CommonUtils setBorderAndCorner_ForTextField:self.txtState
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor]];

    [CommonUtils setBorderAndCorner_ForTextField:self.txtZip
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor]];

    [CommonUtils setBorderAndCorner_ForTextField:self.txtMobile
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor]];

    [CommonUtils setBorderAndCorner_ForTextField:self.txtFbLink
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor]];

    [CommonUtils setBorderAndCorner_ForTextField:self.txtGoogleLink
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor]];

    [CommonUtils setBorderAndCorner_ForTextField:self.txtTwitterLink
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor]];

    [CommonUtils setBorderAndCorner_ForTextField:self.txtLinkedInLink
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor]];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtPinterestLink
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor]];

    [CommonUtils setBorderAndCorner_ForTextField:self.txtInstagramLink
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor]];
    
    
    [self.txtFname setTextColor:[UIColor whiteColor]];
    [self.txtLname setTextColor:[UIColor whiteColor]];
    [self.txtUsername setTextColor:[UIColor whiteColor]];
    [self.txtEmail setTextColor:[UIColor whiteColor]];
    [self.txtCity setTextColor:[UIColor whiteColor]];
    [self.txtState setTextColor:[UIColor whiteColor]];
    [self.txtZip setTextColor:[UIColor whiteColor]];
    [self.txtMobile setTextColor:[UIColor whiteColor]];
    [self.txtFbLink setTextColor:[UIColor whiteColor]];
    [self.txtGoogleLink setTextColor:[UIColor whiteColor]];
    [self.txtTwitterLink setTextColor:[UIColor whiteColor]];
    [self.txtLinkedInLink setTextColor:[UIColor whiteColor]];
    [self.txtPinterestLink setTextColor:[UIColor whiteColor]];
    [self.txtInstagramLink setTextColor:[UIColor whiteColor]];
    
    [self.txtAboutUser setTextColor:[UIColor whiteColor]];
    [self.txtAddress setTextColor:[UIColor whiteColor]];
    
    [self.txtFname setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtLname setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtUsername setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtEmail setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtCity setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtState setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtZip setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtMobile setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtFbLink setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtGoogleLink setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtTwitterLink setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtLinkedInLink setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtPinterestLink setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtInstagramLink setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.txtAboutUser setContentInset:UIEdgeInsetsMake(-2, 0, 0, 0)];
    [self.txtAddress setContentInset:UIEdgeInsetsMake(-2, 0, 0, 0)];
    
    [self setBorderAndCornerRadius_WhileEditing];
    
    self.btnSave.hidden = NO;
    self.btnCancel.hidden = NO;
    
    self.txtFname.enabled = YES;
    self.txtLname.enabled = YES;
    self.txtUsername.enabled = YES;
    self.txtEmail.enabled = YES;
    self.txtCity.enabled = YES;
    self.txtState.enabled = YES;
    self.txtZip.enabled = YES;
    self.txtMobile.enabled = YES;
    self.txtFbLink.enabled = YES;
    self.txtGoogleLink.enabled = YES;
    self.txtTwitterLink.enabled = YES;
    self.txtLinkedInLink.enabled = YES;
    self.txtPinterestLink.enabled = YES;
    self.txtInstagramLink.enabled = YES;
    self.txtAboutUser.editable = YES;
    self.txtAddress.editable = YES;
    
    self.btnMale.enabled = YES;
    self.btnFemale.enabled = YES;
}

-(void)setBorderAndCornerRadius_WhileEditing {
    self.txtAboutUser.layer.borderWidth = 0.8;
    self.txtAboutUser.layer.borderColor = [[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor];
    self.txtAboutUser.layer.cornerRadius = 5;
    self.txtAboutUser.layer.masksToBounds = YES;
    
    self.txtAddress.layer.borderWidth = 0.8;
    self.txtAddress.layer.borderColor = [[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor];
    self.txtAddress.layer.cornerRadius = 5;
    self.txtAddress.layer.masksToBounds = YES;
}

@end
