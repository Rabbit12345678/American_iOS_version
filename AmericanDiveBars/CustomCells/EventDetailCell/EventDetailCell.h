//
//  EventDetailCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/23/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EventDetailCell;





@interface EventDetailCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblValue;

@end
