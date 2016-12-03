//
//  FindBarOptionCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 1/18/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import "FindBarOptionCell.h"

@implementation FindBarOptionCell

- (void)awakeFromNib {
    // Initialization code
    
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
}

-(void)configureCellUI {
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
