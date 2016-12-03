//
//  Cocktail_LiquorsCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/15/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cocktail_LiquorsCell : UITableViewCell

@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblServedTitle;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblServedDesc;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblBeerServedDateTime;
@property (strong, nonatomic) IBOutlet UIImageView *imgServed;


@end
