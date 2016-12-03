//
//  AlphabetSearchView.m
//  AmericanDiveBars
//
//  Created by spaculus on 9/11/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "AlphabetSearchView.h"
#import "AlphabetCell.h"

//AlphabetCell
static NSString * const AlphabetCellIdentifier = @"AlphabetCell";
@interface AlphabetSearchView ()
{
    NSArray *aryAlphabets;
}

@end

@implementation AlphabetSearchView

-(void)configureAlphabetSearchView {
    
    aryAlphabets = @[@"#",@"1",@"A",@"B",
                     @"C",@"D",@"E",@"F",
                     @"G",@"H",@"I",@"J",
                     @"K",@"L",@"M",@"N",
                     @"O",@"P",@"Q",@"R",
                     @"S",@"T",@"U",@"V",
                     @"W",@"X",@"Y",@"Z",];
    
    self.selectedIndex = -1;
    [self registerCell];
    [self.cv reloadData];
}

-(void)reloadCollectionView {
    [self.cv reloadData];
}

#pragma mark - Collection View
-(void)registerCell {
    [self.cv registerNib:[UINib nibWithNibName:@"AlphabetCell" bundle:nil] forCellWithReuseIdentifier:AlphabetCellIdentifier];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return [CommonUtils getArrayCountFromArray:aryAlphabets];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    static AlphabetCell *cell = nil;
    cell = [collectionView dequeueReusableCellWithReuseIdentifier:AlphabetCellIdentifier forIndexPath:indexPath];
    if (self.selectedIndex == indexPath.item) {
        cell.lblChar.textColor = [UIColor colorWithRed:187.0/255.0 green:124.0/255.0 blue:37.0/255.0 alpha:1.0];
    }
    else {
        cell.lblChar.textColor = [UIColor whiteColor];
    }
    cell.lblChar.text = [aryAlphabets objectAtIndex:indexPath.item];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndex = indexPath.item;
    NSString *character = [aryAlphabets objectAtIndex:indexPath.item];
    if(indexPath.item == 0) {
        character = @"'-#";
    }
    if (indexPath.item==1) {
        character = @"0-9";
    }
    
    if ([[self delegate] respondsToSelector:@selector(didSelectCharacter:)]) {
        [[self delegate] didSelectCharacter:character];
    }
}




@end
