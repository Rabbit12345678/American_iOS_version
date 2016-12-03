//
//  BarGalleryCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/15/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BarGalleryCell;

@protocol BarGalleryCellDelegate <NSObject>

-(void)presentImageViewController:(JTSImageViewController *)jtvc;
-(void)didSelectThumbnailImage:(UIImage *)img AtIndexPath:(NSIndexPath *)indexPath forCell:(BarGalleryCell *)cell;

@end

@interface BarGalleryCell : UITableViewCell
@property (strong, nonatomic) UIImage *imgLarge;
@property (strong, nonatomic) NSURL *imgLargeURL;
@property (strong, nonatomic) IBOutlet UIImageView *imgBarLarge;
@property (strong, nonatomic) IBOutlet UILabel *lblBarTitle;
@property (strong, nonatomic) IBOutlet UICollectionView *cv;
@property (strong, nonatomic) IBOutlet UIView *viewShadow;

@property (strong, nonatomic) id<BarGalleryCellDelegate> delegate;
@property (assign, nonatomic) NSIndexPath *selIndexPath;

@property (strong, nonatomic) IBOutlet UIImageView *rightArrow;
@property (strong, nonatomic) IBOutlet UIImageView *leftArrow;

@property (assign, nonatomic) NSString *imgType;
@property (strong, nonatomic) IBOutlet UILabel *lblNoData;

@property (nonatomic, strong) NSArray *aryThumbnails;
-(void)configureBarGalleryThumbnailCellWith:(NSArray *)aryImages withOriginalImageURL:(NSURL *)imgOriginalURL forImageType:(NSString *)imageType;
- (IBAction)bigImageTapped:(id)sender;
@end
