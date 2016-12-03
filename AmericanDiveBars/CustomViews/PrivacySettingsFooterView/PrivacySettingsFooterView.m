//
//  PrivacySettingsFooterView.m
//  AmericanDiveBars
//
//  Created by spaculus on 10/13/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import "PrivacySettingsFooterView.h"

@implementation PrivacySettingsFooterView

- (IBAction)btnSave_Clicked:(id)sender {
    if ([[self delegate] respondsToSelector:@selector(btnSaveTapped)]) {
        [[self delegate] btnSaveTapped];
    }
}

- (IBAction)btnCancel_Clicked:(id)sender {
    if ([[self delegate] respondsToSelector:@selector(btnCancelTapped)]) {
        [[self delegate] btnCancelTapped];
    }
}
@end
