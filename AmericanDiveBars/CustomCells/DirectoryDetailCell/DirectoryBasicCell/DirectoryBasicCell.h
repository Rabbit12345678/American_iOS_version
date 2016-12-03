//
//  DirectoryBasicCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/26/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DirectoryBasicCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UIImageView *imgBeerLogo;

@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblBeerTitle;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblBrewedByTitle;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *lblBrewedBy;

@end
