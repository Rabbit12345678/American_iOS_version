//
//  AddEditAlbumCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 10/7/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import "AddEditAlbumCell.h"

@implementation AddEditAlbumCell

- (void)awakeFromNib {
    // Initialization code
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
- (IBAction)imgTapped:(id)sender {
    [self.txtImageTitle resignFirstResponder];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.txtImageTitle tag] inSection:0];
    if ([[self delegate] respondsToSelector:@selector(openImagePickerControllerFromSelectedIndexPath:)]) {
        [[self delegate] openImagePickerControllerFromSelectedIndexPath:indexPath];
    }
}

-(void)deleteTapped {
    [self.txtImageTitle resignFirstResponder];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.txtImageTitle tag] inSection:0];
    if ([[self delegate] respondsToSelector:@selector(btnDeleteTappedForIndexPath:)]) {
        [[self delegate] btnDeleteTappedForIndexPath:indexPath];
    }
}

-(void)configureCellUI {
    [self.txtImageTitle setValue:[UIColor colorWithRed:121.0/255.0 green:121.0/255.0 blue:121.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    
    [CommonUtils setBorderAndCorner_ForTextField:self.txtImageTitle forCornerRadius:2.0 forBorderWidth:0.8 withPadding:10 andColor:[[UIColor colorWithRed:59.0/255.0 green:58.0/255.0 blue:53.0/255.0 alpha:1.0] CGColor]];
    [CommonUtils setRightImageToTextField:self.txtImageTitle withImage:@"delete-image.png" withPadding:30 withWidth:25 withHeight:25 forSelector:@selector(deleteTapped) forTarget:self];

}



@end
