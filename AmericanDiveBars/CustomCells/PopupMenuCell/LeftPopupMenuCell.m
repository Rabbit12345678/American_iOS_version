//
//  LeftPopupMenuCell.m
//  GoodBoater
//
//  Created by admin on 14/05/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "LeftPopupMenuCell.h"

@implementation LeftPopupMenuCell

- (void)awakeFromNib {
    // Initialization code
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
