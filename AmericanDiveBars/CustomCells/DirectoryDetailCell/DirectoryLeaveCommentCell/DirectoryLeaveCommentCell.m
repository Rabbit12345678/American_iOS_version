//
//  DirectoryLeaveCommentCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 4/13/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import "DirectoryLeaveCommentCell.h"

@implementation DirectoryLeaveCommentCell

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
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtCommentTitle
                                 forCornerRadius:5
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor]];
    
    
    [self.txtCommentTitle setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    
    [self.txtComment setTextColor:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0]];
    
    [self.txtCommentTitle setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.txtComment setContentInset:UIEdgeInsetsMake(-2, 0, 0, 0)];
    
    [self setBorderAndCornerRadius_WhileNoEditing];
    
}

-(void)setBorderAndCornerRadius_WhileNoEditing {
    self.txtComment.layer.borderWidth = 0.8;
    self.txtComment.layer.borderColor = [[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] CGColor];
    self.txtComment.layer.cornerRadius = 5;
    self.txtComment.layer.masksToBounds = YES;
}




@end
