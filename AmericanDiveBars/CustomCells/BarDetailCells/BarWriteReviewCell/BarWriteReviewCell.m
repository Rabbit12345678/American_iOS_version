//
//  BarWriteReviewCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 4/12/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import "BarWriteReviewCell.h"

@interface BarWriteReviewCell () <RateViewDelegate>

@end

@implementation BarWriteReviewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self configureCellUIWith_NoEditing];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellUIWith_NoEditing
{
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtReviewTitle
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    
    [self.txtReviewTitle setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    
    [self.txtReviewDesc setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    
    [self.txtReviewTitle setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.txtReviewDesc setContentInset:UIEdgeInsetsMake(-2, 0, 0, 0)];
    
    [self setBorderAndCornerRadius_WhileNoEditing];
    
    [self configRateView];
}

-(void)setBorderAndCornerRadius_WhileNoEditing {
    self.txtReviewDesc.layer.borderWidth = 0.8;
    self.txtReviewDesc.layer.borderColor = [[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor];
    self.txtReviewDesc.layer.cornerRadius = 5;
    self.txtReviewDesc.layer.masksToBounds = YES;
}


-(void) configRateView {
    self.rateView.notSelectedImage  = [UIImage imageNamed:@"no-rating_star.png"];
    //self.rateView.halfSelectedImage = [UIImage imageNamed:@"star-half"];
    self.rateView.fullSelectedImage = [UIImage imageNamed:@"full_star.png"];
    self.rateView.delegate = self;
    
    self.rateView.editable = YES;
    self.rateView.maxRating = 5;
    
    [self.rateView setLeftMargin:0];
    [self.rateView setMidMargin:0];
    [self.rateView setMinImageSize:CGSizeMake(0, 0)];
}

-(void)rateView:(RateView *)rateView ratingDidChange:(float)rating {
    int rate = fabs(rating);
    
    if([[self delegate] respondsToSelector:@selector(cell:forRatings:)]) {
        [[self delegate] cell:self forRatings:rate];
    }
}

@end
