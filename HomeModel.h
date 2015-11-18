//
//  HomeModel.h
//  DBConTest
//
//  Created by ÖZLEM ATABAY on 21.10.2015.
//  Copyright (c) 2015 ÖZLEM ATABAY. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HomeModelProtocol <NSObject>

- (void)itemsDownloaded:(NSArray *)items;

@end

@interface HomeModel : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<HomeModelProtocol> delegate;

- (void)downloadItems;

@end
