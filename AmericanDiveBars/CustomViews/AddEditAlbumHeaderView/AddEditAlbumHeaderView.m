//
//  AddEditAlbumHeaderView.m
//  AmericanDiveBars
//
//  Created by spaculus on 10/7/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import "AddEditAlbumHeaderView.h"

@interface AddEditAlbumHeaderView ()
{
    NSString *imageTitle;
}
@end

@implementation AddEditAlbumHeaderView


- (IBAction)btnAddImage_Clicked:(id)sender {
    if ([[self delegate] respondsToSelector:@selector(openImageSelector)]) {
        [[self delegate] openImageSelector];
    }
}

-(void)configureAddEditAlbumView:(NSString *)placeHolderText {
    imageTitle = @"";
    self.txtAlbumTitle.placeholder = placeHolderText;
    [self.txtAlbumTitle setValue:[UIColor colorWithRed:121.0/255.0 green:121.0/255.0 blue:121.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtAlbumTitle forCornerRadius:2.0 forBorderWidth:0.8 withPadding:10 andColor:[[UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:53.0/255.0 alpha:1.0] CGColor]];
    
    self.btnAddImage.layer.borderColor = [[UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:53.0/255.0 alpha:1.0] CGColor];
    self.btnAddImage.layer.borderWidth = 1.0f;
    
}

#pragma mark - TEXT FIELD DELEGATES

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    imageTitle = textField.text;
    if ([[self delegate] respondsToSelector:@selector(didSelectImageTitle:)]) {
        [[self delegate] didSelectImageTitle:imageTitle];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


@end
