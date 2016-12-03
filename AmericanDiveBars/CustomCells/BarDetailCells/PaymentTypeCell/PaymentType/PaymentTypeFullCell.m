//
//  PaymentTypeFullCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 9/16/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "PaymentTypeFullCell.h"
#import "PaymentUpCell.h"
#import "PaymentDownCell.h"

static NSString * const PaymentUpCelldentifier =  @"PaymentUpCell";
static NSString * const PaymentDownCelldentifier = @"PaymentDownCell";

@implementation PaymentTypeFullCell

- (void)awakeFromNib {
    // Initialization code
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configurePaymentCellWith:(NSArray *)aryPayment_Up and:(NSArray *)aryPayment_Down {
    
    self.aryPaymentTypes_Up = aryPayment_Up;
    self.aryPaymentTypes_Down = aryPayment_Down;
    
    [self registerCell_Up];
    [self registerCell_Down];
    
    [self.cv_Up reloadData];
    [self.cv_Down reloadData];
}

-(void)reloadCollectionView {
    [self.cv_Up reloadData];
    [self.cv_Down reloadData];
}

#pragma mark - Collection View
-(void)registerCell_Up {
    [self.cv_Up registerNib:[UINib nibWithNibName:@"PaymentUpCell" bundle:nil] forCellWithReuseIdentifier:PaymentUpCelldentifier];
}

-(void)registerCell_Down {
    [self.cv_Down registerNib:[UINib nibWithNibName:@"PaymentDownCell" bundle:nil] forCellWithReuseIdentifier:PaymentDownCelldentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    if (collectionView == self.cv_Up) {
        return [CommonUtils getArrayCountFromArray:self.aryPaymentTypes_Up];
    }
    else {
        return [CommonUtils getArrayCountFromArray:self.aryPaymentTypes_Down];

    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    if (collectionView == self.cv_Up) {
        static PaymentUpCell *cell = nil;
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:PaymentUpCelldentifier forIndexPath:indexPath];
        cell.imgUp.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[self.aryPaymentTypes_Up objectAtIndex:indexPath.item]]];
        //[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[self.aryPaymentTypes objectAtIndex:indexPath.item]]]
        return cell;
    }
    else {
        static PaymentDownCell *cell = nil;
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:PaymentDownCelldentifier forIndexPath:indexPath];
        cell.imgDown.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[self.aryPaymentTypes_Down objectAtIndex:indexPath.item]]];
        return cell;

    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


@end
