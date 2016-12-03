//
//  ShareCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/14/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIButton *btnShare;
@property (strong, nonatomic) IBOutlet UIButton *btnFb;
@property (strong, nonatomic) IBOutlet UIButton *btnTwitter;
@property (strong, nonatomic) IBOutlet UIButton *btnLinkedIn;
@property (strong, nonatomic) IBOutlet UIButton *btnGooglePlus;
@property (strong, nonatomic) IBOutlet UIButton *btnDribble;
@property (strong, nonatomic) IBOutlet UIButton *btnPintrest;

@property (strong, nonatomic) IBOutlet UIButton *btnAddToFav;
@property (strong, nonatomic) IBOutlet UIButton *btnLikeThisBar;


@end
