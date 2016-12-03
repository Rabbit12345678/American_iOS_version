//
//  ShowMoreView.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/23/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShowMoreViewDelegate <NSObject>

-(void)dismissShowMoreView;

@end

@interface ShowMoreView : UIView

@property (strong, nonatomic) id<ShowMoreViewDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIView *viewShowMore;
@property (strong, nonatomic) IBOutlet TPKeyboardAvoidingTableView *tblView;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UIButton *btnClose;

@property (strong, nonatomic) IBOutlet UIImageView *imgShowMore;

- (IBAction)btnClose_Clicked:(id)sender;
- (void)configureShowMoreView;
- (void)reloadShowMoreTable:(NSArray *)aryList;
@end
