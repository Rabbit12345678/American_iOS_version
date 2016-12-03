//
//  BarWriteReviewCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 4/12/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BarWriteReviewCell;

@protocol BarWriteReviewCellDelegate  <NSObject>

-(void)cell:(BarWriteReviewCell *)cell forRatings:(int)rating;

@end


@interface BarWriteReviewCell : UITableViewCell
@property (strong, nonatomic) id<BarWriteReviewCellDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *txtReviewTitle;
@property (strong, nonatomic) IBOutlet UITextView *txtReviewDesc;
@property (strong, nonatomic) IBOutlet UIButton *btnSubmit;
@property (strong, nonatomic) IBOutlet RateView *rateView;

@end
