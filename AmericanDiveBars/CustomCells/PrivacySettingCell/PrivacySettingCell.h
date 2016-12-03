//
//  PrivacySettingCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 10/12/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADBRadioButton.h"

@interface PrivacySettingCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;

@property (strong, nonatomic) IBOutlet ADBRadioButton *btnShow;
@property (strong, nonatomic) IBOutlet ADBRadioButton *btnHide;

@end
