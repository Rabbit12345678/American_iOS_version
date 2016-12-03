//
//  HowToFindUSCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/15/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HowToFindUSCell : UITableViewCell

@property (strong, nonatomic) IBOutlet MKMapView *viewMap;
@property (strong, nonatomic) IBOutlet UIButton *btnGetDirections;

-(void)configureMapInFullMugBar:(FullMugBar *)fullMugBar;
-(void)getLatlongfromAddress:(NSString *)address;
@end
