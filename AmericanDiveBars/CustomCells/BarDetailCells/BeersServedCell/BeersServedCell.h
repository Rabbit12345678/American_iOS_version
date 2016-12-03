//
//  BeersServedCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/15/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeersServedCell : UITableViewCell
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblBeerServedTitle;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblBeerServedDesc;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblBeerServedDateTime;
@property (strong, nonatomic) IBOutlet UIImageView *imgBeerServed;

@end
