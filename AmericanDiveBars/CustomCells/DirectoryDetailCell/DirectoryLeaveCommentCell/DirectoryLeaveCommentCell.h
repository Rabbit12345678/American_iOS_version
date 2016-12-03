//
//  DirectoryLeaveCommentCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 4/13/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DirectoryLeaveCommentCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextField *txtCommentTitle;
@property (strong, nonatomic) IBOutlet UITextView *txtComment;
@property (strong, nonatomic) IBOutlet UIButton *btnSubmit;

@end
