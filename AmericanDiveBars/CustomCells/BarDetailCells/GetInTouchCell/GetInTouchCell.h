//
//  GetInTouchCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/15/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GetInTouchCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtPhone;
@property (strong, nonatomic) IBOutlet UITextField *txtEmail;

@property (strong, nonatomic) IBOutlet UITextView *txtComment;

@property (strong, nonatomic) IBOutlet UIButton *btnSubmit;


-(void)configureCellUI;
@end
