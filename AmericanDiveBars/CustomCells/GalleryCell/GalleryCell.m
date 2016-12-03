//
//  GalleryCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 10/14/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import "GalleryCell.h"
#import "GalleryThumbnailCell.h"

typedef enum ScrollDirection {
    ScrollDirectionNone,
    ScrollDirectionRight,
    ScrollDirectionLeft,
    ScrollDirectionUp,
    ScrollDirectionDown,
    ScrollDirectionCrazy,
} ScrollDirection;

static NSString * const GalleryThumbnailCellIdentifier =  @"GalleryThumbnailCell";

@implementation GalleryCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)bigImageTapped:(id)sender {
    // Create image info
    JTSImageInfo *imageInfo = [[JTSImageInfo alloc] init];
    //imageInfo.image = self.imgLarge;
    imageInfo.placeholderImage = [UIImage imageNamed:@"bar-gallery-large-placeholder.png"];
    imageInfo.imageURL = self.imgLargeURL;
    imageInfo.referenceRect = self.imgBarLarge.frame;
    imageInfo.referenceView = self.imgBarLarge.superview;
    imageInfo.referenceContentMode = self.imgBarLarge.contentMode;
    imageInfo.referenceCornerRadius = self.imgBarLarge.layer.cornerRadius;
    
    // Setup view controller
    JTSImageViewController *imageViewer = [[JTSImageViewController alloc]
                                           initWithImageInfo:imageInfo
                                           mode:JTSImageViewControllerMode_Image
                                           backgroundStyle:JTSImageViewControllerBackgroundOption_Blurred];
    
    
    if ([[self delegate] respondsToSelector:@selector(presentImageViewController:)]) {
        [[self delegate] presentImageViewController:imageViewer];
    }
    
}

- (IBAction)btnShare_Clicked:(id)sender {
}

#pragma mark - Collection View

-(void)configureBarGalleryThumbnailCellWith:(NSArray *)aryImages withOriginalImageURL:(NSURL *)imgOriginalURL forImageType:(NSString *)imageType{
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    self.imgType = imageType;
    self.imgLargeURL = imgOriginalURL;
    self.aryThumbnails = aryImages;
    
    if ([self.aryThumbnails count]>3) {
        self.rightArrow.hidden = NO;
    }
    else {
        self.rightArrow.hidden = YES;
    }
    
    self.leftArrow.hidden = YES;
    
    [self registerCell];
    [self.cv reloadData];
}



-(void)registerCell {
    [self.cv registerNib:[UINib nibWithNibName:@"GalleryThumbnailCell" bundle:nil] forCellWithReuseIdentifier:GalleryThumbnailCellIdentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return [CommonUtils getArrayCountFromArray:self.aryThumbnails];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static GalleryThumbnailCell *cell = nil;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:GalleryThumbnailCellIdentifier forIndexPath:indexPath];
    id gallery = nil;
    
    gallery = [self.aryThumbnails objectAtIndex:indexPath.item];
    
    NSString *imageName = @"";
    NSString *strImgURL = @"";
    if ([gallery isKindOfClass:[BarGallery class]]) {
        BarGallery *barGallery = (BarGallery *)gallery;
        imageName = [barGallery bargal_image_name];
        strImgURL = [NSString stringWithFormat:@"%@%@%@",WEBIMAGE_URL,self.imgType,imageName];
        //strImgURL = [NSString stringWithFormat:@"%@%@%@",WEBIMAGE_URL,BARGALLARY_SMALL,imageName];
    }
    else {
        EventGallery *eventGallery = (EventGallery *)gallery;
        imageName = [eventGallery eventGal_event_image_name];
        strImgURL = [NSString stringWithFormat:@"%@%@%@",WEBIMAGE_URL,self.imgType,imageName];
        //strImgURL = [NSString stringWithFormat:@"%@%@%@",WEBIMAGE_URL,BAR_EVENTGALLERY_SMALL,imageName];
    }
        
    NSURL *imgURL = [NSURL URLWithString:strImgURL];
    
    [cell.imgThumbnail sd_setImageWithURL:imgURL placeholderImage:[UIImage imageNamed:@"bar-gallery-thumb-placeholder.png"]];
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    id gallery = nil;
    
    gallery = [self.aryThumbnails objectAtIndex:indexPath.item];
    
    NSURL *imageURL = nil;
    
    if ([gallery isKindOfClass:[BarGallery class]]) {
        BarGallery *barGallery = (BarGallery *)gallery;
        imageURL = [barGallery bargal_OriginalImageURL];
    }
    else {
        EventGallery *eventGallery = (EventGallery *)gallery;
        imageURL = [eventGallery eventGal_OriginalImageURL];
    }
    self.imgLargeURL = imageURL;
    if ([[self delegate] respondsToSelector:@selector(didSelectThumbnailImage:AtIndexPath:forCell:)]) {
        [[self delegate] didSelectThumbnailImage:nil AtIndexPath:indexPath forCell:self];
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    float scrollViewWidth = scrollView.frame.size.width;
    float scrollContentSizeWidth = scrollView.contentSize.width;
    float scrollOffset = scrollView.contentOffset.x;
    
    if (scrollOffset == 0)
    {
        //hide left arrow
        self.leftArrow.hidden = YES;
    }
    else if (scrollOffset + scrollViewWidth == scrollContentSizeWidth)
    {
        // hide right arrow
        self.rightArrow.hidden = YES;
    }
    else {
        // show left arrow
        self.leftArrow.hidden = NO;
        
        // show right arrow
        self.rightArrow.hidden = NO;
    }
    
}

@end
