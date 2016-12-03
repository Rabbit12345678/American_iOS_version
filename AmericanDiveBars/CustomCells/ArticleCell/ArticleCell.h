//
//  ArticleCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 4/15/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblBg;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblArticle;

@property (strong, nonatomic) IBOutlet UIImageView *imgArticle;


@end
