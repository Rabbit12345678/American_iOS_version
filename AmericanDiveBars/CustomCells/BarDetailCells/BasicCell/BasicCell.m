//
//  BasicCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 9/14/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "BasicCell.h"

@implementation BasicCell

- (void)awakeFromNib {
    // Initialization code
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setBarRatingsBy:(int)total_rating andComments:(int)total_commnets {
    if (total_commnets==0) {
        self.imgStar1.image = [UIImage imageNamed:@"no-rating_star.png"];
        self.imgStar2.image = [UIImage imageNamed:@"no-rating_star.png"];
        self.imgStar3.image = [UIImage imageNamed:@"no-rating_star.png"];
        self.imgStar4.image = [UIImage imageNamed:@"no-rating_star.png"];
        self.imgStar5.image = [UIImage imageNamed:@"no-rating_star.png"];
    }else {
        int ratings = total_rating/total_commnets;
        switch (ratings) {
            case 0:
                self.imgStar1.image = [UIImage imageNamed:@"no-rating_star.png"];
                self.imgStar2.image = [UIImage imageNamed:@"no-rating_star.png"];
                self.imgStar3.image = [UIImage imageNamed:@"no-rating_star.png"];
                self.imgStar4.image = [UIImage imageNamed:@"no-rating_star.png"];
                self.imgStar5.image = [UIImage imageNamed:@"no-rating_star.png"];
                
                break;
                
            case 1:
                self.imgStar1.image = [UIImage imageNamed:@"full_star.png"];
                self.imgStar2.image = [UIImage imageNamed:@"no-rating_star.png"];
                self.imgStar3.image = [UIImage imageNamed:@"no-rating_star.png"];
                self.imgStar4.image = [UIImage imageNamed:@"no-rating_star.png"];
                self.imgStar5.image = [UIImage imageNamed:@"no-rating_star.png"];
                
                break;
                
            case 2:
                self.imgStar1.image = [UIImage imageNamed:@"full_star.png"];
                self.imgStar2.image = [UIImage imageNamed:@"full_star.png"];
                self.imgStar3.image = [UIImage imageNamed:@"no-rating_star.png"];
                self.imgStar4.image = [UIImage imageNamed:@"no-rating_star.png"];
                self.imgStar5.image = [UIImage imageNamed:@"no-rating_star.png"];
                
                break;
                
            case 3:
                self.imgStar1.image = [UIImage imageNamed:@"full_star.png"];
                self.imgStar2.image = [UIImage imageNamed:@"full_star.png"];
                self.imgStar3.image = [UIImage imageNamed:@"full_star.png"];
                self.imgStar4.image = [UIImage imageNamed:@"no-rating_star.png"];
                self.imgStar5.image = [UIImage imageNamed:@"no-rating_star.png"];
                
                break;
                
            case 4:
                self.imgStar1.image = [UIImage imageNamed:@"full_star.png"];
                self.imgStar2.image = [UIImage imageNamed:@"full_star.png"];
                self.imgStar3.image = [UIImage imageNamed:@"full_star.png"];
                self.imgStar4.image = [UIImage imageNamed:@"full_star.png"];
                self.imgStar5.image = [UIImage imageNamed:@"no-rating_star.png"];
                
                break;
                
            case 5:
                self.imgStar1.image = [UIImage imageNamed:@"full_star.png"];
                self.imgStar2.image = [UIImage imageNamed:@"full_star.png"];
                self.imgStar3.image = [UIImage imageNamed:@"full_star.png"];
                self.imgStar4.image = [UIImage imageNamed:@"full_star.png"];
                self.imgStar5.image = [UIImage imageNamed:@"full_star.png"];
                
                break;
                
                
            default:
                self.imgStar1.image = [UIImage imageNamed:@"no-rating_star.png"];
                self.imgStar2.image = [UIImage imageNamed:@"no-rating_star.png"];
                self.imgStar3.image = [UIImage imageNamed:@"no-rating_star.png"];
                self.imgStar4.image = [UIImage imageNamed:@"no-rating_star.png"];
                self.imgStar5.image = [UIImage imageNamed:@"no-rating_star.png"];
                break;
        }
        
    }
    
}


@end
