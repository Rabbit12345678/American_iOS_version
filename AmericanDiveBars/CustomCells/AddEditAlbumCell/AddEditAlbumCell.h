//
//  AddEditAlbumCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 10/7/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddEditAlbumCellDelegate <NSObject>

-(void)btnDeleteTappedForIndexPath:(NSIndexPath *)indexPath;
-(void)openImagePickerControllerFromSelectedIndexPath:(NSIndexPath *)indexPath;

@end

@interface AddEditAlbumCell : UITableViewCell

@property (strong, nonatomic) id<AddEditAlbumCellDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIImageView *img;

@property (strong, nonatomic) IBOutlet UITextField *txtImageTitle;

- (IBAction)imgTapped:(id)sender;
-(void)configureCellUI;
@end
