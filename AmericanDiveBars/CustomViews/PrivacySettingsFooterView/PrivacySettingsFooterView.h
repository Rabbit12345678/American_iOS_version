//
//  PrivacySettingsFooterView.h
//  AmericanDiveBars
//
//  Created by spaculus on 10/13/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PrivacySettingsFooterViewDelegate <NSObject>

-(void)btnSaveTapped;
-(void)btnCancelTapped;

@end

@interface PrivacySettingsFooterView : UIView

@property (strong, nonatomic) id <PrivacySettingsFooterViewDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIButton *btnSave;
@property (strong, nonatomic) IBOutlet UIButton *btnCancel;

- (IBAction)btnSave_Clicked:(id)sender;
- (IBAction)btnCancel_Clicked:(id)sender;

@end
