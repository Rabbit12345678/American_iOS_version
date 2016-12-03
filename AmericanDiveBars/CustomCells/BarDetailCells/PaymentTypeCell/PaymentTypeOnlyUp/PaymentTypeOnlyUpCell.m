//
//  PaymentTypeOnlyUpCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 9/16/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "PaymentTypeOnlyUpCell.h"
#import "PaymentUpCell.h"

static NSString * const PaymentUpCelldentifier =  @"PaymentUpCell";

@implementation PaymentTypeOnlyUpCell

- (void)awakeFromNib {
    // Initialization code
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configurePaymentUpCellWith:(NSArray *)aryTypes {
    
    self.aryPaymentTypes = aryTypes;
    [self registerCell];
    [self.cv reloadData];
}

-(void)reloadCollectionView {
    [self.cv reloadData];
}

#pragma mark - Collection View
-(void)registerCell {
    [self.cv registerNib:[UINib nibWithNibName:@"PaymentUpCell" bundle:nil] forCellWithReuseIdentifier:PaymentUpCelldentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return [CommonUtils getArrayCountFromArray:self.aryPaymentTypes];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static PaymentUpCell *cell = nil;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:PaymentUpCelldentifier forIndexPath:indexPath];
    cell.imgUp.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[self.aryPaymentTypes objectAtIndex:indexPath.item]]];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


@end
