//
//  SideMenuTableViewCell.m
//  AmericanDiveBars
//
//  Created by admin on 31/08/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "SideMenuTableViewCell.h"

@implementation SideMenuTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)viewTapGesture:(id)sender {
    if ([[self delegate] respondsToSelector:@selector(openMyProfileView:)]) {
        [[self delegate] openMyProfileView:self.viewTap];
    }
}
@end
