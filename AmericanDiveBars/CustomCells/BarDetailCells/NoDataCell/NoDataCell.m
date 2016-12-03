//
//  NoDataCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 2/29/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import "NoDataCell.h"

@implementation NoDataCell

- (void)awakeFromNib {
    // Initialization code
    
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
