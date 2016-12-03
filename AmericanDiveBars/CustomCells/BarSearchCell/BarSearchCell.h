//
//  BarSearchCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/1/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BarSearchCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextField *txtTitle;
@property (strong, nonatomic) IBOutlet UITextField *txtState;
@property (strong, nonatomic) IBOutlet UITextField *txtCity;
@property (strong, nonatomic) IBOutlet UITextField *txtZip;
@property (strong, nonatomic) IBOutlet UIButton *btnStartSearch;

-(void)configureCellUI;
@end
