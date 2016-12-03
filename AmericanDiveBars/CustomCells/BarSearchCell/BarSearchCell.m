//
//  BarSearchCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 9/1/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "BarSearchCell.h"

@implementation BarSearchCell

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
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];

    [CommonUtils setLeftImageToTextField:self.txtTitle andImage:@"name.png" andImgWidth:25 andImgHeight:25 withPadding:35];
    [CommonUtils setLeftImageToTextField:self.txtState andImage:@"city-state.png" andImgWidth:25 andImgHeight:25 withPadding:35];
    [CommonUtils setLeftImageToTextField:self.txtCity andImage:@"city-state.png" andImgWidth:25 andImgHeight:25 withPadding:35];
    [CommonUtils setLeftImageToTextField:self.txtZip andImage:@"zip-code.png" andImgWidth:25 andImgHeight:25 withPadding:35];
    
    [self.txtTitle setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtState setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtCity setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self.txtZip setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
}
@end
