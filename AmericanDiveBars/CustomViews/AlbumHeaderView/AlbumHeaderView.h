//
//  AlbumHeaderView.h
//  AmericanDiveBars
//
//  Created by spaculus on 10/7/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AlbumHeaderViewDelegate <NSObject>

-(void)resetButtonTapped;
-(void)selectAllTapped:(UIButton *)btnSelectAll;
-(void)deleteTapped;
-(void)addNewAlbumTapped;
-(void)searchFavByName:(NSString *)name;
@end

@interface AlbumHeaderView : UIView
@property (strong, nonatomic) id<AlbumHeaderViewDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *txtSearch;
@property (strong, nonatomic) IBOutlet UIButton *btnReset;

@property (strong, nonatomic) IBOutlet UIButton *btnSelectAll;
@property (strong, nonatomic) IBOutlet UIButton *btnDelete;
@property (strong, nonatomic) IBOutlet UIButton *btnAddAlbum;


- (IBAction)btnReset_Clicked:(id)sender;
- (IBAction)btnSelectAll_Clicked:(id)sender;
- (IBAction)btnDelete_Clicked:(id)sender;
- (IBAction)btnAddAlbum_Clicked:(id)sender;

-(void)configureAlbumView:(NSString *)placeHolderText;

@end
