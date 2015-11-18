//
//  ViewController.h
//  map2
//
//  Created by ÖZLEM ATABAY on 13.11.2015.
//  Copyright (c) 2015 ÖZLEM ATABAY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "HomeModel.h"

@interface ViewController : UIViewController <MKMapViewDelegate,  CLLocationManagerDelegate, HomeModelProtocol>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic, retain) CLLocationManager *locationManager;

-(void)itemsDownloaded:(NSArray *)items;

@end

