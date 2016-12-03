//
//  ReportBarCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 4/12/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADBRadioButton.h"

@interface ReportBarCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblBarName;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;

@property (strong, nonatomic) IBOutlet UITextView *txtOtherDesc;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *heightTxtOtherDesc;

@property (strong, nonatomic) IBOutlet UIButton *btnSubmit;

@property (strong, nonatomic) IBOutlet ADBRadioButton *btnIsClosed;
@property (strong, nonatomic) IBOutlet ADBRadioButton *btnHasWrong;
@property (strong, nonatomic) IBOutlet ADBRadioButton *btnIsNot;
@property (strong, nonatomic) IBOutlet ADBRadioButton *btnOther;

@end
