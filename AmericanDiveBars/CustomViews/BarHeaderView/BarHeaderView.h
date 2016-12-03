//
//  BarHeaderView.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/3/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BarHeaderViewDelegate <NSObject>

-(void)setSortingType;

@end

@interface BarHeaderView : UIView

@property (strong, nonatomic) id<BarHeaderViewDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIView *viewSorting;
@property (strong, nonatomic) IBOutlet UILabel *lblSearchTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblFilterType;


- (IBAction)viiewSorting_Clicked:(id)sender;
-(void)configureBarHeaderView;

@end
