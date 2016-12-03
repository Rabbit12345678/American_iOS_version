//
//  MyAlbumCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 10/7/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAlbumCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblBg;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;
@property (strong, nonatomic) IBOutlet UILabel *lblStatus;

@property (strong, nonatomic) IBOutlet UIButton *btnCheck;
@property (strong, nonatomic) IBOutlet UIButton *btnEdit;
@property (strong, nonatomic) IBOutlet UIButton *btnDelete;
@property (strong, nonatomic) IBOutlet UIButton *btnViewAlbum;

-(void)configureCellUI;

@end
