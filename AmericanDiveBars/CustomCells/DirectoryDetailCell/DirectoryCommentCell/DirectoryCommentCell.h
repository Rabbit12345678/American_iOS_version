//
//  DirectoryCommentCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/28/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DirectoryCommentCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgUser;

@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblUserName;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblTitle;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblDesc;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblTimeAgo;

@property (strong, nonatomic) IBOutlet UIButton *btnLike;
@property (strong, nonatomic) IBOutlet UIButton *btnReply;
@property (strong, nonatomic) IBOutlet UIButton *btnDelete;
@end
