//
//  SearchTableView.m
//  AmericanDiveBars
//
//  Created by spaculus on 9/2/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "SearchTableView.h"
#import "SearchHeaderView.h"
#import "SearchTitleCell.h"

static NSString * const SearchTitleCellIdentifier = @"SearchTitleCell";
#define Nib_SearchTitleCell @"SearchTitleCell"


@interface SearchTableView () <MBProgressHUDDelegate,SearchHeaderViewDelegate,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    MBProgressHUD *HUD;
    SearchHeaderView *searchHeaderView;
    NSString * searchText;
}

@property (strong, nonatomic) NSArray * aryTitles;
@property (strong, nonatomic) IBOutlet TPKeyboardAvoidingTableView *tblView;

@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, strong) NSURLConnection *connectionAutoSuggest;

@end

@implementation SearchTableView

-(void)configureSearchTableView  {
    id headerView = [[[NSBundle mainBundle] loadNibNamed:@"SearchHeaderView" owner:self options:nil] objectAtIndex:0];
    searchHeaderView = (SearchHeaderView *)headerView;
    searchHeaderView.delegate = self;
    UIButton *btnDone = (UIButton *)[[searchHeaderView subviews] objectAtIndex:3];
    [btnDone addTarget:self action:@selector(dismissSearchView) forControlEvents:UIControlEventTouchUpInside];
    [searchHeaderView configureTextField];
    [searchHeaderView.txtSearch setDelegate:self];
    //[self.tblView reloadData];
}


-(void)reloadSearchTableWithText:(NSString *)name {
    [self.tblView setDelegate:self];
    [self.tblView setDataSource:self];
    searchText = name;
    searchHeaderView.txtSearch.text = searchText;
    if ([searchText length]>0) {
        [self callWebserviceForAutoSuggestBar];
    }
    else {
        self.aryTitles = @[];
        //[self.aryTitles removeAllObjects];
        [self.tblView reloadData];
    }
    
}

-(void)registerCell
{
    [self.tblView registerNib:[UINib nibWithNibName:Nib_SearchTitleCell bundle:nil] forCellReuseIdentifier:SearchTitleCellIdentifier];
}

#pragma mark - TableView Delegates
#pragma mark View For Header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    [searchHeaderView.txtSearch becomeFirstResponder];
    return searchHeaderView;
}

#pragma mark View For Header
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 110;
}

#pragma mark Number of Section
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark Number of Row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [CommonUtils getArrayCountFromArray:self.aryTitles];
}

#pragma mark Cell for Row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self SearchTitleCellAtIndexPath:indexPath];
//    static NSString *simpleTableIdentifier = @"SearchTitleCell";
//    
//    SearchTitleCell *cell = (SearchTitleCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    if (cell == nil)
//    {
//        NSArray *nib;
//        if([CommonUtils isiPad])
//        {
//            nib = [[NSBundle mainBundle] loadNibNamed:@"SearchTitleCell" owner:self options:nil];
//        }
//        else
//        {
//            nib = [[NSBundle mainBundle] loadNibNamed:@"SearchTitleCell" owner:self options:nil];
//        }
//        cell = [nib objectAtIndex:0];
//    }
//    
//    NSDictionary *dict = nil;
//    dict = [self.aryTitles objectAtIndex:indexPath.row];
//    
//    NSString *label = [CommonUtils getNotNullString:[dict valueForKey:@"label"]];
//    cell.lblTitle.text = label;
//    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    return cell;
}


#pragma mark
#pragma mark SearchTitleCell Cell Configuration
- (SearchTitleCell *)SearchTitleCellAtIndexPath:(NSIndexPath *)indexPath
{
    static SearchTitleCell *cell = nil;
    cell = [self.tblView dequeueReusableCellWithIdentifier:SearchTitleCellIdentifier];
    [self configureSearchTitleCell:cell atIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}

- (void)configureSearchTitleCell:(SearchTitleCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    
    //NSDictionary *dict = nil;
    //dict = [self.aryTitles objectAtIndex:indexPath.row];
    Bar *bar = [self.aryTitles objectAtIndex:indexPath.row];
    
    NSString *label = [bar bar_title];//[CommonUtils getNotNullString:[dict valueForKey:@"value"]];
    NSString *address = [bar fullAddress];//[CommonUtils getNotNullString:[dict valueForKey:@"label"]];
    cell.lblTitle.text = label;
    cell.lblAddress.text = address;
    
}
#pragma mark Height For Row

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellHeight = [self heightForSearchTitleCellAtIndexPath:indexPath];
    return cellHeight;
}

#pragma mark
#pragma mark SearchTitleCell Cell With Height Configuration
- (CGFloat)heightForSearchTitleCellAtIndexPath:(NSIndexPath *)indexPath
{
    static SearchTitleCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [self.tblView dequeueReusableCellWithIdentifier:SearchTitleCellIdentifier];
    });
    
    [self configureSearchTitleCell:sizingCell atIndexPath:indexPath];
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
    return 62;
}

#pragma mark Did Select Row
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSDictionary *dict = nil;
    //dict = [self.aryTitles objectAtIndex:indexPath.row];
    
    /*NSString *label = [CommonUtils getNotNullString:[dict valueForKey:@"value"]];
    if ([[self delegate] respondsToSelector:@selector(selectSearchedName:)]) {
        [[self delegate] selectSearchedName:label];
    }*/
    
    Bar *bar = [self.aryTitles objectAtIndex:indexPath.row];
    if ([[self delegate] respondsToSelector:@selector(didSelectBar:)]) {
        [[self delegate] didSelectBar:bar];
    }
}

#pragma mark - Search Header View
#pragma mark Search Header View Delegates
-(void)dismissSearchView {
    //searchText = @"";
    [searchHeaderView.txtSearch resignFirstResponder];
    if ([[self delegate] respondsToSelector:@selector(selectSearchedName:)]) {
        [[self delegate] selectSearchedName:searchText];
    }
//    if ([[self delegate] respondsToSelector:@selector(dismissSearchView)]) {
//        [[self delegate] dismissSearchView];
//    }
}
-(void)cancelSearchView {
    [searchHeaderView.txtSearch resignFirstResponder];
    if ([[self delegate] respondsToSelector:@selector(selectSearchedName:)]) {
        [[self delegate] selectSearchedName:@""];
    }
}

#pragma mark TextField Delegates
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if ([searchText length]==0) {
        textField.text = @"";
    }
    searchText = textField.text;
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([searchText length]==0) {
        searchText = string;
    }
    else
    {
        if ([string length]==0) {
            if ([searchText length]==1) {
                searchText = @"";
            }
            else {
                searchText = [searchText substringToIndex:[searchText length]-1];
            }
        }else
        {
            searchText = [NSString stringWithFormat:@"%@%@",searchText,string];
        }
    }
    
    if ([searchText length]==0)
    {
        self.aryTitles = @[];
        [self.tblView performSelector:@selector(reloadData) withObject:nil afterDelay:0.01];
    }
    else
    {
        [self.connectionAutoSuggest cancel];
        self.connectionAutoSuggest = nil;
        [self callWebserviceForAutoSuggestBar];
    }
    return YES;
}


-(void)callWebserviceForAutoSuggestBar {
    BOOL hasConnected = [CommonUtils connected];
    if (hasConnected)
    {
        [self performSelector:@selector(auto_suggest_bar) withObject:nil afterDelay:0.0001];
    }
    else
    {
        ShowAlert(AlertTitle, MSG_NO_INTERNET_CONNECTION);
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([searchText length]==0) {
        textField.text = @"";
    }
    searchText = textField.text;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Webservice Call
-(void)auto_suggest_bar
{
    //192.168.1.27/ADB/api/checklogin
    NSString *myURL = [NSString stringWithFormat:@"%@auto_suggest_bar",WEBSERVICE_URL];
    NSMutableURLRequest *Request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: myURL]];
    NSString *params = [NSString stringWithFormat:@"term=%@",searchText];
    [Request setHTTPMethod:@"POST"];
    [Request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSLog(@"search text = %@",searchText);
    
    
    self.connectionAutoSuggest = [[NSURLConnection alloc] initWithRequest:Request delegate:self];
    
    if(self.connectionAutoSuggest)
    {
        _responseData = [NSMutableData data];
    }
    else
    {
        NSLog(@"connectionLogin is NULL");
    }
}




#pragma mark Webservice Response
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.responseData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.responseData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"connectionDidFinishLoading");
    
    NSString *stringResponse = [[NSString alloc]initWithData:self.responseData encoding:NSUTF8StringEncoding];
    NSLog(@"Response : %@",stringResponse);
    if (self.responseData == nil)
    {
        ShowAlert(AlertTitle, MSG_SERVER_NOT_REACHABLE);
        return;
    }
    
    NSError *jsonParsingError = nil;
    NSDictionary *tempDict = [NSJSONSerialization JSONObjectWithData:self.responseData options:0 error:&jsonParsingError];
    NSLog(@"Dict : %@",tempDict);
    
    if ([[tempDict valueForKey:@"status"] isEqualToString:@"success"]) {
        
        if([searchText length]==0) {
            self.aryTitles = @[];
        }
        else {
            NSArray *aryBarList = [tempDict valueForKey:@"barlist"];
            self.aryTitles = [self getBarsFromResult:aryBarList];//[tempDict valueForKey:@"barlist"];//[[tempDict valueForKey:@"barlist"] mutableCopy];
        }
        [self registerCell];
        [self.tblView reloadData];
    }

}

-(NSArray *)getBarsFromResult:(NSArray *)aryBarList
{
    NSMutableArray *aryBars = [@[] mutableCopy];
    if ([aryBars count]>0) {
        [aryBars removeAllObjects];
    }
    
    for (NSDictionary *dict in aryBarList) {
        Bar *bar = [Bar getBarWithDictionary:dict];
        [aryBars addObject:bar];
    }
    return aryBars;
}


@end
