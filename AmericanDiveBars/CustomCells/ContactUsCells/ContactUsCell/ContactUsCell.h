//
//  ContactUsCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 10/21/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactUsCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblValue;
@property (strong, nonatomic) IBOutlet UIImageView *imgTitle;
@property (strong, nonatomic) IBOutlet UIButton *btnMap;

@end
