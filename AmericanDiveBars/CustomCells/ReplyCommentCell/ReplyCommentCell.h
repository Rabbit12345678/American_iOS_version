//
//  ReplyCommentCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 4/15/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReplyCommentCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgUser;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblUserName;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblDesc;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblTimeAgo;

@property (strong, nonatomic) IBOutlet UIButton *btnDelete;

@end
