//
//  ReportBarCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 4/12/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import "ReportBarCell.h"

@implementation ReportBarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self configureCellUIWith_NoEditing];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)configureCellUIWith_NoEditing
{
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtEmail
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    
    [self.txtEmail setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
   
    [self.txtOtherDesc setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    
    [self.txtEmail setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.txtOtherDesc setContentInset:UIEdgeInsetsMake(-2, 0, 0, 0)];
    
    [self setBorderAndCornerRadius_WhileNoEditing];
}

-(void)setBorderAndCornerRadius_WhileNoEditing {
    self.txtOtherDesc.layer.borderWidth = 0.8;
    self.txtOtherDesc.layer.borderColor = [[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor];
    self.txtOtherDesc.layer.cornerRadius = 5;
    self.txtOtherDesc.layer.masksToBounds = YES;
}



@end
