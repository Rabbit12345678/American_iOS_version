//
//  TriviaAnswerCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 4/25/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import "TriviaAnswerCell.h"

@implementation TriviaAnswerCell

- (void)awakeFromNib {
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
}


@end
