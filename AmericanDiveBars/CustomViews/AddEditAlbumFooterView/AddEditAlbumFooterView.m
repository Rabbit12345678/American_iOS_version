//
//  AddEditAlbumFooterView.m
//  AmericanDiveBars
//
//  Created by spaculus on 10/8/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import "AddEditAlbumFooterView.h"

@implementation AddEditAlbumFooterView

- (IBAction)btnCreateAlbum_Clicked:(id)sender {
    if ([[self delegate] respondsToSelector:@selector(createAlbum)]) {
        [[self delegate] createAlbum];
    }
}

- (IBAction)btnCancel_Clicked:(id)sender {
    if ([[self delegate] respondsToSelector:@selector(cancelToCreateAlbum)]) {
        [[self delegate] cancelToCreateAlbum];
    }
}

-(void)configureAddEditAlbumFooterView {
    [self.txtStatus setValue:[UIColor colorWithRed:121.0/255.0 green:121.0/255.0 blue:121.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];

    [CommonUtils setBorderAndCorner_ForTextField:self.txtStatus forCornerRadius:2.0 forBorderWidth:0.8 withPadding:10 andColor:[[UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:53.0/255.0 alpha:1.0] CGColor]];
    [CommonUtils setRightImageToTextField:self.txtStatus withImage:@"drop-down-icon.png" withPadding:35 withWidth:25 withHeight:25 forSelector:@selector(dropDownTapped) forTarget:self];
}

-(void)dropDownTapped {
    if ([[self delegate] respondsToSelector:@selector(didOpenStatusOption)]) {
        [[self delegate] didOpenStatusOption];
    }
}

#pragma mark - TEXT FIELD DELEGATES
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self dropDownTapped];
    return NO;
}


@end
