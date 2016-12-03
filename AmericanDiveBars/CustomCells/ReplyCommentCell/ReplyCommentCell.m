//
//  ReplyCommentCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 4/15/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import "ReplyCommentCell.h"

@implementation ReplyCommentCell

- (void)awakeFromNib {
    // Initialization code
    
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    
    self.imgUser.layer.cornerRadius = self.imgUser.frame.size.height/2;
    self.imgUser.layer.masksToBounds = YES;
    
    self.btnDelete.layer.cornerRadius = self.btnDelete.frame.size.height/2;
    self.btnDelete.layer.masksToBounds = YES;
    
    self.btnDelete.layer.borderColor = [UIColor whiteColor].CGColor;
    self.btnDelete.layer.borderWidth = 2.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
