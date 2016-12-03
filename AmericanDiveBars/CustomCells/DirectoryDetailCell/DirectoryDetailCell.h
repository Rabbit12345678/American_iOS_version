//
//  DirectoryDetailCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/28/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <Foundation/Foundation.h>

//DirectoryBasic Cell
#import "DirectoryBasicCell.h"
static NSString * const DirectoryBasicCellIdentifier = @"DirectoryBasicCell";
#define Nib_DirectoryBasicCell @"DirectoryBasicCell"

//DirectoryComment Cell
#import "DirectoryCommentCell.h"
static NSString * const DirectoryCommentCellIdentifier = @"DirectoryCommentCell";
#define Nib_DirectoryCommentCell @"DirectoryCommentCell"


//DirectoryComment Cell
#import "DirectoryLeaveCommentCell.h"
#define Nib_DirectoryLeaveCommentCell @"DirectoryLeaveCommentCell"

//Reply Comment Cell
#import "ReplyCommentCell.h"
static NSString * const ReplyCommentCellIdentifier = @"ReplyCommentCell";
#define Nib_ReplyCommentCell @"ReplyCommentCell"

@interface DirectoryDetailCell : NSObject

@end
