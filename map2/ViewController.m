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

@interface ViewController ()

@end

#define yer1_lat 41.072201
#define yer1_lon 28.870364

#define yer2_lat 41.076941
#define yer2_lon 28.872789

#define yer3_lat 41.073941
#define yer3_lon 28.871789


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
#ifdef __IPHONE_8_0
    {
        [self.locationManager requestAlwaysAuthorization];
    }
#endif
    
    self.mapView.showsUserLocation = YES;
    [self.mapView setMapType:MKMapTypeStandard];
    [self.mapView setZoomEnabled:YES];
    [self.mapView setScrollEnabled:YES];
    
    CLLocationCoordinate2D center;
    CLLocationCoordinate2D annot;
    
    center.latitude = 41.074847;
    center.longitude = 28.874408;
    
    annot.latitude = 41.072201;
    annot.longitude = 28.870364;
    
     /*   var poiCoor: CLLocationCoordinate2D!
        poiCoor.latitude=center.coordinate.latitude;
        poiCoor.longitude=center.coordinate.longitude;*/
        
   // MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(center, 1000, 1000);
    //[self.mapView setRegion:viewRegion animated:(YES)];
    
 /*   MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = poiCoordinates;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.mapView addAnnotation:point];*/
    
    
    NSMutableArray *locations = [[NSMutableArray alloc]init];
    CLLocationCoordinate2D location;
    Annotation *myAnn;
    
    myAnn = [[Annotation alloc]init];
    location.latitude = yer1_lat;
    location.longitude = yer1_lon;
    myAnn.coordinate = location;
    myAnn.title = @"yer1";
    myAnn.subtitle=@"bla";
    
    [locations addObject:myAnn];
    
    
    myAnn = [[Annotation alloc]init];
    location.latitude = yer2_lat;
    location.longitude = yer2_lon;
    myAnn.coordinate = location;
    myAnn.title = @"yer2";
    myAnn.subtitle=@"alb";
    
    [locations addObject:myAnn];
    
    [self.mapView addAnnotations: locations];
    
    myAnn = [[Annotation alloc]init];
    location.latitude = yer3_lat;
    location.longitude = yer3_lon;
    myAnn.coordinate = location;
    myAnn.title = @"yer3";
    myAnn.subtitle=@"alb";
    
    [locations addObject:myAnn];
    
    [self.mapView addAnnotations: locations];
    
    
   /* MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = annot;
    pin.title = @"Giyimkent";
    pin.subtitle = @"20. Sokak";
    
    
    [self.mapView addAnnotation:pin];*/
    // Do any additional setup after loading the view, typically from a nib.
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
    region.span.longitudeDelta = 0.005f;
    region.span.longitudeDelta = 0.005f;
    [self.mapView setRegion:region animated:YES];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}


// Kullanıcının koordinat bilgilerini alabilmek için.

/*- (NSString *)deviceLocation {
    return [NSString stringWithFormat:@"latitude: %f longitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude];
}
- (NSString *)deviceLat {
    return [NSString stringWithFormat:@"%f", self.locationManager.location.coordinate.latitude];
}
- (NSString *)deviceLon {
    return [NSString stringWithFormat:@"%f", self.locationManager.location.coordinate.longitude];
}
- (NSString *)deviceAlt {
    return [NSString stringWithFormat:@"%f", self.locationManager.location.altitude];
}*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
