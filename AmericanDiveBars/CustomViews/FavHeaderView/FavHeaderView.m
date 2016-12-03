//
//  FavHeaderView.m
//  AmericanDiveBars
//
//  Created by spaculus on 10/5/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import "FavHeaderView.h"

@interface FavHeaderView ()
{
    NSString *searchText;
}
@end

@implementation FavHeaderView


- (IBAction)btnReset_Clicked:(id)sender {
    if ([[self delegate] respondsToSelector:@selector(resetButtonTapped)]) {
        [[self delegate] resetButtonTapped];
    }
}

- (IBAction)btnSelectAll_Clicked:(id)sender {
    if ([[self delegate] respondsToSelector:@selector(selectAllTapped:)]) {
        [[self delegate] selectAllTapped:self.btnSelectAll];
    }
}

- (IBAction)btnDelete_Clicked:(id)sender {
    if ([[self delegate] respondsToSelector:@selector(deleteTapped)]) {
        [[self delegate] deleteTapped];
    }
}

-(void)configureFavHeaderView:(NSString *)placeHolderText {
    searchText = @"";
    self.txtSearch.placeholder = placeHolderText;
    [self.txtSearch setValue:[UIColor colorWithRed:121.0/255.0 green:121.0/255.0 blue:121.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtSearch forCornerRadius:2.0 forBorderWidth:0.8 withPadding:10 andColor:[[UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:53.0/255.0 alpha:1.0] CGColor]];
    
    self.btnReset.layer.borderColor = [[UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:53.0/255.0 alpha:1.0] CGColor];
    self.btnReset.layer.borderWidth = 1.0f;
    
    [CommonUtils setRightImageToTextField:self.txtSearch withImage:@"search-by-name.png" withPadding:35 withWidth:25 withHeight:25 forSelector:@selector(searchTapped) forTarget:self];
}


-(void)searchTapped {
    [self.txtSearch resignFirstResponder];
    if ([[self delegate] respondsToSelector:@selector(searchFavByName:)]) {
        [[self delegate] searchFavByName:searchText];
    }
}


#pragma mark - TEXT FIELD DELEGATES

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    searchText = textField.text;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


@end
