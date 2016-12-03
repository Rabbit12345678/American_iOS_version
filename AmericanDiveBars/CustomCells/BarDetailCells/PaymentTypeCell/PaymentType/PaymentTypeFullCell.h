//
//  PaymentTypeFullCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/16/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentTypeFullCell : UITableViewCell

@property (nonatomic, strong) NSArray *aryPaymentTypes_Up;
@property (nonatomic, strong) NSArray *aryPaymentTypes_Down;

@property (strong, nonatomic) IBOutlet UICollectionView *cv_Up;
@property (strong, nonatomic) IBOutlet UICollectionView *cv_Down;

-(void)configurePaymentCellWith:(NSArray *)aryPayment_Up and:(NSArray *)aryPayment_Down;
@end
