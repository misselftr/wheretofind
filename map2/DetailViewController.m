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
#import "Annotation.h"

@interface DetailViewController ()
{
    Location *_selectedLocation;
    HomeModel *_homeModel;
    Annotation *_myAnn;
}

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   // _homeModel = [[HomeModel alloc] init];
    _homeModel = [[HomeModel alloc] init];
  //  _homeModel.delegate = self;
   [_homeModel downloadItems];
    
    
    
    _nameLabel.text = _newlyAnn.title;
    _addressLabel.text = _newlyAnn.subtitle;
    
}

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

- (IBAction)shareButton:(id)sender {
}

- (IBAction)goButton:(id)sender {
}
@end
