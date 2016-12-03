//
//  TakeALookCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/15/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TakeALookCellDelegate <NSObject>

@optional
-(void)presentImageViewController:(JTSImageViewController *)jtvc;
-(void)tapYoutubeVideo:(NSString *)videoURL;
@end

@interface TakeALookCell : UITableViewCell

@property (strong, nonatomic) NSURL *imgLargeURL;

//@property (strong, nonatomic) IBOutlet UIView *youtubeView;
@property (strong, nonatomic) IBOutlet UIImageView *imgYoutubeThumbnail;
@property (strong, nonatomic) IBOutlet UIImageView *imgPlayVideo;

@property (strong, nonatomic) NSString * bar_video_link;
@property (strong, nonatomic) NSString * youtubeID;

@property (strong, nonatomic) id<TakeALookCellDelegate> delegate;

@property (strong, nonatomic) IBOutlet YTPlayerView *playerView;

-(void)configureCellForYoutube;
-(void)configureCellWithURL :(NSURL *)imgURL;
@end
