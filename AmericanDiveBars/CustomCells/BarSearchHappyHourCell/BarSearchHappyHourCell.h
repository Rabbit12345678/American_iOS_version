//
//  BarSearchHappyHourCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 1/18/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BarSearchHappyHourCellDelegate <NSObject>

-(void)openDays1;

@end
@interface BarSearchHappyHourCell : UITableViewCell
@property (strong, nonatomic) id<BarSearchHappyHourCellDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *txtTitle;
@property (strong, nonatomic) IBOutlet UITextField *txtAddress;
@property (strong, nonatomic) IBOutlet UITextField *txtDay;
@property (strong, nonatomic) IBOutlet UIButton *btnStartSearch;

-(void)configureCellUI;

@end
