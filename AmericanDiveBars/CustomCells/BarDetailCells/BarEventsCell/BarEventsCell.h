//
//  BarEventsCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/15/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BarEventsCell : UITableViewCell

@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblEventTitle;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblEventDesc;
@property (strong, nonatomic) IBOutlet TTTAttributedLabel *lblEventDateTime;
@property (strong, nonatomic) IBOutlet UIImageView *imgBarEvent;

@end
