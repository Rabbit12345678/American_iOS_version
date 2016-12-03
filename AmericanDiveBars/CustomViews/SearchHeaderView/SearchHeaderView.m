//
//  SearchHeaderView.m
//  AmericanDiveBars
//
//  Created by spaculus on 9/2/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "SearchHeaderView.h"


@implementation SearchHeaderView

- (IBAction)btnCancel_Clicked:(id)sender {
    if ([[self delegate] respondsToSelector:@selector(cancelSearchView)]) {
        [[self delegate] cancelSearchView];
    }
}

-(void)configureTextField {
    self.searchText = @"";
    self.txtSearch.text = @"";
    [self.txtSearch setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [CommonUtils setBorderAndCorner_ForTextField:self.txtSearch forCornerRadius:0.0 forBorderWidth:0.0 withPadding:10 andColor:nil];
}

- (IBAction)btnDoneForSearch:(id)sender {
    if ([[self delegate] respondsToSelector:@selector(dismissSearchView)]) {
        [[self delegate] dismissSearchView];
    }
}



@end
