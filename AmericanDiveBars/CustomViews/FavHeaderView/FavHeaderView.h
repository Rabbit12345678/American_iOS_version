//
//  FavHeaderView.h
//  AmericanDiveBars
//
//  Created by spaculus on 10/5/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FavHeaderViewDelegate <NSObject>

-(void)resetButtonTapped;
-(void)selectAllTapped:(UIButton *)btnSelectAll;
-(void)deleteTapped;
-(void)searchFavByName:(NSString *)name;
@end

@interface FavHeaderView : UIView

@property (strong, nonatomic) id<FavHeaderViewDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *txtSearch;
@property (strong, nonatomic) IBOutlet UIButton *btnReset;

@property (strong, nonatomic) IBOutlet UIButton *btnSelectAll;
@property (strong, nonatomic) IBOutlet UIButton *btnDelete;


- (IBAction)btnReset_Clicked:(id)sender;
- (IBAction)btnSelectAll_Clicked:(id)sender;
- (IBAction)btnDelete_Clicked:(id)sender;

-(void)configureFavHeaderView:(NSString *)placeHolderText;
@end
