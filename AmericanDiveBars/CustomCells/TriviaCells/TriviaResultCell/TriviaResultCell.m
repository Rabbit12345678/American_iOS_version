//
//  TriviaResultCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 5/2/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import "TriviaResultCell.h"

@implementation TriviaResultCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self configureCellUI];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCellUI {
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    
    //    self.lblBg.layer.borderColor = [[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor];
    //    self.lblBg.layer.borderWidth = 1.0f;
    //    self.lblBg.layer.cornerRadius = 2.0f;
    //    self.lblBg.layer.masksToBounds = YES;
    
    self.totalScore_View.layer.borderColor = [[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor];
    self.totalScore_View.layer.borderWidth = 1.0f;
    self.totalScore_View.layer.cornerRadius = 2.0f;
    self.totalScore_View.layer.masksToBounds = YES;
    
    self.totalTimer_View.layer.borderColor = [[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor];
    self.totalTimer_View.layer.borderWidth = 1.0f;
    self.totalTimer_View.layer.cornerRadius = 2.0f;
    self.totalTimer_View.layer.masksToBounds = YES;
}



@end
