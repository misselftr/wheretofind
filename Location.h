//
//  Location.h
//  DBConTest
//
//  Created by ÖZLEM ATABAY on 21.10.2015.
//  Copyright (c) 2015 ÖZLEM ATABAY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *phone;

@end
