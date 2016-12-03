//
//  DirectoryHeaderView.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/11/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DirectoryHeaderViewDelegate <NSObject>

-(void)didShowAlphabetSearchView:(BOOL)open;
-(void)setSortingType;
-(void)didSearchTapped:(NSString *)typedKeyWord;

@end

@interface DirectoryHeaderView : UIView

@property (strong, nonatomic) IBOutlet UIView *viewSorting;
@property (strong, nonatomic) IBOutlet UILabel *lblSearchTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblFilterType;

@property (strong, nonatomic) IBOutlet UITextField *txtSearchByName;
@property (strong, nonatomic) IBOutlet UIButton *btnA_Z;

@property (strong, nonatomic) id<DirectoryHeaderViewDelegate> delegate;

-(void)configureBeerHeaderView:(NSString *)placeHolderText;
-(void)setSearchTextfieldClear;
- (IBAction)btnAZ_Clicked:(id)sender;
@end
