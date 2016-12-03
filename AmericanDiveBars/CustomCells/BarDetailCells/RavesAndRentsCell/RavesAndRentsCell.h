//
//  RavesAndRentsCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/15/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface RavesAndRentsCell : UITableViewCell

@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblReviewTitle;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblComment;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblDateTime;
@property (strong, nonatomic) IBOutlet UILabel *lblDuration;
@property (strong, nonatomic) IBOutlet UILabel *lblPostedBy;

@property (strong, nonatomic) IBOutlet UIImageView *imgStar1;
@property (strong, nonatomic) IBOutlet UIImageView *imgStar2;
@property (strong, nonatomic) IBOutlet UIImageView *imgStar3;
@property (strong, nonatomic) IBOutlet UIImageView *imgStar4;
@property (strong, nonatomic) IBOutlet UIImageView *imgStar5;

-(void)setBarRatingsBy:(int)total_rating;
@end
