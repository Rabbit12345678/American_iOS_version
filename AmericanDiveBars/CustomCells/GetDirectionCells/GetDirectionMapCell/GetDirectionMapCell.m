//
//  GetDirectionMapCell.m
//  GetDirections
//
//  Created by spaculus on 10/29/15.
//  Copyright © 2015 spaculus. All rights reserved.
//

#import "GetDirectionMapCell.h"
#import "CommonUtils.h"
#import "Reachability.h"
#import "GoogleSuggestionAddressCell.h"

#define kAPIKEY @"AIzaSyBzRMtRU0UBpj4NHvpuG9A1lBIxj1lXCJg" //@"AIzaSyDY12EffEfRIJzXWMlbJSynBHKcFLaFe3w"

@interface GetDirectionMapCell () <MBProgressHUDDelegate,CLLocationManagerDelegate>
{
    MBProgressHUD *HUD;
    NSMutableArray *placesOutputArray;
    
    MKPolyline *_routeOverlay;
    MKRoute *_currentRoute;
    
    // Google Places Api
    NSString *countryCode;
    
    CLLocationCoordinate2D sourceCordinates;
    CLLocationCoordinate2D destinationCordinates;
    
    BOOL isSourceAddress;
    BOOL isSourceAddressToSendWithDelegate;
    
    
    //Core Location Manager
    CLLocationManager *locationManager;
    
    double myLatitude;
    double myLongitude;
    
    CLGeocoder * geoCoder;
    NSArray *aryLocations;
    NSString *strCurLoc;
    
    NSString *strStartLocation;
    
}
@property (nonatomic, strong) NSMutableArray *arrLocationList;
@property (nonatomic, strong) NSMutableDictionary *dictUserData;
@property (strong, nonatomic) IBOutlet UITableView *tblLocation;

@property (nonatomic, strong) NSMutableData *responseData;
@property (nonatomic, strong) NSURLConnection *connectionLocationList;

@end

@implementation GetDirectionMapCell

- (void)awakeFromNib {
    // Initialization code
    [self setupCell];
}

-(void)setupCell {
   
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.dictUserData = [@{} mutableCopy];
    [CommonUtils setBorderAndCorner_ForTextField:self.txtEnterLocation
                                 forCornerRadius:2
                                  forBorderWidth:0.8f
                                     withPadding:8
                                        andColor:[[UIColor colorWithRed:189.0/255.0 green:127.0/255.0 blue:52.0/255.0 alpha:1.0] CGColor]];
    [self.txtEnterLocation setTextColor:[UIColor whiteColor]];
    [self.txtEnterLocation setValue:[UIColor colorWithRed:146.0/255.0 green:145.0/255.0 blue:145.0/255.0 alpha:1.0] forKeyPath:@"_placeholderLabel.textColor"];
    [self hideLocationView];
    
    //[CommonUtils setRightImageToTextField:self.txtEnterLocation withImage:@"gpsPlain40.png" withPadding:45 withWidth:40 withHeight:40 forSelector:@selector(currentLocationTapped:) forTarget:self];
    [CommonUtils setRightImageLabelToTextField:self.txtEnterLocation withImage:@"gradient.png" withPadding:140 withWidth:140 withHeight:40 forSelector:@selector(currentLocationTapped:) forTarget:self forText:@"Use My Location"];
}


-(void)currentLocationTapped:(UIButton *)btnCurrentLocation {
    NSLog(@"GPS TAPPED");
    self.isFromGetDirection = NO;
    
    [MBProgressHUD hideHUDForView:self.contentView animated:YES];
    HUD = [MBProgressHUD showHUDAddedTo:self.contentView animated:YES];
    HUD.delegate = self;
    HUD.mode = MBProgressHUDModeIndeterminate;
    
    [self configureLocationManager];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)btnSearch_Clicked:(id)sender {
    //if (self.isFromGetDirection) {
        [self configureMapRoutePathForSource:sourceCordinates toDestination:destinationCordinates];
    //}
    
}

-(IBAction)btnDirectionList_Clicked:(id)sender {
    if ([[self delegate] respondsToSelector:@selector(getDirectionListViewController_FromSourceToDestination:isSourceAddress:)]) {
        [[self delegate] getDirectionListViewController_FromSourceToDestination:_currentRoute.steps isSourceAddress:isSourceAddressToSendWithDelegate];
    }
}


#pragma mark - Table View
#pragma mark TableView Datasource and Delegates
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [CommonUtils getArrayCountFromArray:self.arrLocationList];
}

#pragma mark Cell For Row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self GoogleSuggestionAddressCellAtIndexPath:indexPath];
}

#pragma mark
#pragma mark TItleCell Cell Configuration
- (GoogleSuggestionAddressCell *)GoogleSuggestionAddressCellAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"GoogleSuggestionAddressCell";
    
    GoogleSuggestionAddressCell *cell = (GoogleSuggestionAddressCell *)[self.tblLocation dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib;
        nib = [[NSBundle mainBundle] loadNibNamed:@"GoogleSuggestionAddressCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.lblLocation.text = [CommonUtils getNotNullString:[[self.arrLocationList objectAtIndex:indexPath.row] valueForKey:@"description"]];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
    
}
#pragma mark Height For Row
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.isFromGetDirection) {
        [placesOutputArray removeLastObject];
        self.isFromGetDirection = YES;
    }
    strStartLocation = [[self.arrLocationList objectAtIndex:indexPath.row] valueForKey:@"description"];
    [self.dictUserData setObject:strStartLocation forKey:@"location"];
    [self.txtEnterLocation resignFirstResponder];
    [self hideLocationView];
    isSourceAddress = YES;
    [self getLatlongfromAddress:[CommonUtils getNotNullString:[[self.arrLocationList objectAtIndex:indexPath.row] valueForKey:@"description"]] isSource:NO];
}


#pragma mark TextField Delegates
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if([textField.text length]==0) {
        textField.text = @"";
    }
    else {
        textField.text = strStartLocation;
    }
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
        NSString *searchText = [self.dictUserData valueForKey:@"location"];
        NSLog(@"TEXT - %@",[self.dictUserData valueForKey:@"location"]);
        
        if ([searchText length] == 0)
        {
            searchText = string;
        }
        else
        {
            if ([string length]==0)
            {
                if ([searchText length]==1) {
                    searchText = @"";
                }
                else {
                    searchText = [searchText substringToIndex:[searchText length]-1];
                }                
            }
            else
            {
                searchText = [NSString stringWithFormat:@"%@%@",searchText,string];
            }
        }
        
        [self.dictUserData setObject:searchText forKey:@"location"];
        
        if([searchText length] > 0)
        {
            
            [self.connectionLocationList cancel];
            self.connectionLocationList = nil;
            [self hideLocationView];
            
            BOOL hasConnected = [CommonUtils connected];
            if (hasConnected)
            {
                [self.connectionLocationList cancel];
                self.connectionLocationList = nil;
                [self getLocationListService];
            }
            else
            {
                [self.connectionLocationList cancel];
                self.connectionLocationList = nil;
                // ShowAlert(AlertTitle, @"No Internet connection available.");
            }
        }
        else {
            [self hideLocationView];
        }
    
    return YES;
}

#pragma mark Search Location View Methods
-(void)hideLocationView
{
    [self.tblLocation setHidden:YES];
    [self.locationsView setHidden:YES];
}

-(void)showLocationView
{
    [self.locationsView setHidden:NO];
    [self.tblLocation setHidden:NO];
    [self.tblLocation reloadData];
}




#pragma mark - Map view

-(void)parseDataForMapView:(MKMapView *)mapView
{
    
    if(mapView.annotations){
        [mapView removeAnnotations:mapView.annotations];
    }
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.01;
    span.longitudeDelta=0.01;
    
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

    @try {
        [self zoomToFitMapAnnotations:mapView];
    }
    @catch (NSException *exception) {
    }
    
}



-(void)configureMapRoutePathForSource:(CLLocationCoordinate2D)sourceLoc toDestination:(CLLocationCoordinate2D)destinationLoc {
    
    [MBProgressHUD hideHUDForView:self.contentView animated:YES];
    HUD = [MBProgressHUD showHUDAddedTo:self.contentView animated:YES];
    HUD.delegate = self;
    HUD.mode = MBProgressHUDModeIndeterminate;
    
    // Make a directions request
    MKDirectionsRequest *directionsRequest = [MKDirectionsRequest new];
    
    // Start at our Source
    CLLocationCoordinate2D sourceCoords = CLLocationCoordinate2DMake(sourceLoc.latitude, sourceLoc.longitude);
    MKPlacemark *sourcePlacemark = [[MKPlacemark alloc] initWithCoordinate:sourceCoords addressDictionary:nil];
    MKMapItem *source = [[MKMapItem alloc] initWithPlacemark:sourcePlacemark];//[MKMapItem mapItemForCurrentLocation];
    [directionsRequest setSource:source];
    
    // Make the destination
    CLLocationCoordinate2D destinationCoords = CLLocationCoordinate2DMake(destinationLoc.latitude, destinationLoc.longitude);
    MKPlacemark *destinationPlacemark = [[MKPlacemark alloc] initWithCoordinate:destinationCoords addressDictionary:nil];
    MKMapItem *destination = [[MKMapItem alloc] initWithPlacemark:destinationPlacemark];
    [directionsRequest setDestination:destination];
    
    MKDirections *directions = [[MKDirections alloc] initWithRequest:directionsRequest];
    
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        [MBProgressHUD hideHUDForView:self.contentView animated:YES];
        // We're done
        
        // Now handle the result
        if (error) {
            NSLog(@"There was an error getting your directions");
            return;
        }
        
        // So there wasn't an error - let's plot those routes
        _currentRoute = [response.routes firstObject];
        if ([[self delegate] respondsToSelector:@selector(getDirectionListFromSourceToDestination:isSourceAddress:)]) {
            [[self delegate] getDirectionListFromSourceToDestination:_currentRoute.steps isSourceAddress:isSourceAddressToSendWithDelegate];
        }
        //[self parseDataForMapView:self.map];
        
        [self plotRouteOnMap:_currentRoute];
    }];
    
    [self parseDataForMapView:self.map];
}

- (void)plotRouteOnMap:(MKRoute *)route
{
    if(_routeOverlay) {
        [self.map removeOverlay:_routeOverlay];
    }
    
    // Update the ivar
    _routeOverlay = route.polyline;
    
    // Add it to the map
    [self.map addOverlay:_routeOverlay];
    //[self.map reloadInputViews];
    
}

#pragma mark  Map View Delegates

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    NSLog(@"pin tapped");
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    NSLog(@"calloutaccessory view tapped");
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString *identifier = @"MyLocation";
    MKAnnotationView *annotationView = nil;
    if ([annotation isKindOfClass:[PlacePin class]])
    {
        annotationView =  (MKAnnotationView *)[self.map dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (annotationView == nil)
        {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            
        } else
        {
            annotationView.annotation = annotation;
        }
        
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        
        if ([(PlacePin *)annotationView.annotation nTag] == 0) {
            annotationView.image = [UIImage imageNamed:@"redpin.png"];
        }
        else {
            if (self.isFromGetDirection) {
                annotationView.image = [UIImage imageNamed:@"redpin.png"];
            }
            else {
                annotationView.image = [UIImage imageNamed:@"bluepin.png"];
            }
        }
        
        /*if (self.isFromHappy) {
            if([[(PlacePin *)annotationView.annotation image] isEqualToString:@"map_pin_HH.png"])
            {
                btnMapInfo = [UIButton buttonWithType:UIButtonTypeCustom];
                btnMapInfo.frame = CGRectMake(0, 0, 25, 25);
                [btnMapInfo setBackgroundImage:[UIImage imageNamed:@"gray_right_arrow.png"] forState:UIControlStateNormal];
                annotationView.rightCalloutAccessoryView = btnMapInfo;
                
                annotationView.image = [UIImage imageNamed:@"map_pin_HH.png"];
            }
            
        }
        else {
            if([[(PlacePin *)annotationView.annotation image] isEqualToString:@"map_pin.png"])
            {
                btnMapInfo = [UIButton buttonWithType:UIButtonTypeCustom];
                btnMapInfo.frame = CGRectMake(0, 0, 25, 25);
                [btnMapInfo setBackgroundImage:[UIImage imageNamed:@"gray_right_arrow.png"] forState:UIControlStateNormal];
                annotationView.rightCalloutAccessoryView = btnMapInfo;
                
                annotationView.image = [UIImage imageNamed:@"map_pin.png"];
            }
            
        }
        
        
        UIImageView *myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,40,40)];
        [myImageView sd_setImageWithURL:[NSURL URLWithString:[[placesOutputArray objectAtIndex:[(PlacePin *)annotationView.annotation nTag]] imgURL]] placeholderImage:[UIImage imageNamed:@"no_bar_detail.png"]];
        
        annotationView.leftCalloutAccessoryView = myImageView;*/
    }
    else
    {
        [mapView.userLocation setTitle:@"I am here"];
        
        //        annotationView =  (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        //
        //        if (annotationView == nil)
        //        {
        //            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        //        } else
        //        {
        //            annotationView.annotation = annotation;
        //        }
        //
        //        annotationView.rightCalloutAccessoryView = nil;
        //        annotationView.enabled = YES;
        //        annotationView.canShowCallout = YES;
        //        annotationView.image = [UIImage imageNamed:@"star_pin.png"];
        //        
        //        [self zoomToFitMapAnnotationsForUserLocation:mapView];
    }
    
    return annotationView;
}
/*{
    
    MKPinAnnotationView *pinView = nil;
    if(annotation != self.map.userLocation)
    {
        static NSString *defaultPinID = @"com.invasivecode.pin";
        pinView = (MKPinAnnotationView *)[self.map dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
        if ( pinView == nil )
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:defaultPinID];
    }
    else {
        [mapView.userLocation setTitle:@"I am here"];
    }
    
    // [pinView setPinTintColor:[UIColor greenColor]];
    //[pinView setPinColor:MKPinAnnotationColorGreen];
    pinView.canShowCallout = YES;
    pinView.animatesDrop = YES;
    
    
    return pinView;
}*/


- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id <MKOverlay>)overlay {
    
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
    renderer.strokeColor = [UIColor colorWithRed:46.0/255.0 green:44.0/255.0 blue:38.0/255.0 alpha:1.0];
    renderer.lineWidth = 4.0;
    return  renderer;
    
}


/*- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString *identifier = @"MyLocation";
    MKAnnotationView *annotationView = nil;
    if ([annotation isKindOfClass:[PlacePin class]])
    {
        annotationView =  (MKAnnotationView *)[self.map dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (annotationView == nil)
        {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            
        } else
        {
            annotationView.annotation = annotation;
        }
        
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        
        if([[(PlacePin *)annotationView.annotation image] isEqualToString:@"crew_pin1.png"])
        {
            annotationView.image = [UIImage imageNamed:@"crew_pin1.png"];
        }
        else if([[(PlacePin *)annotationView.annotation image] isEqualToString:@"map_pin.png"])
        {
            // btnMapInfo = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            // annotationView.rightCalloutAccessoryView = btnMapInfo;
            annotationView.image = [UIImage imageNamed:@"map_pin.png"];
        }
        
        UIImageView *myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,40,40)];
        [myImageView sd_setImageWithURL:[NSURL URLWithString:[[placesOutputArray objectAtIndex:[(PlacePin *)annotationView.annotation nTag]] crewPicURL]] placeholderImage:[UIImage imageNamed:@"no_img"]];
        
        annotationView.leftCalloutAccessoryView = myImageView;
    }
    else
    {
        [mapView.userLocation setTitle:@"I am here"];
        
        annotationView =  (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (annotationView == nil)
        {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else
        {
            annotationView.annotation = annotation;
        }
        
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.image = [UIImage imageNamed:@"star_pin.png"];
        
        [self zoomToFitMapAnnotationsForUserLocation:mapView];
    }
    
    return annotationView;
}*/

-(void)zoomToFitMapAnnotations:(MKMapView*)mv
{
    //// JEKIL 24/8/2012 NSLog(@"zoom To Fit Map Annotations");
    if([mv.annotations count] == 0)
        return;
    
    if([mv.annotations count] == 1) {
        
        MKCoordinateRegion region;
        MKCoordinateSpan span;
        span.latitudeDelta=0.05;//0.2
        span.longitudeDelta=0.05;//0.2
        
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
        region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 5.0; //1.1; // Add a little extra space on the sides
        region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 5.0; // 1.1; // Add a little extra space on the sides
        
        region = [mv regionThatFits:region];
        [mv setRegion:region animated:YES];
    }
}

-(void)zoomToFitMapAnnotationsForUserLocation:(MKMapView*)mv
{
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.01;//0.2
    span.longitudeDelta=0.01;//0.2
    
    CLLocationCoordinate2D location;
    location.latitude = self.map.userLocation.location.coordinate.latitude;//annotation.coordinate.latitude;
    location.longitude = self.map.userLocation.location.coordinate.longitude;//annotation.coordinate.longitude;
    region.span=span;
    region.center=location;
    
    [mv regionThatFits:region];
    [mv setRegion:region animated:TRUE];
}

#pragma mark - Location Manager
-(void)configureLocationManager {
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    if ([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)])
    {
        [locationManager requestWhenInUseAuthorization];
    }
    
    [locationManager stopUpdatingLocation];
    [locationManager startUpdatingLocation];
}

#pragma mark Location Delegates
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [locationManager stopUpdatingLocation];
    ShowAlert(AlertTitle,@"Failed to Get Your Location");
    [MBProgressHUD hideHUDForView:self.contentView animated:YES];

}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"LatLong : %f , %f",locationManager.location.coordinate.latitude , locationManager.location.coordinate.longitude);
    myLatitude = locationManager.location.coordinate.latitude;
    myLongitude = locationManager.location.coordinate.longitude;
    
    NSString *lat = [NSString stringWithFormat:@"%lf",myLatitude];
    NSString *lng = [NSString stringWithFormat:@"%lf",myLongitude];
    
    
    [locationManager stopUpdatingLocation];
    
    geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:(CLLocation *)[locations lastObject] completionHandler:^(NSArray *placemarks, NSError *error) {
        [MBProgressHUD hideHUDForView:self.contentView animated:YES];

        for (CLPlacemark * placemark in placemarks) {
            NSLog(@"PLACE MARKS = %@, %@",placemarks,placemark.addressDictionary);
            
            aryLocations = [placemark.addressDictionary valueForKey:@"FormattedAddressLines"];
            strCurLoc = [aryLocations componentsJoinedByString:@","];
            
            if ([strCurLoc length]!=0) {
                
                NSLog(@"Current location = %@",strCurLoc);
                
                
                if (placesOutputArray) {
                    if ([placesOutputArray count]>0) {
                        Place *place = [placesOutputArray objectAtIndex:0];
                        
                        double latitude = [place.lat doubleValue];
                        double longitude = [place.lng doubleValue];
                        
                        destinationCordinates = CLLocationCoordinate2DMake(latitude, longitude);
                        
                        //                isSourceAddressToSendWithDelegate = isSourceAddress;
                        //                isSourceAddress = NO;
                        
                        if(_routeOverlay) {
                            [self.map removeOverlay:_routeOverlay];
                        }
                        
                        if (self.map.annotations.count>0) {
                            [self.map removeAnnotations:self.map.annotations];
                        }
                        [placesOutputArray removeAllObjects];
                        
                        [placesOutputArray addObject:place];
                    }
                }

                
                Place *place = [[Place alloc] init];
                place.lat = lat;
                place.lng = lng;
                place.addrs = strCurLoc;
                
                
                
                if ([placesOutputArray count]<2) {
                    [placesOutputArray addObject:place];
                    double latitude = [lat doubleValue];
                    double longitude = [lng doubleValue];
                    
                    sourceCordinates = CLLocationCoordinate2DMake(latitude, longitude);
                    
                    isSourceAddressToSendWithDelegate = YES;
                    self.txtEnterLocation.text = @"My Location";//strCurLoc;
                    
                    //[self configureMapForMeWithLatitude:lat andLongitude:lng forAddress:strCurLoc isSource:NO];
                    
                    
                    
                }
                
                
                
                
                //                [_lblCL setText:strCurLoc];
                //[_btnDelCL setHidden:NO];
            }else
            {
                strCurLoc = @"My Location";
            }
            
            [self configureMapRoutePathForSource:sourceCordinates toDestination:destinationCordinates];
            //.... = [placemark locality];
        }
    }];
    
}




#pragma mark webservice 

-(void)configureMapForMeWithLatitude:(NSString *)lat andLongitude:(NSString *)lng forAddress:(NSString *)address isSource:(BOOL)isSource{
    if (!isSource) {
        
        Place *place = [[Place alloc] init];
        place.lat = lat;
        place.lng = lng;
        place.addrs = address;
        
        [placesOutputArray addObject:place];
        
        double latitude = [lat doubleValue];
        double longitude = [lng doubleValue];
        
        sourceCordinates = CLLocationCoordinate2DMake(latitude, longitude);
        
        isSourceAddressToSendWithDelegate = YES;
        
        //[self configureMapRoutePathForSource:sourceCordinates toDestination:destinationCordinates];
    }
    
    
    
   // [self parseDataForMapView:self.map];
}

-(void)configureMapWithLatitude:(NSString *)lat andLongitude:(NSString *)lng forAddress:(NSString *)address isSource:(BOOL)isSource{
    if (!isSource) {
    
        if (placesOutputArray) {
            if ([placesOutputArray count]>0) {
                if (self.map.annotations.count>0) {
                    [self.map removeAnnotations:self.map.annotations];
                }
                [placesOutputArray removeAllObjects];
            }
        }
        else {
            placesOutputArray = [[NSMutableArray alloc] init];
        }
        
        Place *place = [[Place alloc] init];
        place.lat = lat;
        place.lng = lng;
        place.addrs = address;
        
        [placesOutputArray addObject:place];
        
        double latitude = [lat doubleValue];
        double longitude = [lng doubleValue];
        
        destinationCordinates = CLLocationCoordinate2DMake(latitude, longitude);
        
        if (!self.isFromGetDirection) {
            [self configureLocationManager];
        }
    }
    else {
                
        
    }
    

    
    
    [self parseDataForMapView:self.map];
}

-(void)getLatlongfromAddress:(NSString *)address isSource:(BOOL)isSource
{
    [MBProgressHUD hideHUDForView:self.contentView animated:YES];
    HUD = [MBProgressHUD showHUDAddedTo:self.contentView animated:YES];
    HUD.delegate = self;
    HUD.mode = MBProgressHUDModeIndeterminate;
    
    NSString *mapURL = [[NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?address=%@",address] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:mapURL];
    
    NSMutableURLRequest *Request = [NSMutableURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:Request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        [MBProgressHUD hideHUDForView:self.contentView animated:YES];
        
        NSString *stringResponse = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Response : %@",stringResponse);
        
        if(data == nil)
        {
            //ShowAlert(AlertTitle, COMMON_ERROR);
            return;
        }
        
        NSDictionary *dict = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        //NSLog(@"Map Address = %@",dict);
        
        
        NSArray * allPlases = [dict valueForKeyPath:@"results"];
        if([allPlases count] > 0)
        {
            NSString *lat = [[[[[allPlases objectAtIndex:0] valueForKey:@"geometry"] valueForKey:@"location"] valueForKey:@"lat"] stringValue];
            NSString *lng = [[[[[allPlases objectAtIndex:0] valueForKey:@"geometry"] valueForKey:@"location"] valueForKey:@"lng"] stringValue];
            NSString *name = [[allPlases objectAtIndex:0] valueForKey:@"name"];
            NSString *addrs = address;
            
           
            
            if (isSourceAddress) {
                
                if (placesOutputArray) {
                    if ([placesOutputArray count]>0) {
                        Place *place = [placesOutputArray objectAtIndex:0];
                        
                        double latitude = [place.lat doubleValue];
                        double longitude = [place.lng doubleValue];
                        
                        destinationCordinates = CLLocationCoordinate2DMake(latitude, longitude);
                        
                        //                isSourceAddressToSendWithDelegate = isSourceAddress;
                        //                isSourceAddress = NO;
                        
                        if(_routeOverlay) {
                            [self.map removeOverlay:_routeOverlay];
                        }
                        
                        if (self.map.annotations.count>0) {
                            [self.map removeAnnotations:self.map.annotations];
                        }
                        [placesOutputArray removeAllObjects];
                        
                        [placesOutputArray addObject:place];
                    }
                }

                
                
                Place *place = [[Place alloc] init];
                [place setLat:lat];
                [place setLng:lng];
                [place setName:name];
                [place setAddrs:addrs];
                
                [placesOutputArray addObject:place];
                
                
                double latitude = [lat doubleValue];
                double longitude = [lng doubleValue];
                
                sourceCordinates = CLLocationCoordinate2DMake(latitude, longitude);
                
                isSourceAddressToSendWithDelegate = isSourceAddress;
                isSourceAddress = NO;
            }
            else {
                if (!isSource) {
                    placesOutputArray = [[NSMutableArray alloc] init];
                    Place *place = [[Place alloc] init];
                    [place setLat:lat];
                    [place setLng:lng];
                    [place setName:name];
                    [place setAddrs:addrs];
                    [placesOutputArray addObject:place];
                    
                    NSLog(@"%@",placesOutputArray);
                    
                    double latitude = [lat doubleValue];
                    double longitude = [lng doubleValue];
                    
                    destinationCordinates = CLLocationCoordinate2DMake(latitude, longitude);
                    
                    if (!self.isFromGetDirection) {
                        [self configureLocationManager];
                    }
                    
                    [self parseDataForMapView:self.map];
                }
            }
        }
    }];
    
    
    
    //    NSData *data = [NSData dataWithContentsOfURL:url];
    //    
    //    if(data == nil)
    //    {
    //        //ShowAlert(AlertTitle, MSG_SERVER_NOT_REACHABLE);
    //        return;
    //    }
    //    
    //    NSDictionary *dict = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    //    
    //    //NSLog(@"Map Address = %@",dict);
    //    
    //    placesOutputArray = [[NSMutableArray alloc] init];
    //    NSArray * allPlases = [dict valueForKeyPath:@"results"];
    //    if([allPlases count] > 0)
    //    {
    //        NSString *lat = [[[[[allPlases objectAtIndex:0] valueForKey:@"geometry"] valueForKey:@"location"] valueForKey:@"lat"] stringValue];
    //        NSString *lng = [[[[[allPlases objectAtIndex:0] valueForKey:@"geometry"] valueForKey:@"location"] valueForKey:@"lng"] stringValue];
    //        NSString *name = [[allPlases objectAtIndex:0] valueForKey:@"name"];
    //        NSString *addrs = address;
    //        
    //        Place *place = [[Place alloc] init];
    //        [place setLat:lat];
    //        [place setLng:lng];
    //        [place setName:name];
    //        [place setAddrs:addrs];
    //        [placesOutputArray addObject:place];
    //        
    //        NSLog(@"%@",placesOutputArray);
    //        
    //        //[placesOutputArray addObjectsFromArray:[dict valueForKey:@"location"]];
    //        
    //        [self parseDataForMapView:self.map];
    //    }
    
}


/*-(void)getLocationListService
{
    NSString *searchString = [[self.dictUserData valueForKey:@"location"] stringByReplacingOccurrencesOfString:@" " withString:@""];
    //NSString *myURL = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/autocomplete/json?input=%@&key=%@",searchString,kAPIKEY];
    NSString *myURL = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/autocomplete/json?input=%@&components=country:%@&sensor=true&key=%@",searchString,@"US",kAPIKEY];
    NSMutableURLRequest *Request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: myURL]];
    
    [NSURLConnection sendAsynchronousRequest:Request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //[MBProgressHUD hideHUDForView:self.view animated:YES];
        
        NSString *stringResponse = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Response : %@",stringResponse);
        
        if(data == nil)
        {
            //ShowAlert(AlertTitle, COMMON_ERROR);
            return;
        }
        
        NSError *jsonParsingError = nil;
        NSDictionary *tempDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonParsingError];
        NSString *deletePicStatus = [tempDict objectForKey:@"status"];
        if([deletePicStatus isEqualToString:@"OK"])
        {
            self.arrLocationList = [[tempDict valueForKey:@"predictions"] mutableCopy];
            [self.tblLocation reloadData];
            if ([self.arrLocationList count] == 0) {
                [self hideLocationView];
            }
            else {
                [self showLocationView];
            }
        }
        else
        {
            [self.arrLocationList removeAllObjects];
            [self.tblLocation reloadData];
            [self hideLocationView];
        }
    }];
}*/


#pragma mark - Webservice Call
-(void)getLocationListService
{
    //192.168.1.27/ADB/api/checklogin
                //    NSString *myURL = [NSString stringWithFormat:@"%@auto_suggest_bar",WEBSERVICE_URL];
                //    NSMutableURLRequest *Request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: myURL]];
                //    NSString *params = [NSString stringWithFormat:@"term=%@",searchText];
                //    [Request setHTTPMethod:@"POST"];
                //    [Request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSString *searchString = [[self.dictUserData valueForKey:@"location"] stringByReplacingOccurrencesOfString:@" " withString:@""];

    // https://maps.googleapis.com/maps/api/place/autocomplete/json?input=Croatia&key=AIzaSyBzRMtRU0UBpj4NHvpuG9A1lBIxj1lXCJg
    NSString *myURL = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/autocomplete/json?input=%@&components=country:%@&sensor=true&key=%@",searchString,@"US",kAPIKEY];
    NSMutableURLRequest *Request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: myURL]];
    
    
    
    self.connectionLocationList = [[NSURLConnection alloc] initWithRequest:Request delegate:self];
    
    if(self.connectionLocationList)
    {
        _responseData = [NSMutableData data];
    }
    else
    {
        NSLog(@"connectionLogin is NULL");
    }
}




#pragma mark Webservice Response
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [self.responseData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.responseData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //[MBProgressHUD hideHUDForView:self.view animated:YES];
    
    NSString *stringResponse = [[NSString alloc]initWithData:self.responseData encoding:NSUTF8StringEncoding];
    NSLog(@"Response : %@",stringResponse);
    
    if(self.responseData == nil)
    {
        //ShowAlert(AlertTitle, COMMON_ERROR);
        return;
    }
    
    NSError *jsonParsingError = nil;
    NSDictionary *tempDict = [NSJSONSerialization JSONObjectWithData:self.responseData options:0 error:&jsonParsingError];
    NSString *deletePicStatus = [tempDict objectForKey:@"status"];
    if([deletePicStatus isEqualToString:@"OK"])
    {
        [self showLocationView];
        self.arrLocationList = [[tempDict valueForKey:@"predictions"] mutableCopy];
        [self.tblLocation reloadData];
        if ([self.arrLocationList count] == 0) {
            [self hideLocationView];
        }
        else {
            NSString *text = [self.dictUserData valueForKey:@"location"];;
            if ([text length]==0) {
                [self.arrLocationList removeAllObjects];
                [self hideLocationView];
            }
            else {
                [self showLocationView];
            }
            
        }
    }
    else
    {
        [self.arrLocationList removeAllObjects];
        [self.tblLocation reloadData];
        [self hideLocationView];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [self.arrLocationList removeAllObjects];
    [self.tblLocation reloadData];
    [self hideLocationView];
}
/*{
    NSLog(@"connectionDidFinishLoading");
 
    NSString *stringResponse = [[NSString alloc]initWithData:self.responseData encoding:NSUTF8StringEncoding];
    NSLog(@"Response : %@",stringResponse);
    if (self.responseData == nil)
    {
        ShowAlert(AlertTitle, MSG_SERVER_NOT_REACHABLE);
        return;
    }
    
    NSError *jsonParsingError = nil;
    NSDictionary *tempDict = [NSJSONSerialization JSONObjectWithData:self.responseData options:0 error:&jsonParsingError];
    NSLog(@"Dict : %@",tempDict);
    
    if ([[tempDict valueForKey:@"status"] isEqualToString:@"success"]) {
        
        if([searchText length]==0) {
            self.aryTitles = @[];
        }
        else {
            self.aryTitles = [tempDict valueForKey:@"barlist"];//[[tempDict valueForKey:@"barlist"] mutableCopy];
        }
        [self registerCell];
        [self.tblView reloadData];
    }
    
}*/

@end
