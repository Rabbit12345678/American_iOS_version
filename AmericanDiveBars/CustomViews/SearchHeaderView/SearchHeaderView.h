//
//  SearchHeaderView.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/2/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchHeaderViewDelegate <NSObject>

-(void)dismissSearchView;
-(void)cancelSearchView;
@end

@interface SearchHeaderView : UIView
@property (strong, nonatomic) NSString * searchText;
@property (strong, nonatomic) IBOutlet UITextField * txtSearch;
@property (strong, nonatomic) id<SearchHeaderViewDelegate> delegate;

- (IBAction)btnCancel_Clicked:(id)sender;
-(void)configureTextField;

- (IBAction)btnDoneForSearch:(id)sender;

@end
