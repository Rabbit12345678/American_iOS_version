//
//  GetDirectionMapCell.h
//  GetDirections
//
//  Created by spaculus on 10/29/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "TTTAttributedLabel.h"

@class GetDirectionMapCell;
@protocol GetDirectionMapCellDelegate <NSObject>

@optional
-(void)getDirectionListFromSourceToDestination:(NSArray *)aryDirectionList isSourceAddress:(BOOL)isSourceAddress;
-(void)getDirectionListViewController_FromSourceToDestination:(NSArray *)aryDirectionList isSourceAddress:(BOOL)isSourceAddress;
-(void)displayRouteForSource:(CLLocationCoordinate2D)source toDestination:(CLLocationCoordinate2D)destination ifRouteAvailable:(BOOL)isRoute_ isSourceAddress:(BOOL)isSourceAddress;

@end

@interface GetDirectionMapCell : UITableViewCell

@property (strong, nonatomic) id <GetDirectionMapCellDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *txtEnterLocation;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblDestination;
@property (strong, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) IBOutlet UIView *locationsView;

@property (strong, nonatomic) IBOutlet UIButton *btnSearch;
@property (strong, nonatomic) IBOutlet UIButton *btnDirectionList;

@property (nonatomic, assign) BOOL isFromGetDirection;

-(IBAction)btnSearch_Clicked:(id)sender;
-(IBAction)btnDirectionList_Clicked:(id)sender;

-(void)configureMapWithLatitude:(NSString *)lat andLongitude:(NSString *)lng forAddress:(NSString *)address isSource:(BOOL)isSource;
-(void)configureMapRoutePathForSource:(CLLocationCoordinate2D)sourceLoc toDestination:(CLLocationCoordinate2D)destinationLoc;
-(void)getLatlongfromAddress:(NSString *)address isSource:(BOOL)isSource;
@end
