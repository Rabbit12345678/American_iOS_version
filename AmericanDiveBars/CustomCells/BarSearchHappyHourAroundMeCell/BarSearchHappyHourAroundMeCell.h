//
//  BarSearchHappyHourAroundMeCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 1/18/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BarSearchHappyHourAroundMeCellDelegate <NSObject>

-(void)openDays;

@end

@interface BarSearchHappyHourAroundMeCell : UITableViewCell

@property (strong, nonatomic) id<BarSearchHappyHourAroundMeCellDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *txtTitle;
@property (strong, nonatomic) IBOutlet UITextField *txtDay;
@property (strong, nonatomic) IBOutlet UIButton *btnStartSearch;

-(void)configureCellUI;
@end
