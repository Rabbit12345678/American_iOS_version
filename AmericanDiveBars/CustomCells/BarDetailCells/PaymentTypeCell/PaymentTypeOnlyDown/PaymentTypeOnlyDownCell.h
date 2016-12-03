//
//  PaymentTypeOnlyDownCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/16/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentTypeOnlyDownCell : UITableViewCell

@property (nonatomic, strong) NSArray *aryPaymentTypes;
@property (strong, nonatomic) IBOutlet UICollectionView *cv;

-(void)configurePaymentDownCellWith:(NSArray *)aryTypes;
@end
