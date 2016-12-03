//
//  DirectoryHeaderView.m
//  AmericanDiveBars
//
//  Created by spaculus on 9/11/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "DirectoryHeaderView.h"

@interface DirectoryHeaderView ()
{
    NSString *searchText;
}
@end

@implementation DirectoryHeaderView

-(void)configureBeerHeaderView:(NSString *)placeHolderText {
    searchText = @"";
    self.viewSorting.layer.borderColor = [[UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:53.0/255.0 alpha:1.0] CGColor];
    self.viewSorting.layer.borderWidth = 1.0f;
    self.txtSearchByName.placeholder = placeHolderText;
    [self.txtSearchByName setValue:[UIColor colorWithRed:121.0/255.0 green:121.0/255.0 blue:121.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtSearchByName forCornerRadius:2.0 forBorderWidth:0.8 withPadding:10 andColor:[[UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:53.0/255.0 alpha:1.0] CGColor]];

    self.btnA_Z.layer.borderColor = [[UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:53.0/255.0 alpha:1.0] CGColor];
    self.btnA_Z.layer.borderWidth = 1.0f;
    
    [CommonUtils setRightImageToTextField:self.txtSearchByName withImage:@"search-by-name.png" withPadding:35 withWidth:25 withHeight:25 forSelector:@selector(searchTapped) forTarget:self];
}

-(void)setSearchTextfieldClear {
    searchText = @"";
    self.lblSearchTitle.text = @"";
    self.txtSearchByName.text = @"";
}

- (IBAction)viiewSorting_Clicked:(id)sender {
    NSLog(@"View Sorting Tapped");
    if ([[self delegate] respondsToSelector:@selector(setSortingType)]) {
        [[self delegate] setSortingType];
    }
}

- (IBAction)btnAZ_Clicked:(id)sender {
    UIButton *btnA_Z = (UIButton *)sender;
    btnA_Z.selected = !btnA_Z.selected;
    BOOL isA_Z_Open;
    if (btnA_Z.selected) {
        isA_Z_Open = YES;
    }
    else {
        isA_Z_Open = NO;
    }
    if ([[self delegate] respondsToSelector:@selector(didShowAlphabetSearchView:)]) {
        [[self delegate] didShowAlphabetSearchView:isA_Z_Open];
    }
}

-(void)searchTapped {
    [self.txtSearchByName resignFirstResponder];
    if ([[self delegate] respondsToSelector:@selector(didSearchTapped:)]) {
        [[self delegate] didSearchTapped:searchText];
    }
}


#pragma mark - TEXT FIELD DELEGATES 

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    searchText = textField.text;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self searchTapped];
    return YES;
}

@end
