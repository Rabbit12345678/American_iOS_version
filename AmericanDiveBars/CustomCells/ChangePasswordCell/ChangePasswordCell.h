//
//  EditPasswordTableViewCell.h
//  BreetyNetwork
//
//  Created by admin on 30/01/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePasswordCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UITextField *txtOldPass;
@property (nonatomic, strong) IBOutlet UITextField *txtNewPass;
@property (nonatomic, strong) IBOutlet UITextField *txtConfirmPass;

-(void)configureUI;

@end
