//
//  AlphabetSearchView.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/11/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AlphabetSearchViewDelegate <NSObject>

-(void)didSelectCharacter:(NSString *)charecter;

@end

@interface AlphabetSearchView : UIView

@property (nonatomic , strong) id<AlphabetSearchViewDelegate> delegate;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (strong, nonatomic) IBOutlet UICollectionView *cv;

-(void)configureAlphabetSearchView;
-(void)reloadCollectionView;
@end
