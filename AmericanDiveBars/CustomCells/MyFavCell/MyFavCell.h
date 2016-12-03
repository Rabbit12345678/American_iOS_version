//
//  MyFavCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 10/6/15.
//  Copyright © 2015 spaculus. All rights reserved.
//



#import <UIKit/UIKit.h>

@interface MyFavCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblBg;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblType;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;

@property (strong, nonatomic) IBOutlet UIButton *btnCheck;
@property (strong, nonatomic) IBOutlet UIButton *btnDelete;

@property (strong, nonatomic) IBOutlet UIImageView *imgFav;

-(void)configureCellUI;
@end
