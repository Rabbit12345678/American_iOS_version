//
//  BarHeaderView.m
//  AmericanDiveBars
//
//  Created by spaculus on 9/3/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "BarHeaderView.h"

@interface BarHeaderView ()


@end

@implementation BarHeaderView

- (IBAction)viiewSorting_Clicked:(id)sender {
    NSLog(@"View Sorting Tapped");
    if ([[self delegate] respondsToSelector:@selector(setSortingType)]) {
        [[self delegate] setSortingType];
    }
}

-(void)configureBarHeaderView {
    self.viewSorting.layer.borderColor = [[UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:53.0/255.0 alpha:1.0] CGColor];
    self.viewSorting.layer.borderWidth = 1.0f;
}

@end
