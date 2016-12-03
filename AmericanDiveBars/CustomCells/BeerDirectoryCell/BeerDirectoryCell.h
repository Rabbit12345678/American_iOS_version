//
//  BeerDirectoryCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/9/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeerDirectoryCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgBeerLogo;

@property (strong, nonatomic) IBOutlet UILabel *lblBeerTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblType;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblWebSite;
@property (weak, nonatomic) IBOutlet UILabel *lblBrewedBy;
@property (strong, nonatomic) IBOutlet UILabel *lblCityProduced;

-(void)configureCell;
@end
