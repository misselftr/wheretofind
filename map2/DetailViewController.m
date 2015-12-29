//
//  DetailViewController.m
//  
//
//  Created by ÖZLEM ATABAY on 18.11.2015.
//
//

#import "DetailViewController.h"
#import "ViewController.h"
#import "HomeModel.h"
#import "Location.h"
#import "MapKit/MapKit.h"


@interface DetailViewController ()
{
    Annotation *myAnn;
}

@end

@implementation DetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mapView.delegate = self;
    _nameLabel.text = _newlyAnn.title;
    _addressLabel.text = _newlyAnn.subtitle;
    _contactLabel.text = _newlyAnn.phone;
    
   /* for (int i=0; (i=_Myitems.count); i++)
    {
        Location *loc = _Myitems[i];
        
        if (_newlyAnn.coordinate.latitude == loc.latitude.doubleValue)
    {
        _contactLabel.text = loc.phone;
    }
    
    }*/
    //koyu mavi
    UIColor *boldblueColour = [[UIColor alloc]initWithRed:51.0/255.0 green:130.0/255.0 blue:171.0/255.0 alpha:1.0];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    self.navigationController.navigationBar.barTintColor = boldblueColour;
    
    self.view.backgroundColor = boldblueColour;
    
    
   MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(_newlyAnn.coordinate, 5000, 5000);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = _newlyAnn.coordinate;
    point.title = _newlyAnn.title;
    point.subtitle = _newlyAnn.subtitle;
    
    [self.mapView addAnnotation:point];
    
    
    //  NSLog(@"Value of string is %@", myAnn.title);




 /*   UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(80,100,160,50);
    [btn setTitle:@"Open placemark" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(openActionSheet:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];*/
    
}

/*-(void)openActionSheet:(id)sender {
    //give the user a choice of Apple or Google Maps
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Open in Maps" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"Apple Maps",@"Google Maps", nil];
    [sheet showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //coordinates for the place we want to display
    CLLocationCoordinate2D dentistLocation = CLLocationCoordinate2DMake(_newlyAnn.coordinate.latitude,_newlyAnn.coordinate.longitude);
    if (buttonIndex==0) {
        //Apple Maps, using the MKMapItem class
        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:dentistLocation addressDictionary:nil];
        MKMapItem *item = [[MKMapItem alloc] initWithPlacemark:placemark];
        item.name = _newlyAnn.title;
        [item openInMapsWithLaunchOptions:nil];
    } else if (buttonIndex==1) {
        //Google Maps
        //construct a URL using the comgooglemaps schema
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"comgooglemaps://?center=%f,%f",dentistLocation.latitude,dentistLocation.longitude]];
        if (![[UIApplication sharedApplication] canOpenURL:url]) {
            NSLog(@"Google Maps app is not installed");
            NSURL *url = [NSURL URLWithString:@"http://maps.google.com/?q=%f%f;_newlyAnn.coordinate.latitude,_newlyAnn.coordinate.longitude"];
            [[UIApplication sharedApplication] openURL:url];
            //left as an exercise for the reader: open the Google Maps mobile website instead!
        } else {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
}*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backBtn:(id)sender {
    
    //dismissVC
   // navigationController?.popViewControllerAnimated(true)
    [self.navigationController popToRootViewControllerAnimated:true];
    
}

- (IBAction)gotoBtn:(id)sender {
    // Check for iOS 6
    
    CLLocationCoordinate2D dentistLocation = CLLocationCoordinate2DMake(_newlyAnn.coordinate.latitude,_newlyAnn.coordinate.longitude);
    
    UIAlertController *view=   [UIAlertController
                                 alertControllerWithTitle:_newlyAnn.title
                                 message:@"Yol tarifi al"
                                 preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *apple = [UIAlertAction
                         actionWithTitle:@"Haritalar"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             //Do some thing here
                             [view dismissViewControllerAnimated:YES completion:nil];
                             //Apple Maps, using the MKMapItem class
                             MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:dentistLocation addressDictionary:nil];
                             MKMapItem *item = [[MKMapItem alloc] initWithPlacemark:placemark];
                             item.name = _newlyAnn.title;
                             [item openInMapsWithLaunchOptions:nil];
                             
                         }];

    
    UIAlertAction *cancel = [UIAlertAction
                             actionWithTitle:@"İptal"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [view dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    
    
    [view addAction:apple];
    [view addAction:cancel];
    [self presentViewController:view animated:YES completion:nil];
    
    
    Class mapItemClass = [MKMapItem class];
    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)])
    {
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder geocodeAddressString:_newlyAnn.title
                     completionHandler:^(NSArray *placemarks, NSError *error) {
                         
                         
                     }];
    }
    
    
}


- (IBAction)callBtn:(id)sender {
    
  // NSString *number = [@"telprompt://" stringByAppendingString:_contactLabel.text];
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:number]];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",_contactLabel.text]]];
    
    
    //   [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt:05306654347"]];
    
    
}

@end
