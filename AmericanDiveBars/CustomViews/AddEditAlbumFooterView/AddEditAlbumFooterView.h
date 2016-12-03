//
//  AddEditAlbumFooterView.h
//  AmericanDiveBars
//
//  Created by spaculus on 10/8/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddEditAlbumFooterViewDelegate <NSObject>

-(void)didOpenStatusOption;
-(void)createAlbum;
-(void)cancelToCreateAlbum;

@end

@interface AddEditAlbumFooterView : UIView

@property (strong, nonatomic) id<AddEditAlbumFooterViewDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *txtStatus;
@property (strong, nonatomic) IBOutlet UIButton *btnCreateAlbum;
@property (strong, nonatomic) IBOutlet UIButton *btnCancel;

- (IBAction)btnCreateAlbum_Clicked:(id)sender;
- (IBAction)btnCancel_Clicked:(id)sender;

-(void)configureAddEditAlbumFooterView;
@end
