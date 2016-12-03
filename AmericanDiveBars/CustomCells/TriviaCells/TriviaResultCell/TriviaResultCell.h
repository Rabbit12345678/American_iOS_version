//
//  TriviaResultCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 5/2/16.
//  Copyright © 2016 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TriviaResultCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblYourScore;
@property (strong, nonatomic) IBOutlet UILabel *lblTimeTaken;

@property (strong, nonatomic) IBOutlet UIButton *btnFb;
@property (strong, nonatomic) IBOutlet UIButton *btnTwitter;
@property (strong, nonatomic) IBOutlet UIButton *btnGoogle;
@property (strong, nonatomic) IBOutlet UIButton *btnPintrest;

@property (strong, nonatomic) IBOutlet UIButton *btnTryAgain;

@property (strong, nonatomic) IBOutlet UIView *totalScore_View;
@property (strong, nonatomic) IBOutlet UIView *totalTimer_View;

@end
