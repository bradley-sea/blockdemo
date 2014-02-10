//
//  NetworkController.m
//  blocks
//
//  Created by Brad on 2/9/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "NetworkController.h"

@implementation NetworkController

- (void)downloadPictureWithCompletion:(void (^)(UIImage*))callbackBlock
{
    NSURL *url = [NSURL URLWithString:@"http://hdrsports.files.wordpress.com/2013/07/seahawks-dbs-hdr1.jpg"];
    
    NSOperationQueue *queue = [NSOperationQueue new];
    [queue addOperationWithBlock:^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        
        callbackBlock(image);
    }];
}

@end
