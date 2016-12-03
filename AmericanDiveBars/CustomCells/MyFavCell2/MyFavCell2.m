//
//  MyFavCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 10/6/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import "MyFavCell2.h"

@implementation MyFavCell2

- (void)awakeFromNib {
    // Initialization code
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)configureCellUI {
    self.lblBg.layer.borderColor = [[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor];
    self.lblBg.layer.borderWidth = 1.0f;
    self.lblBg.layer.cornerRadius = 2.0f;
    self.lblBg.layer.masksToBounds = YES;
}
@end
