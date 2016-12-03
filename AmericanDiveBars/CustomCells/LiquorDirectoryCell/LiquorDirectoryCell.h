//
//  LiquorDirectoryCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/12/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiquorDirectoryCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgLiquorLogo;

@property (strong, nonatomic) IBOutlet UILabel *lblLiquorTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblType;
@property (strong, nonatomic) IBOutlet UILabel *lblABV;
@property (strong, nonatomic) IBOutlet UILabel *lblProducer;

-(void)configureCell;

@end
