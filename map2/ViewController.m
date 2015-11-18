//
//  ViewController.m
//  map2
//
//  Created by ÖZLEM ATABAY on 13.11.2015.
//  Copyright (c) 2015 ÖZLEM ATABAY. All rights reserved.
//

#import "ViewController.h"
#import "MapKit/MapKit.h"
#import "Annotation.h"
#import "HomeModel.h"
#import "Location.h"
#import <MapKit/MKAnnotationView.h>

@interface ViewController ()
{
    HomeModel *_homeModel;
    NSArray *_feedItems;
    Location *_selectedLocation;
    
    
    NSMutableArray *locations;
    CLLocationCoordinate2D location;
    Annotation *myAnn;
}
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    // Create array object and assign it to _feedItems variable
    _feedItems = [[NSArray alloc] init];
    
    // Create new HomeModel object and assign it to _homeModel variable
    _homeModel = [[HomeModel alloc] init];
    
    // Set this view controller object as the delegate for the home model object
    _homeModel.delegate = self;
    
    // Call the download items method of the home model object
    [_homeModel downloadItems];

    
#ifdef __IPHONE_8_0
    {
        [self.locationManager requestAlwaysAuthorization];
    }
#endif
    
    self.mapView.showsUserLocation = YES;
    [self.mapView setMapType:MKMapTypeHybrid];
    [self.mapView setZoomEnabled:YES];
    [self.mapView setScrollEnabled:YES];

    locations = [[NSMutableArray alloc]init];

}

-(void)itemsDownloaded:(NSArray *)items
{
    // This delegate method will get called when the items are finished downloading
    
    // Set the downloaded items to the array
    _feedItems = items;
    
    for(int i=0;i<_feedItems.count;i++)
    {
        Location *newlot = _feedItems[i];
        myAnn = [[Annotation alloc]init];
        location.latitude = newlot.latitude.doubleValue;
        location.longitude = newlot.longitude.doubleValue;
        myAnn.coordinate = location;
        myAnn.title = newlot.name;
        myAnn.subtitle= newlot.address;
        [locations addObject:myAnn];
      //  NSLog(@"Value of string is %@", myAnn.title);
    }
    
    [self.mapView addAnnotations: locations];

}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    
    if(annotation == mapView.userLocation){
        return nil;
    }
    
    //create a pin object
    MKPinAnnotationView *view = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"pin"];
    
    //change pin color
    view.pinColor = MKPinAnnotationColorGreen;
   
    //enable and animate
    view.enabled = YES;
    view.animatesDrop = YES;
    view.canShowCallout = YES;
    
    //image button
    UIImageView *ImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico-tooth.png"]];
    view.leftCalloutAccessoryView = ImageView;
    view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return view;    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];

    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];

//View Area
    MKCoordinateRegion region = { { 0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = self.locationManager.location.coordinate.latitude;
    region.center.longitude = self.locationManager.location.coordinate.longitude;
    region.span.longitudeDelta = 0.5f;
    region.span.longitudeDelta = 0.5f;
    [self.mapView setRegion:region animated:YES];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 7800, 7800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) mapView:(MKMapView *)mapView
 annotationView:(MKAnnotationView *)view
calloutAccessoryControlTapped:(UIControl *)control
{
    //functionality for annotation button
    Annotation *ann = (Annotation *)view.annotation;
    //deselect
    [self.mapView deselectAnnotation:ann animated:YES];
    //alert location
    NSString *msg = [@"At the dentist" stringByAppendingFormat:@"%f %f", ann.coordinate.latitude, ann.coordinate.longitude];
    UIAlertView *alert =  [[UIAlertView alloc]initWithTitle:@"Location" message:msg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}





@end
