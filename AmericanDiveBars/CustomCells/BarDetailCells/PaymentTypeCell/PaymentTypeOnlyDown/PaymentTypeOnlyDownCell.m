//
//  PaymentTypeOnlyDownCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 9/16/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "PaymentTypeOnlyDownCell.h"
#import "PaymentDownCell.h"

static NSString * const PaymentDownCelldentifier = @"PaymentDownCell";

@implementation PaymentTypeOnlyDownCell

- (void)awakeFromNib {
    // Initialization code
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configurePaymentDownCellWith:(NSArray *)aryTypes {
    
    self.aryPaymentTypes = aryTypes;
    [self registerCell];
    [self.cv reloadData];
}

-(void)reloadCollectionView {
    [self.cv reloadData];
}

#pragma mark - Collection View
-(void)registerCell {
    [self.cv registerNib:[UINib nibWithNibName:@"PaymentDownCell" bundle:nil] forCellWithReuseIdentifier:PaymentDownCelldentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return [CommonUtils getArrayCountFromArray:self.aryPaymentTypes];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static PaymentDownCell *cell = nil;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:PaymentDownCelldentifier forIndexPath:indexPath];
    cell.imgDown.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[self.aryPaymentTypes objectAtIndex:indexPath.item]]];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


@end
