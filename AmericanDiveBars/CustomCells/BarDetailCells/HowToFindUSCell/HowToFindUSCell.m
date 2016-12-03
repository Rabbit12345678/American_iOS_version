//
//  HowToFindUSCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 9/15/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "HowToFindUSCell.h"

@interface HowToFindUSCell ()
{
    NSMutableArray *placesOutputArray;
}

@end
@implementation HowToFindUSCell

- (void)awakeFromNib {
    // Initialization code
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)configureMapInFullMugBar:(FullMugBar *)fullMugBar {
    placesOutputArray = [[NSMutableArray alloc] init];
    
    Place *place = [[Place alloc] init];
    place.lat = fullMugBar.barDetail.bar_lat;
    place.lng = fullMugBar.barDetail.bar_lang;
    place.addrs = fullMugBar.barDetail.fullAddress;
    
    if ([place.lat length]==0 && [place.lng length]==0) {
        
        NSMutableArray *aryTemp = [CommonUtils getLatLongfromAddress:fullMugBar.barDetail.fullAddress_Unformated];
        
        NSLog(@"aryTemp : %@",aryTemp);
        place.lat = [aryTemp valueForKey:@"lat"];
        place.lng = [aryTemp valueForKey:@"lng"];
    }
    
    [placesOutputArray addObject:place];
    
    [self parseDataForMapView:self.viewMap];
}

-(void)getLatlongfromAddress:(NSString *)address
{
    NSString *mapURL = [[NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?address=%@",address] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:mapURL];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    if(data == nil)
    {
        //ShowAlert(AlertTitle, MSG_SERVER_NOT_REACHABLE);
        return;
    }
    
    NSDictionary *dict = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    //NSLog(@"Map Address = %@",dict);
    
    placesOutputArray = [[NSMutableArray alloc] init];
    NSArray * allPlases = [dict valueForKeyPath:@"results"];
    if([allPlases count] > 0)
    {
        NSString *lat = [[[[[allPlases objectAtIndex:0] valueForKey:@"geometry"] valueForKey:@"location"] valueForKey:@"lat"] stringValue];
        NSString *lng = [[[[[allPlases objectAtIndex:0] valueForKey:@"geometry"] valueForKey:@"location"] valueForKey:@"lng"] stringValue];
        NSString *name = [[allPlases objectAtIndex:0] valueForKey:@"name"];
        NSString *addrs = address;
        
        Place *place = [[Place alloc] init];
        [place setLat:lat];
        [place setLng:lng];
        [place setName:name];
        [place setAddrs:addrs];
        [placesOutputArray addObject:place];
        
        NSLog(@"%@",placesOutputArray);
        
        //[placesOutputArray addObjectsFromArray:[dict valueForKey:@"location"]];
        
        [self parseDataForMapView:self.viewMap];
    }
}



-(void)parseDataForMapView:(MKMapView *)mapView
{
    
    if(mapView.annotations){
        [mapView removeAnnotations:mapView.annotations];
    }
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.0;
    span.longitudeDelta=0.0;
    
    CLLocationCoordinate2D location;
    
    region.span = span;
    region.center = location;
    
    NSMutableArray *anoteArr=[[NSMutableArray alloc]initWithCapacity:[placesOutputArray count]];
    
    for (int i = 0; i<[placesOutputArray count]; i++)
    {
        location.latitude = [[[placesOutputArray objectAtIndex:i] lat] doubleValue];
        location.longitude = [[[placesOutputArray objectAtIndex:i] lng] doubleValue];
        
        PlacePin *mapPoint = [[PlacePin alloc] initWithLocation:location];
        mapPoint.nTag = i;
        
        mapPoint.title = [[placesOutputArray objectAtIndex:i] addrs];
        
        [anoteArr addObject:mapPoint];
        
        mapPoint = nil;
    }
    
    
    [mapView addAnnotations:(NSArray*)anoteArr];
    
    [anoteArr removeAllObjects];
    //[mapView setRegion:region animated:YES];
    //[mapView regionThatFits:region];
    @try {
        [self zoomToFitMapAnnotations:mapView];
    }
    @catch (NSException *exception) {
        // JEKIL 24/8/2012 NSLog(@"You can not set zoomlevel of map.");
    }
    // region = [mapView regionThatFits:region];
    
}

-(void)zoomToFitMapAnnotations:(MKMapView*)mv
{
    //// JEKIL 24/8/2012 NSLog(@"zoom To Fit Map Annotations");
    if([mv.annotations count] == 0)
        return;
    
    if([mv.annotations count] == 1) {
        
        MKCoordinateRegion region;
        MKCoordinateSpan span;
        span.latitudeDelta=0.01;//0.2
        span.longitudeDelta=0.01;//0.2
        
        for(PlacePin* annotation in mv.annotations){
            
            CLLocationCoordinate2D location;
            location.latitude = annotation.coordinate.latitude;
            location.longitude = annotation.coordinate.longitude;
            region.span=span;
            region.center=location;
            
            [mv setRegion:region animated:TRUE];
            [mv regionThatFits:region];
        }
    }
    else {
        CLLocationCoordinate2D topLeftCoord;
        topLeftCoord.latitude = -90;
        topLeftCoord.longitude = 180;
        
        CLLocationCoordinate2D bottomRightCoord;
        bottomRightCoord.latitude = 90;
        bottomRightCoord.longitude = -180;
        
        for(PlacePin* annotation in mv.annotations)
        {
            topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
            topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);
            
            bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
            bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
        }
        
        MKCoordinateRegion region;
        region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5;
        region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5;
        region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 1.1; // Add a little extra space on the sides
        region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 1.1; // Add a little extra space on the sides
        
        region = [mv regionThatFits:region];
        [mv setRegion:region animated:YES];
    }
}



#pragma mark - MAP VIEW

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    NSLog(@"pin tapped");
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    NSLog(@"calloutaccessory view tapped");
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    MKPinAnnotationView *pinView = nil;
    if(annotation != self.viewMap.userLocation)
    {
        static NSString *defaultPinID = @"com.invasivecode.pin";
        pinView = (MKPinAnnotationView *)[self.viewMap dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
        if ( pinView == nil )
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:defaultPinID];
    }
    else {
        [mapView.userLocation setTitle:@"I am here"];
    }
    
    [pinView setPinColor:MKPinAnnotationColorRed];
    pinView.canShowCallout = YES;
    pinView.animatesDrop = YES;
    
    
    return pinView;
}


@end
