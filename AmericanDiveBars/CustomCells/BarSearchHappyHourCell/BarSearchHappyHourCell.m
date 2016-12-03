//
//  BarSearchHappyHourCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 1/18/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import "BarSearchHappyHourCell.h"

@implementation BarSearchHappyHourCell

- (void)awakeFromNib {
    // Initialization code
    [self configureCellUI];
}


-(void)configureCellUI {
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    
    [CommonUtils setLeftImageToTextField:self.txtTitle andImage:@"name.png" andImgWidth:25 andImgHeight:25 withPadding:35];
    [CommonUtils setLeftImageToTextField:self.txtAddress andImage:@"city-state.png" andImgWidth:25 andImgHeight:25 withPadding:35];
    [CommonUtils setRightImageToTextField:self.txtDay withImage:@"gray_down_arrow.png" withPadding:35 withWidth:25 withHeight:25 forSelector:@selector(openDayList)  forTarget:self];
    
    [CommonUtils setLeftPadding:35 andTextField:self.txtDay];
    
    [self.txtTitle setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtAddress setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtDay setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
}


-(void)openDayList {
    if ([[self delegate] respondsToSelector:@selector(openDays1)]) {
        [[self delegate] openDays1];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
