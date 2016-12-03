//
//  ShowMoreView.m
//  AmericanDiveBars
//
//  Created by spaculus on 9/23/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "ShowMoreView.h"

#import "ShowMoreDetailCell.h"

static NSString * const ShowMoreDetailCellIdentifier = @"ShowMoreDetailCell";
#define Nib_ShowMoreDetailCell @"ShowMoreDetailCell"

@interface ShowMoreView ()
{
    NSArray *aryShowMore;
}
@end

@implementation ShowMoreView

-(void)configureShowMoreView {
    self.viewShowMore.layer.borderColor = [UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0].CGColor;
    self.viewShowMore.layer.borderWidth = 1.0;
    self.viewShowMore.layer.cornerRadius = 5.0f;
    self.viewShowMore.layer.masksToBounds = YES;
}


-(void)reloadShowMoreTable:(NSArray *)aryList {
    aryShowMore = aryList;
    [self registerCell];
    [self.tblView reloadData];
}

-(void)registerCell {
    [self.tblView registerNib:[UINib nibWithNibName:@"ShowMoreDetailCell" bundle:nil] forCellReuseIdentifier:ShowMoreDetailCellIdentifier];
}

- (IBAction)btnClose_Clicked:(id)sender {
    if ([[self delegate] respondsToSelector:@selector(dismissShowMoreView)]) {
        [[self delegate] dismissShowMoreView];
    }
}


#pragma mark - TableView Delegates
#pragma mark Number of Section
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark Number of Row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [CommonUtils getArrayCountFromArray:aryShowMore];
}
#pragma mark Cell for Row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self ShowMoreDetailCellAtIndexPath:indexPath];
}

#pragma mark
#pragma mark ShowMoreDetailCell Cell Configuration
- (ShowMoreDetailCell *)ShowMoreDetailCellAtIndexPath:(NSIndexPath *)indexPath
{
    static ShowMoreDetailCell *cell = nil;
    cell = [self.tblView dequeueReusableCellWithIdentifier:ShowMoreDetailCellIdentifier];
    [self configureShowMoreDetailCell:cell atIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)configureShowMoreDetailCell:(ShowMoreDetailCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    cell.lblMore.text = [aryShowMore objectAtIndex:indexPath.row];
}


#pragma mark Cell Height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellHeight = [self heightForShowMoreDetailCellAtIndexPath:indexPath];
    return cellHeight;
}

#pragma mark
#pragma mark ShowMoreDetailCell Cell With Height Configuration
- (CGFloat)heightForShowMoreDetailCellAtIndexPath:(NSIndexPath *)indexPath
{
    static ShowMoreDetailCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [self.tblView dequeueReusableCellWithIdentifier:ShowMoreDetailCellIdentifier];
    });
    
    [self configureShowMoreDetailCell:sizingCell atIndexPath:indexPath];
    return [self calculateHeightForConfiguredSizingCell:sizingCell];
}
#pragma mark Calculate Height for Cell

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell
{
    sizingCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.tblView.frame), CGRectGetHeight(sizingCell.bounds));
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1.0f; // Add 1.0f for the cell separator height
}
#pragma mark Estmated Height For Row
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 36;
}

@end
