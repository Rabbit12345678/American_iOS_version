//
//  AddEditAlbumHeaderView.h
//  AmericanDiveBars
//
//  Created by spaculus on 10/7/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddEditAlbumHeaderViewDelegate <NSObject>

-(void)didSelectImageTitle:(NSString *)imgTitle;
-(void)openImageSelector;

@end

@interface AddEditAlbumHeaderView : UIView
@property (strong, nonatomic) id<AddEditAlbumHeaderViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *txtAlbumTitle;
@property (strong, nonatomic) IBOutlet UIButton *btnAddImage;

- (IBAction)btnAddImage_Clicked:(id)sender;

-(void)configureAddEditAlbumView:(NSString *)placeHolderText;
@end
