//
//  CommonUtils.h
//  AmericanDiveBars
//
//  Created by spaculus on 8/27/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "TTTAttributedLabel.h"

@interface CommonUtils : NSObject

#pragma mark - DEVICE TYPES
+(BOOL)isiPad;
+(BOOL)isIPhone4;
+(BOOL)isIPhone5;
+(BOOL)isIPhone6;
+(BOOL)isIPhone6Plus;
+(BOOL)isIPhone4_Landscape;
+(BOOL)isIPhone5_Landscape;
+(BOOL)isIPhone6_Landscape;
+(BOOL)isIPhone6Plus_Landscape;

#pragma mark Device Screens
+(CGSize)screenSize;
+(BOOL)isLandscapeOrientation;

#pragma mark - Check Network
+(BOOL)connected;

#pragma mark - DOC Folder
+(NSArray *)getPathsOnDocumentDirectories;
+(NSString *)getDocumentDirectoryPathForFileName:(NSString *)fileName;
+(void)downloadData:(NSData *)data atPath:(NSString *)filePath;
+(NSData *)getDataFromPath:(NSString *)filePath;
+(BOOL)fileExistAtPath:(NSString *)filePath;
+(void)removeFileFromDocumentDir:(NSString *)fileName;

#pragma mark - GPS
+(NSString *)milesfromPlace:(double)fromLat fromLongitude:(double)fromLong toLatitude:(double)toLat toLongitude:(double)toLong;
+(NSMutableArray*)getLatLongfromAddress:(NSString *)addressText;

#pragma mark - String
+(BOOL)validateAlphabets:(NSString *)string;
+(NSString *)getNotNullString:(NSString *)string;
+(NSString*)suffixNumber:(NSNumber*)number; // To display short numbers like 1K, 2K,10 M
+(NSString *)removeLeadingTrailingWhiteSpace:(NSString *)string; // To Remove White Space
+(NSString *)convertToUTF8:(NSString *)string;
+(NSString *)convertToUnicode:(NSString *)string;
+(NSString *)explodeString:(NSString*)stringToBeExploded WithDelimiter:(NSString*)delimiter andCOmponent:(NSUInteger)rowNum;
+(NSString *)removeHTMLFromString:(NSString *)str;

#pragma mark JSON String
+(NSString *)getJSONStringFromDict:(NSDictionary *)dict;

#pragma mark BASE 64 STRINGs
+(NSString *)getBase64StringFrom:(NSString *)decodeString; //Convert to base 64 string from a normal string
+(NSString *)encodeToBase64String:(UIImage *)image;

#pragma mark - Validation
+(BOOL)validateUrl:(NSString *)candidate;
+(BOOL)IsValidEmail:(NSString *)checkString;
+(BOOL)validateName:(NSString *)text;
+(BOOL)validateUserName:(NSString *)string;
+(BOOL)validatePassword:(NSString *)text;

#pragma mark - USER Basic Details
+(User *)getUserLoginDetails;
+(BOOL)isLoggedIn;
+(void)redirectToLoginScreenWithTarget:(UIViewController *)target;

#pragma mark - DATE
+(NSDate *)getDateFromString:(NSString *)strDate withFormat:(NSString *)format;
+(id)getDateFormattedFromDate:(NSDate *)dt withInputFormat:(NSString *)inputFormat andOutputFormat:(NSString *)outputFormat isString:(BOOL)isString isSameFormat:(BOOL)sameFormat;
+(id)getDateFormattedFromStringDate:(NSString *)strDate withInputFormat:(NSString *)inputFormat andOutputFormat:(NSString *)outputFormat isString:(BOOL)isString;
+(NSString *)getFormattedTime:(NSString *)strTime withInputFormat:(NSString *)inputFormat andOutputFormat:(NSString *)outputFormat;
+(BOOL)checkDate:(NSDate *)date1 andDate:(NSDate *)date2;
+(NSString *)isPastDate:(NSString *)dateString; // Gives Result between two date comparision

#pragma mark - SET LABEL UTILITIES
+(UILabel *)setTitleLabel:(NSString *)title;
+(void)findUsernameAndHashTag:(TTTAttributedLabel *)lbl withColor:(UIColor *)color atRange:(NSRange)range;
+(TTTAttributedLabel *)changeTextStyleMethod:(TTTAttributedLabel *)attLabel setText:(NSString *)text textRange:(NSString *)range fontName:(NSString *)font fontSize:(NSInteger)size; // For changing TTTAttributedLabel Text Style with Size
+(void)setBorderAndCorner_ForLabel:(UILabel *)lbl forCornerRadius:(CGFloat)r forBorderWidth:(CGFloat)w;

#pragma mark - SET TEXTFIELDS / Text View
+(void)setLeftPadding:(int)paddingValue andTextField:(UITextField *)textField;
+(void)setBorderAndCorner_ForTextField:(UITextField *)txtField forCornerRadius:(CGFloat)r forBorderWidth:(CGFloat)w withPadding:(int)p andColor:(CGColorRef)color;
+(void)setLeftImageToTextField:(UITextField *)txtField andImage:(NSString *)imgName andImgWidth:(CGFloat)width andImgHeight:(CGFloat)height withPadding:(CGFloat)padding;
+(void)setRightImageToTextField:(UITextField *)txtField withImage:(NSString *)image withPadding:(CGFloat)padding withWidth:(CGFloat)width withHeight:(CGFloat)height forSelector:(SEL)openKeyBoard forTarget:(id)target;
+(void)setRightImageLabelToTextField:(UITextField *)txtField withImage:(NSString *)image withPadding:(CGFloat)padding withWidth:(CGFloat)width withHeight:(CGFloat)height forSelector:(SEL)openKeyBoard forTarget:(id)target forText:(NSString *)lblTitle;

+(BOOL)checkLink:(NSString *)link; // Detect Lisnk from Textfield/ textview after giveng space or return key.
+(void)setColorToAttributedPlaceholderToTextField:(UITextField *)textField andPlaceholderString:(NSString *)string andColor:(CGColorRef)color;

#pragma mark - NAVIGATION BARS
+(UIBarButtonItem*)barItemWithImage:(UIImage*)image highlightedImage:(UIImage*)highlightedImage xOffset:(NSInteger)xOffset target:(id)target action:(SEL)action;
+(void)setNavigationBarImage:(UIImage *)image forNavigationBar:(UINavigationBar *)navBar;

#pragma mark - TABLE VIEW
+(void)setLineSeperatorForTableView;

#pragma mark - ALERT VIEW
+(void)alertViewDelegateWithTitle:(NSString *)title withMessage:(NSString *)message andTarget:(id)target forCancelString:(NSString *)cancelString forOtherButtonString:(NSString *)otherString withTag:(NSInteger)tag;

#pragma mark - Button
+(void)setBorderAndCorner_ForButton:(UIButton *)button forCornerRadius:(CGFloat)r forBorderWidth:(CGFloat)w withColor:(CGColorRef)color;

#pragma mark - Image
+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius;

#pragma mark - Others
+(NSString *)FormatePhoneNumber:(NSString *)text;
+(NSMutableString *)filteredPhoneStringFromStringWithFilter:(NSString *)string andFilter:(NSString *)filter;

#pragma mark YouTube Video Detector
+(NSString *)YoutubeEmbededDetectType:(NSString *)wallPostString;
+(BOOL)YoutubeDetectType:(NSString *)youtubeURL;

#pragma mark - Get Array Count
+(NSInteger)getArrayCountFromArray:(NSArray *)ary;

#pragma mark - Call Webservice
+(void)callWebservice:(SEL)webservice forTarget:(id)target;
@end
