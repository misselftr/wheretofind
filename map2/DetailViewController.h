//
//  DetailViewController.h
//  
//
//  Created by ÖZLEM ATABAY on 18.11.2015.
//
//

#import <UIKit/UIKit.h>
#import "Location.h"
#import "Annotation.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface DetailViewController : UIViewController <MKMapViewDelegate>
- (IBAction)callBtn:(id)sender;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) Annotation *newlyAnn;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactLabel;
@property (weak, nonatomic) IBOutlet UILabel *professionLabel;

- (IBAction)backBtn:(id)sender;
- (IBAction)gotoBtn:(id)sender;

@end
