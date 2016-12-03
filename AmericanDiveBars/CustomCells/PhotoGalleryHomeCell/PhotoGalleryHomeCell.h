//
//  PhotoGalleryHomeCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 10/1/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoGalleryHomeCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgGallery;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UIView *viewShadow;
@end
