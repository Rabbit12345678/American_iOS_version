//
//  BarDetailCell.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/14/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <Foundation/Foundation.h>

//Basic Cell
#import "BasicCell.h"

static NSString * const BasicCellIdentifier = @"BasicCell";

#define Nib_BasicCell @"BasicCell"

//Description Title Cell
#import "DescriptionTitleCell.h"

#import "DescriptionCell.h"
#import "ShowMoreCell.h"

static NSString * const DescriptionCellIdentifier = @"DescriptionCell";
#define Nib_DescriptionCell @"DescriptionCell"

//Share And LIke Buttons Cell
#import "ShareCell.h"

//Payment Cell
#import "PaymentTypeFullCell.h"
#import "PaymentTypeOnlyUpCell.h"
#import "PaymentTypeOnlyDownCell.h"
#import "PaymentTypeCell.h"

//Title Cell
#import "TItleCell.h"

//HoursOpen Cell
#import "HoursOpenCell.h"

//BarGallery Cell
#import "BarGalleryCell.h"

//ViewAll Cell
#import "ViewAllCell.h"
#import "ViewAllBeerServedCell.h"
#import "ViewAllCocktailLiquorServedCell.h"

//BarEvents Cell
#import "BarEventsCell.h"

static NSString * const BarEventsCellIdentifier = @"BarEventsCell";
#define Nib_BarEventsCell @"BarEventsCell"

//BeersServed Cell
#import "BeersServedCell.h"
static NSString * const BeersServedCellIdentifier = @"BeersServedCell";
#define Nib_BeersServedCell @"BeersServedCell"

//Cocktail_Liquors Cell
#import "Cocktail_LiquorsCell.h"
static NSString * const Cocktail_LiquorsCellIdentifier = @"Cocktail_LiquorsCell";
#define Nib_Cocktail_LiquorsCell @"Cocktail_LiquorsCell"

//Take A Look Cell
#import "TakeALookCell.h"

//HowToFindUS Cell
#import "HowToFindUSCell.h"

//RavesAndRents Cell
#import "RavesAndRentsCell.h"

static NSString * const RavesAndRentsCellIdentifier = @"RavesAndRentsCell";
#define Nib_RavesAndRentsCell @"RavesAndRentsCell"

//GetInTouch Cell
#import "GetInTouchCell.h"

//BarSpecialHourButtonCell
#import "BarSpecialHourButtonCell.h"

#import "BarSpecialHoursCell.h"

static NSString * const BarSpecialHoursCellIdentifier = @"BarSpecialHoursCell";
#define Nib_BarSpecialHoursCell @"BarSpecialHoursCell"


#import "NoDataCell.h"

//ReportBarCell Cell
#import "ReportBarCell.h"

//BarWriteReviewCell Cell
#import "BarWriteReviewCell.h"

@interface BarDetailCell : NSObject
@end
