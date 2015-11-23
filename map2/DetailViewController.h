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

@interface DetailViewController : UIViewController

@property (weak, nonatomic) Annotation *newlyAnn;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactLabel;

- (IBAction)backBtn:(id)sender;

- (IBAction)shareButton:(id)sender;

@end
