//
//  CommonUtils.m
//  AmericanDiveBars
//
//  Created by spaculus on 8/27/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "CommonUtils.h"

@implementation CommonUtils

#pragma mark - DEVICE TYPES
+(BOOL)isiPad
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
+(BOOL)isIPhone4
{
    if ([[UIScreen mainScreen] bounds].size.height<568) {
        return YES;
    }else
    {
        return NO;
    }
}
+(BOOL)isIPhone5
{
    
    if ([[UIScreen mainScreen] bounds].size.height==568) {
        return YES;
    }else
    {
        return NO;
    }
    
}
+(BOOL)isIPhone6
{
    
    if ([[UIScreen mainScreen] bounds].size.height==667) {
        return YES;
    }else
    {
        return NO;
    }
    
}
+(BOOL)isIPhone6Plus
{
    
    if ([[UIScreen mainScreen] bounds].size.height>667) {
        return YES;
    }else
    {
        return NO;
    }
    
}


+(BOOL)isIPhone4_Landscape
{
    if ([[UIScreen mainScreen] bounds].size.width<568) {
        return YES;
    }else
    {
        return NO;
    }
}
+(BOOL)isIPhone5_Landscape
{
    
    if ([[UIScreen mainScreen] bounds].size.width==568) {
        return YES;
    }else
    {
        return NO;
    }
    
}
+(BOOL)isIPhone6_Landscape
{
    
    if ([[UIScreen mainScreen] bounds].size.width==667) {
        return YES;
    }else
    {
        return NO;
    }
    
}
+(BOOL)isIPhone6Plus_Landscape
{
    
    if ([[UIScreen mainScreen] bounds].size.width>667) {
        return YES;
    }else
    {
        return NO;
    }
    
}


#pragma mark Device Screens
+(CGSize)screenSize
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation))
    {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    else
    {
        return screenSize;
    }
}

+(BOOL)isLandscapeOrientation {
    return UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
}

#pragma mark - Check Network
+(BOOL)connected
{
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return !(networkStatus == NotReachable);
}

#pragma mark - DOC Folder
+(NSString *)getDocumentDirectoryPathForFileName:(NSString *)fileName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    return filePath;
}


+(BOOL)fileExistAtPath:(NSString *)filePath
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return YES;
    }else
    {
        return NO;
    }
}

+(void)downloadData:(NSData *)data atPath:(NSString *)filePath
{
    [data writeToFile:filePath atomically:NO];
}

+(NSData *)getDataFromPath:(NSString *)filePath
{
    NSURL *url = [NSURL fileURLWithPath:filePath];//fullPath
    NSData *data = [NSData dataWithContentsOfURL:url];
    return data;
}

+(NSArray *)getPathsOnDocumentDirectories
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return paths;
}

+(void)removeFileFromDocumentDir:(NSString *)fileName
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    NSError *error;
    BOOL success = [fileManager removeItemAtPath:filePath error:&error];
    if (success)
    {
        NSLog(@"Deleted file successfully");
    }
    else
    {
        NSLog(@"Could not delete file -:%@ ",[error localizedDescription]);
    }
}

#pragma mark - GPS
+(NSString *)milesfromPlace:(double)fromLat fromLongitude:(double)fromLong toLatitude:(double)toLat toLongitude:(double)toLong
{
    CLLocation *userloc = [[CLLocation alloc]initWithLatitude:fromLat longitude:fromLong];
    CLLocation *dest = [[CLLocation alloc]initWithLatitude:toLat longitude:toLong];
    CLLocationDistance dist = [userloc distanceFromLocation:dest]/1609.34;
    
    return [NSString stringWithFormat:@"%.2f miles",dist];
}

+(NSMutableArray *)getLatLongfromAddress:(NSString *)addressText
{
    NSString *stringAdress = [addressText stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString *esc_addr =  [stringAdress stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *req = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@", esc_addr];
    NSString *result = [NSString stringWithContentsOfURL:[NSURL URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
    
    NSMutableDictionary *data = [NSJSONSerialization JSONObjectWithData:[result dataUsingEncoding:NSUTF8StringEncoding]options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray *dataArray = (NSMutableArray *)[data valueForKey:@"results" ];
    
    if (dataArray.count == 0)
    {
        ShowAlert(AlertTitle, @"Please Enter a valid address");
    }
    else
    {
        for (id firstTime in dataArray)
        {
            NSString *jsonStr1 = [firstTime valueForKey:@"geometry"];
            NSMutableArray *Location = [jsonStr1 valueForKey:@"location"];
            NSString *latitude = [Location  valueForKey:@"lat"];
            NSLog(@"Data Return=%@",latitude);
            return Location;
        }
    }
    return nil;
}

#pragma mark - String
+(BOOL) validateAlphabets:(NSString *)string
{
    NSString *abnRegex = @"[A-Za-z]+(\\s[A-Za-z]+)?";
    NSPredicate *abnTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", abnRegex];
    BOOL isValid = [abnTest evaluateWithObject:string];
    return isValid;
}

+(NSString *)getNotNullString:(id)string
{
    NSString *sourceStr = @"";
    
    if ([string isKindOfClass:[NSNumber class]]) {
        sourceStr = [string stringValue];
    }
    else {
        sourceStr = [NSString stringWithFormat:@"%@",(NSString *)string];
    }
    
    if ([sourceStr isEqualToString:@"(null)"]) {
        sourceStr = @"";
    }
    if ([sourceStr isEqualToString:@"<null>"]) {
        sourceStr = @"";
        
    }
    if ([sourceStr isEqualToString:@"<nil>"]) {
        sourceStr = @"";
    }
    if ([sourceStr isKindOfClass:[NSNull class]]) {
        sourceStr = @"";
    }
    if (sourceStr.length == 0) {
        sourceStr = @"";
    }
    if (sourceStr == nil) {
        sourceStr = @"";
    }
    
    return sourceStr;
}

+(NSString *)suffixNumber:(NSNumber*)number 
{
    if (!number)
        return @"";
    
    long long num = [number longLongValue];
    
    int s = ( (num < 0) ? -1 : (num > 0) ? 1 : 0 );
    NSString* sign = (s == -1 ? @"-" : @"" );
    
    num = llabs(num);
    
    if (num < 1000)
        return [NSString stringWithFormat:@"%@%lld",sign,num];
    
    int exp = (int) (log(num) / log(1000));
    
    NSArray* units = @[@"K",@"M",@"G",@"T",@"P",@"E"];
    
    return [NSString stringWithFormat:@"%@%.1f%@",sign, (num / pow(1000, exp)), [units objectAtIndex:(exp-1)]];
}

+(NSString *)removeLeadingTrailingWhiteSpace:(NSString *)string
{
    NSString *rawString = string;
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [rawString stringByTrimmingCharactersInSet:whitespace];
    return trimmed;
}

+(NSString *)convertToUTF8:(NSString *)string
{
    NSArray* words = [string componentsSeparatedByCharactersInSet :[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString* nospacestring = [words componentsJoinedByString:@" "];
    NSData *data = [nospacestring dataUsingEncoding:NSUTF8StringEncoding];
    NSString *goodValue = [[NSString alloc] initWithData:data encoding:NSNonLossyASCIIStringEncoding];
    return goodValue;
}

+(NSString *)convertToUnicode:(NSString *)string
{
    NSData *dataenc = [string dataUsingEncoding:NSNonLossyASCIIStringEncoding];
    NSString *encodevalue = [[NSString alloc]initWithData:dataenc encoding:NSUTF8StringEncoding];
    return encodevalue;
}

+(NSString *)explodeString:(NSString*)stringToBeExploded WithDelimiter:(NSString*)delimiter andCOmponent:(NSUInteger)rowNum
{
    return [stringToBeExploded componentsSeparatedByString: delimiter][rowNum];
}

+(NSString *)removeHTMLFromString:(NSString *)str
{
    NSAttributedString *attr = [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                                                                          NSCharacterEncodingDocumentAttribute:@(NSUTF8StringEncoding)}
                                                     documentAttributes:nil
                                                                  error:nil];
    return [attr string];
}
#pragma mark JSON String
+(NSString *)getJSONStringFromDict:(NSDictionary *)dict
{
    NSError *jsonParsingError = nil;
    NSData *jsonData2 = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&jsonParsingError];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData2 encoding:NSUTF8StringEncoding];
    NSLog(@"jsonData as string:\n%@", jsonString);
    return jsonString;
}

#pragma mark BASE 64 STRINGs
+(NSString *)getBase64StringFrom:(NSString *)decodeString
{
    NSData *encodeData = [decodeString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [encodeData base64EncodedStringWithOptions:0];
    NSLog(@"Encode String: %@", base64String);
    return base64String;
}

+(NSString *)encodeToBase64String:(UIImage *)image
{
    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

#pragma mark - Validation
+ (BOOL)validateUrl:(NSString *)candidate
{
    NSString *urlRegEx =
    @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:candidate];
}

+(BOOL)IsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

+(BOOL) validateName:(NSString *)text
{
    NSString *Regex = @"^[a-zA-Z\\s]+";
    NSPredicate *TestResult = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [TestResult evaluateWithObject:text];
}

+(BOOL)validateUserName:(NSString *)string
{
    NSString *trimmedString = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    //((?:^|\\s)(?:@){1}[0-9a-zA-Z_]{1,21})
    //^[a-z0-9_-]{6,20}$
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[a-z0-9_-]{3,20}$" options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSAssert(regex, @"Unable to create regular expression");
    
    NSRange textRange = NSMakeRange(0, trimmedString.length);
    NSRange matchRange = [regex rangeOfFirstMatchInString:trimmedString options:NSMatchingReportProgress range:textRange];
    
    BOOL didValidate = NO;
    
    // Did we find a matching range
    if (matchRange.location != NSNotFound)
        didValidate = YES;
    
    return didValidate;
}

+(BOOL)validatePassword:(NSString *)text
{
    NSString *Regex = @"^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$";
    NSPredicate *TestResult = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [TestResult evaluateWithObject:text];
}

#pragma mark - GET USER DETAILS
+(User *)getUserLoginDetails
{
    NSString *user_id = [CommonUtils getNotNullString:[[NSUserDefaults standardUserDefaults] objectForKey:@"user_id"]];
    NSString *device_id = [CommonUtils getNotNullString:[[NSUserDefaults standardUserDefaults] objectForKey:@"device_id"]];
    NSString *unique_code = [CommonUtils getNotNullString:[[NSUserDefaults standardUserDefaults] objectForKey:@"unique_code"]];
    NSString *user_name = [CommonUtils getNotNullString:[[NSUserDefaults standardUserDefaults] objectForKey:@"user_name"]];
    NSString *user_image = [CommonUtils getNotNullString:[[NSUserDefaults standardUserDefaults] objectForKey:@"user_image"]];
    NSString *user_email = [CommonUtils getNotNullString:[[NSUserDefaults standardUserDefaults] objectForKey:@"storedEmail"]];
    
    
    User *user = [[User alloc] init];
    
    user.user_id = user_id;
    user.device_id = device_id;
    user.unique_code = unique_code;
    user.user_name = user_name;
    user.user_email = user_email;
    user.user_image = user_image;
    
    return user;
    /*
     if ((NSNull *)userId==[NSNull null]) {
     userId = @"0";
     }else if (userId == nil)
     {
     userId = @"0";
     }
     */
}

+(BOOL)isLoggedIn {
    NSString *isLogin = [[NSUserDefaults standardUserDefaults] valueForKey:@"LoggedIn"];
    
    if ([isLogin isEqualToString:@"0"]) {
        return NO;
    }
    else {
        return YES;
    }
}

+(void)redirectToLoginScreenWithTarget:(UIViewController *)target {
    LoginViewController *login = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    login.isLoginFromMenu = NO;
    [target.navigationController pushViewController:login animated:YES];
}

#pragma mark - DATE UTILITIES

+(NSDate *)getDateFromString:(NSString *)strDate withFormat:(NSString *)format
{
    NSDate *date = [[NSDate alloc] init];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:format];
    date = [df dateFromString:strDate];
    return date;
}

+(id)getDateFormattedFromDate:(NSDate *)dt withInputFormat:(NSString *)inputFormat andOutputFormat:(NSString *)outputFormat isString:(BOOL)isString isSameFormat:(BOOL)sameFormat
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:inputFormat];
    NSString *strDate = [dateFormat stringFromDate:dt];
    [dateFormat setDateFormat:outputFormat];
    NSDate *dte = [dateFormat dateFromString:strDate];
    if (isString)
    {
        if (sameFormat) {
            return strDate;
        }
        else {
            NSString *strFormattedDate = [dateFormat stringFromDate:dte];
            return strFormattedDate;
        }
        
    }
    else
    {
        if (sameFormat) {
            NSString *strFormattedDate = [dateFormat stringFromDate:dte];
            NSDate *formattedDate = [dateFormat dateFromString:strFormattedDate];
            return formattedDate;

        }
        else {
            NSString *strFormattedDate = [dateFormat stringFromDate:dte];
            NSDate *formattedDate = [dateFormat dateFromString:strFormattedDate];
            return formattedDate;

        }
    }
}

+(id)getDateFormattedFromStringDate:(NSString *)strDate withInputFormat:(NSString *)inputFormat andOutputFormat:(NSString *)outputFormat isString:(BOOL)isString
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:inputFormat];
    NSDate *dte = [dateFormat dateFromString:strDate];
    [dateFormat setDateFormat:outputFormat];
    if (isString)
    {
        NSString *strFormattedDate = [dateFormat stringFromDate:dte];
        return strFormattedDate;
    }
    else
    {
        NSString *strFormattedDate = [dateFormat stringFromDate:dte];
        NSDate *formattedDate = [dateFormat dateFromString:strFormattedDate];
        return formattedDate;
    }
}

+(NSString *)getFormattedTime:(NSString *)strTime withInputFormat:(NSString *)inputFormat andOutputFormat:(NSString *)outputFormat
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [dateFormat setLocale:locale];
    [dateFormat setDateFormat:inputFormat];
    NSDate *dte = [dateFormat dateFromString:strTime];
    [dateFormat setDateFormat:outputFormat];
    NSString *strFormattedDate = [dateFormat stringFromDate:dte];
    return strFormattedDate;
}

+(BOOL)checkDate:(NSDate *)date1 andDate:(NSDate *)date2
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    
    if ([[dateFormat stringFromDate:date1] isEqualToString:[dateFormat stringFromDate:date2]])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+(NSString *)isPastDate:(NSString *)dateString
{
    NSDateFormatter *df= [[NSDateFormatter alloc] init];
    [df setDateFormat:@"MM/dd/yyyy"];
    NSString *currentDate = [df stringFromDate:[NSDate date]];
    NSDate *dt1 = [[NSDate alloc] init];
    NSDate *dt2 = [[NSDate alloc] init];
    dt1 = [df dateFromString:currentDate];
    dt2 = [df dateFromString:dateString];
    NSComparisonResult result = [dt1 compare:dt2];
    NSString *dateValue;
    
    switch (result)
    {
        case NSOrderedAscending:
        {
            NSLog(@"%@ is greater than %@", dt2, dt1);
            dateValue = @"After";
            break;
        }
        case NSOrderedDescending:
        {
            NSLog(@"%@ is less %@", dt2, dt1);
            dateValue = @"Before";
            break;
        }
        case NSOrderedSame:
        {
            NSLog(@"%@ is equal to %@", dt2, dt1);
            dateValue = @"Equal";
            break;
        }
        default:
        {
            NSLog(@"erorr dates %@, %@", dt2, dt1);
            break;
        }
    }
    return dateValue;
}

#pragma mark - SET LABEL UTILITIES
+(UILabel *)setTitleLabel:(NSString *)title
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLabel.text = title;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont fontWithName:@"Verdana-Bold" size:17.0];
    titleLabel.textColor = [UIColor whiteColor];
    [titleLabel sizeToFit];
    return titleLabel;
}

+(void)findUsernameAndHashTag:(TTTAttributedLabel *)lbl withColor:(UIColor *)color atRange:(NSRange)range
{
    NSRegularExpression *mentionExpression = [NSRegularExpression regularExpressionWithPattern:@"(?:^|\\s)(#\\w+|@\\w+)" options:NO error:nil];
    NSArray *matches = [mentionExpression matchesInString:lbl.text
                                                  options:0
                                                    range:range];
    for (NSTextCheckingResult *match in matches)
    {
        NSArray *keys = [[NSArray alloc] initWithObjects:(id)kCTForegroundColorAttributeName,(id)kCTUnderlineStyleAttributeName, nil];
        NSArray *objects = [[NSArray alloc] initWithObjects:color,[NSNumber numberWithInt:kCTUnderlineStyleNone], nil];
        NSDictionary *linkAttributes = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
        [lbl addLinkWithTextCheckingResult:match attributes:linkAttributes];
    }
}

+(TTTAttributedLabel *)changeTextStyleMethod:(TTTAttributedLabel *)attLabel setText:(NSString *)text textRange:(NSString *)range fontName:(NSString *)font fontSize:(NSInteger)size
{
    // For changing TTTAttributedLabel Text Style with Size
    
    [attLabel setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^(NSMutableAttributedString *mutableAttributedString) {
        
        //font helvetica with bold and italic
        UIFont *boldSystemFont = [UIFont fontWithName:@"Helvetica-BoldOblique" size:size];
        
        //UIFont *boldSystemFont = [UIFont italicSystemFontOfSize:size];
        
        CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
        
        NSRange boldRange = [[mutableAttributedString string] rangeOfString:range options:NSCaseInsensitiveSearch];
        
        [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:boldRange];
        
        [mutableAttributedString addAttribute:(NSString *)kCTForegroundColorAttributeName value:(id)[UIColor colorWithRed:23/255.0 green:57/255.0 blue:97/255.0 alpha:1].CGColor range:boldRange];
        
        CFRelease(font);
        
        return mutableAttributedString;
    }];
    
    return attLabel;
}

+(void)setBorderAndCorner_ForLabel:(UILabel *)lbl forCornerRadius:(CGFloat)r forBorderWidth:(CGFloat)w
{
    lbl.layer.cornerRadius = r;
    lbl.layer.masksToBounds = YES;
    lbl.layer.borderWidth = w;
}

#pragma mark - SET TEXTFIELDS / Text View
+(void)setLeftPadding:(int)paddingValue andTextField:(UITextField *)textField
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, paddingValue, textField.frame.size.height)];
    textField.leftView = paddingView;
    textField.leftViewMode = UITextFieldViewModeAlways;
}

+(void)setBorderAndCorner_ForTextField:(UITextField *)txtField forCornerRadius:(CGFloat)r forBorderWidth:(CGFloat)w withPadding:(int)p andColor:(CGColorRef)color
{
    txtField.layer.cornerRadius = r;
    txtField.layer.borderColor = color;
    txtField.layer.borderWidth = w;
    [CommonUtils setLeftPadding:p andTextField:txtField];
}

+(void)setLeftImageToTextField:(UITextField *)txtField andImage:(NSString *)imgName andImgWidth:(CGFloat)width andImgHeight:(CGFloat)height withPadding:(CGFloat)padding
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, padding, txtField.frame.size.height)];
    UIImageView *disUser = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
    [disUser setFrame:CGRectMake(5, txtField.frame.size.height/2 - disUser.frame.size.height/2, width, height)];
    txtField.leftViewMode = UITextFieldViewModeAlways;
    [disUser setUserInteractionEnabled:YES];
    [paddingView addSubview:disUser];
    txtField.leftView = paddingView;
}

+(void)setRightImageToTextField:(UITextField *)txtField withImage:(NSString *)image withPadding:(CGFloat)padding withWidth:(CGFloat)width withHeight:(CGFloat)height forSelector:(SEL)openKeyBoard forTarget:(id)target
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, padding, txtField.frame.size.height)];
    UIImageView *disUser = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
    [disUser setFrame:CGRectMake(0, txtField.frame.size.height/2 - disUser.frame.size.height/2, width, height)];
    txtField.rightViewMode = UITextFieldViewModeAlways;
    [disUser setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tapDisUser = [[UITapGestureRecognizer alloc] initWithTarget:target action:openKeyBoard];
    tapDisUser.numberOfTapsRequired = 1;
    tapDisUser.numberOfTouchesRequired = 1;
    [disUser addGestureRecognizer:tapDisUser];
    [paddingView addSubview:disUser];
    txtField.rightView = paddingView;
}


+(void)setRightImageLabelToTextField:(UITextField *)txtField withImage:(NSString *)image withPadding:(CGFloat)padding withWidth:(CGFloat)width withHeight:(CGFloat)height forSelector:(SEL)openKeyBoard forTarget:(id)target forText:(NSString *)lblTitle
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, padding, txtField.frame.size.height)];
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(0, 0, width, height);
//    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
//    [btn setTitle:lblTitle forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btn.titleLabel setFont:[UIFont fontWithName:@"Verdana-Bold" size:14.0]];
//    [btn addTarget:target action:openKeyBoard forControlEvents:UIControlEventTouchUpInside];
//    [paddingView addSubview:btn];
    
        
        
        UIImageView *disUser = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
        [disUser setFrame:CGRectMake(0, 0, width, height)];
        txtField.rightViewMode = UITextFieldViewModeAlways;
        [disUser setUserInteractionEnabled:YES];
        [paddingView addSubview:disUser];
    
        UILabel *lbl = [[UILabel alloc] initWithFrame:disUser.frame];
        lbl.backgroundColor = [UIColor clearColor];
        lbl.textColor = [UIColor whiteColor];
        lbl.text = lblTitle;
        [lbl setTextAlignment:NSTextAlignmentCenter];
        lbl.font = [UIFont fontWithName:@"Verdana-Bold" size:14.0];
        [lbl setUserInteractionEnabled:YES];
    
    
        UITapGestureRecognizer *tapDisUser = [[UITapGestureRecognizer alloc] initWithTarget:target action:openKeyBoard];
        tapDisUser.numberOfTapsRequired = 1;
        tapDisUser.numberOfTouchesRequired = 1;
        [lbl addGestureRecognizer:tapDisUser];
    
    [paddingView addSubview:lbl];
    
    txtField.rightView = paddingView;
}

+(BOOL)checkLink:(NSString *)link
{
    NSString *string = link; //coming from server
    NSDataDetector *phoneDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
    NSArray *urlMatches = [phoneDetector matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    for (NSTextCheckingResult *match in urlMatches) {
        
        if ([match resultType] == NSTextCheckingTypeLink) {
            NSString *matchingStringUrl = [match description];
            NSLog(@"found URL: %@", matchingStringUrl);
            return YES;
        }
        else
        {
            return NO;
        }
    }
    return 0;
}

+(void)setColorToAttributedPlaceholderToTextField:(UITextField *)textField andPlaceholderString:(NSString *)string andColor:(CGColorRef)color{
    
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:string
                                                                      attributes:@{NSForegroundColorAttributeName:[UIColor colorWithCGColor:color]}];
    textField.textColor = [UIColor whiteColor];
    [self setLeftPadding:5 andTextField:textField];
    
}

#pragma mark - NAVIGATION BARS
+ (UIBarButtonItem*)barItemWithImage:(UIImage*)image highlightedImage:(UIImage*)highlightedImage xOffset:(NSInteger)xOffset target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, xOffset, 0, -xOffset)];
    }
    
    UIBarButtonItem *customUIBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    return customUIBarButtonItem;
}

+(void)setNavigationBarImage:(UIImage *)image forNavigationBar:(UINavigationBar *)navBar
{
    [navBar setBarTintColor:[UIColor colorWithRed:187.0/255.0 green:124.0/255.0 blue:37.0/255.0 alpha:1.0]];
    [navBar setBackgroundColor:[UIColor colorWithRed:187.0/255.0 green:124.0/255.0 blue:37.0/255.0 alpha:1.0]];
    [navBar setBackgroundImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forBarMetrics:UIBarMetricsDefault];
    [navBar setTintColor:[UIColor whiteColor]];
    
}

#pragma mark - TABLE VIEW
+(void)setLineSeperatorForTableView
{
    // iOS 7:
    [[UITableView appearance] setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [[UITableView appearance] setSeparatorInset:UIEdgeInsetsZero];
    
    [[UITableViewCell appearance] setSeparatorInset:UIEdgeInsetsZero];
    
    // iOS 8:
    if ([UITableView instancesRespondToSelector:@selector(setLayoutMargins:)])
    {
        [[UITableView appearance] setLayoutMargins:UIEdgeInsetsZero];
        [[UITableViewCell appearance] setLayoutMargins:UIEdgeInsetsZero];
        [[UITableViewCell appearance] setPreservesSuperviewLayoutMargins:NO];
    }
}

#pragma mark - ALERT VIEW
+(void)alertViewDelegateWithTitle:(NSString *)title withMessage:(NSString *)message andTarget:(id)target forCancelString:(NSString *)cancelString forOtherButtonString:(NSString *)otherString withTag:(NSInteger)tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:target cancelButtonTitle:cancelString otherButtonTitles:otherString, nil];
    [alertView setTag:tag];
    [alertView show];
}

#pragma mark - Button
+(void)setBorderAndCorner_ForButton:(UIButton *)button forCornerRadius:(CGFloat)r forBorderWidth:(CGFloat)w withColor:(CGColorRef)color
{
    button.layer.cornerRadius = r;
    button.layer.borderColor = color;
    button.layer.borderWidth = w;
}

#pragma mark - Image
+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContext(size);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    // Draw your image
    [image drawInRect:rect];
    
    // Get the image, here setting the UIImageView image
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - Others
+(NSString *)FormatePhoneNumber:(NSString *)text
{
    PhoneNumberFormatter *myPhoneNumberFormatter = [[PhoneNumberFormatter alloc] init];
    NSString *myLocale = @"us";
    text = [myPhoneNumberFormatter format:text withLocale:myLocale];
    return text;
    
}


+(NSMutableString *)filteredPhoneStringFromStringWithFilter:(NSString *)string andFilter:(NSString *)filter
{
    NSUInteger onOriginal = 0, onFilter = 0, onOutput = 0;
    char outputString[([filter length])];
    BOOL done = NO;
    
    while(onFilter < [filter length] && !done)
    {
        char filterChar = [filter characterAtIndex:onFilter];
        char originalChar = onOriginal >= string.length ? '\0' : [string characterAtIndex:onOriginal];
        switch (filterChar) {
            case '#':
                if(originalChar=='\0')
                {
                    // We have no more input numbers for the filter.  We're done.
                    done = YES;
                    break;
                }
                if(isdigit(originalChar))
                {
                    outputString[onOutput] = originalChar;
                    onOriginal++;
                    onFilter++;
                    onOutput++;
                }
                else
                {
                    onOriginal++;
                }
                break;
            default:
                // Any other character will automatically be inserted for the user as they type (spaces, - etc..) or deleted as they delete if there are more numbers to come.
                outputString[onOutput] = filterChar;
                onOutput++;
                onFilter++;
                if(originalChar == filterChar)
                    onOriginal++;
                break;
        }
    }
    outputString[onOutput] = '\0'; // Cap the output string
    return [NSMutableString stringWithUTF8String:outputString];
}


#pragma mark YouTube Video Detector
+(NSString *)YoutubeEmbededDetectType:(NSString *)wallPostString
{
    wallPostString=[wallPostString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (([wallPostString rangeOfString:@"https://m.youtu.be"].location == NSNotFound) && ([wallPostString rangeOfString:@"https://youtu.be"].location == NSNotFound) && ([wallPostString rangeOfString:@"https://www.youtube.com/embed"].location == NSNotFound) && ([wallPostString rangeOfString:@"http://m.youtu.be"].location == NSNotFound) && ([wallPostString rangeOfString:@"http://youtu.be"].location == NSNotFound) && ([wallPostString rangeOfString:@"http://www.youtube.com/embed"].location == NSNotFound))
    {
        
        wallPostString=@"";
    }
    else
    {
        if (([wallPostString rangeOfString:@"https://m.youtu.be"].location == NSNotFound) && ([wallPostString rangeOfString:@"https://youtu.be"].location == NSNotFound) && ([wallPostString rangeOfString:@"http://m.youtu.be"].location == NSNotFound) && ([wallPostString rangeOfString:@"http://youtu.be"].location == NSNotFound))
        {
            
        }
        else
        {
            wallPostString=  [wallPostString substringWithRange:NSMakeRange([wallPostString rangeOfString:@"youtu.be"].location, [wallPostString length]-[wallPostString rangeOfString:@"youtu.be"].location)];
            wallPostString=  [wallPostString stringByReplacingOccurrencesOfString:@"youtu.be" withString:@""];
            
            return wallPostString;
        }
        
        if (([wallPostString rangeOfString:@"https://www.youtube.com/embed"].location == NSNotFound) && ([wallPostString rangeOfString:@"http://www.youtube.com/embed"].location == NSNotFound))
        {
            
        }
        else
        {
            wallPostString=  [wallPostString substringWithRange:NSMakeRange([wallPostString rangeOfString:@"embed"].location, [wallPostString length]-[wallPostString rangeOfString:@"embed"].location)];
            wallPostString=[wallPostString stringByReplacingOccurrencesOfString:@"embed" withString:@""];
            
            return wallPostString;
        }
    }
    return wallPostString;
}

+(BOOL)YoutubeDetectType:(NSString *)youtubeURL
{
    youtubeURL=[youtubeURL stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (([youtubeURL rangeOfString:@"http://www.youtube.com/watch?"].location == NSNotFound) && ([youtubeURL rangeOfString:@"https://m.youtube.com/watch?"].location == NSNotFound) && ([youtubeURL rangeOfString:@"https://m.youtube.com/watch?"].location == NSNotFound) && ([youtubeURL rangeOfString:@"https://www.youtube.com/watch?"].location == NSNotFound) && ([youtubeURL rangeOfString:@"https://m.youtu.be"].location == NSNotFound) && ([youtubeURL rangeOfString:@"https://youtu.be"].location == NSNotFound) && ([youtubeURL rangeOfString:@"https://www.youtube.com/embed"].location == NSNotFound) && ([youtubeURL rangeOfString:@"http://m.youtu.be"].location==NSNotFound) && ([youtubeURL rangeOfString:@"http://youtu.be"].location == NSNotFound) && ([youtubeURL rangeOfString:@"http://www.youtube.com/embed"].location == NSNotFound))
    {
        return NO;
    }
    else
    {
        if ([youtubeURL rangeOfString:@"v="].location==NSNotFound)
        {
            if([youtubeURL isEqualToString:@"https://m.youtu.be"]||[youtubeURL isEqualToString:@"https://youtu.be"]||[youtubeURL isEqualToString:@"https://www.youtube.com/embed"]||[youtubeURL isEqualToString:@"http://m.youtu.be"]||[youtubeURL isEqualToString:@"http://youtu.be"]||[youtubeURL isEqualToString:@"http://www.youtube.com/embed"])
            {
                return NO;
            }
            
            if(([youtubeURL rangeOfString:@"https://m.youtu.be"].location == NSNotFound) && ([youtubeURL rangeOfString:@"https://youtu.be"].location == NSNotFound) && ([youtubeURL rangeOfString:@"https://www.youtube.com/embed"].location == NSNotFound) && ([youtubeURL rangeOfString:@"http://m.youtu.be"].location == NSNotFound) && ([youtubeURL rangeOfString:@"http://youtu.be"].location == NSNotFound) && ([youtubeURL rangeOfString:@"http://www.youtube.com/embed"].location==NSNotFound))
            {
                return NO;
            }
            else
            {
                return YES;
            }
        }
        else
        {
            NSLog(@"Found");
            return YES;
        }
    }
    return NO;
}



#pragma mark - Get Array Count
+(NSInteger)getArrayCountFromArray:(NSArray *)ary {
    if (ary != nil)
    {
        if ([ary count]==0)
        {
            return 0;
        }else
        {
            return [ary count];
        }
    }else
    {
        return 0;
    }
}

#pragma mark - Call Webservice 
+(void)callWebservice:(SEL)webservice forTarget:(id)target{
    BOOL hasConnected = [CommonUtils connected];
    if (hasConnected)
    {
        [target performSelector:webservice withObject:nil afterDelay:0.0001];
    }
    else
    {
        ShowAlert(AlertTitle, MSG_NO_INTERNET_CONNECTION);
    }
}

@end
