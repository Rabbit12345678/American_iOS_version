//
//  CocktailDirectoryCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/12/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CocktailDirectoryCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgCocktailLogo;

@property (strong, nonatomic) IBOutlet UILabel *lblCocktailTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblType;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *lblDesc;
@property (weak, nonatomic) IBOutlet UILabel *lblServed;
@property (weak, nonatomic) IBOutlet UILabel *lblDifficulty;
-(void)configureCell;

@end
