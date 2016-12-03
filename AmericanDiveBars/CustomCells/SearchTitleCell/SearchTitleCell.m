//
//  SearchTitleCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 9/1/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "SearchTitleCell.h"

@implementation SearchTitleCell

- (void)awakeFromNib {
    // Initialization code
    self.contentView.backgroundColor = [UIColor colorWithRed:187.0/255.0 green:124.0/255.0 blue:37.0/255.0 alpha:1.0];
    self.backgroundColor = [UIColor colorWithRed:187.0/255.0 green:124.0/255.0 blue:37.0/255.0 alpha:1.0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
