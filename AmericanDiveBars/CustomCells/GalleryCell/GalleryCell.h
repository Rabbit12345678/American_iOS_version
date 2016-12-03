//
//  GalleryCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 10/14/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GalleryCell;

@protocol GalleryCellDelegate <NSObject>

-(void)presentImageViewController:(JTSImageViewController *)jtvc;
-(void)didSelectThumbnailImage:(UIImage *)img AtIndexPath:(NSIndexPath *)indexPath forCell:(GalleryCell *)cell;

@end


@interface GalleryCell : UITableViewCell

@property (strong, nonatomic) UIImage *imgLarge;
@property (strong, nonatomic) NSURL *imgLargeURL;
@property (strong, nonatomic) IBOutlet UIImageView *imgBarLarge;
@property (strong, nonatomic) IBOutlet UILabel *lblBarTitle;
@property (strong, nonatomic) IBOutlet UICollectionView *cv;
@property (strong, nonatomic) IBOutlet UIView *viewShadow;
@property (strong, nonatomic) IBOutlet UIButton *btnShare;

@property (strong, nonatomic) id<GalleryCellDelegate> delegate;
@property (assign, nonatomic) NSIndexPath *selIndexPath;

@property (assign, nonatomic) NSString *imgType;

@property (nonatomic, strong) NSArray *aryThumbnails;

@property (strong, nonatomic) IBOutlet UIImageView *rightArrow;
@property (strong, nonatomic) IBOutlet UIImageView *leftArrow;

@property (nonatomic, assign) CGFloat lasContentOffset;

-(void)configureBarGalleryThumbnailCellWith:(NSArray *)aryImages withOriginalImageURL:(NSURL *)imgOriginalURL forImageType:(NSString *)imageType;
- (IBAction)bigImageTapped:(id)sender;
- (IBAction)btnShare_Clicked:(id)sender;


@end
