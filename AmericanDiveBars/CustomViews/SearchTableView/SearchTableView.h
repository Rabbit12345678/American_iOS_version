//
//  SearchTableView.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/2/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchTableViewDelegate <NSObject>

@optional
-(void)dismissSearchView;
-(void)selectSearchedName:(NSString *)name;
-(void)didSelectBar:(Bar *)bar;

@end

@interface SearchTableView : UIView

@property (strong, nonatomic) id<SearchTableViewDelegate> delegate;

-(void)configureSearchTableView;
-(void)reloadSearchTableWithText:(NSString *)name;
@end
