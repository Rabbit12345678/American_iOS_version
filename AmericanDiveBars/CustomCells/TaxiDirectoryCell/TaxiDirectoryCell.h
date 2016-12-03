//
//  TaxiDirectoryCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/12/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaxiDirectoryCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgTaxiLogo;

@property (strong, nonatomic) IBOutlet UILabel *lblTaxiTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDesc;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblAddress;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblPhone;

-(void)configureCell;

@end
