//
//  SideMenuTableViewCell.h
//  AmericanDiveBars
//
//  Created by admin on 31/08/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SideMenuTableViewCellDelegate <NSObject>

-(void)openMyProfileView:(id)sender;

@end

@interface SideMenuTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *imgMenu;
@property (nonatomic, strong) UILabel *lblMenuName;
@property (strong, nonatomic) IBOutlet UIView *viewTap;
@property (strong, nonatomic) id<SideMenuTableViewCellDelegate> delegate;

- (IBAction)viewTapGesture:(id)sender;
@end
