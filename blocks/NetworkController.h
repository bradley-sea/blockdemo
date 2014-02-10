//
//  NetworkController.h
//  blocks
//
//  Created by Brad on 2/9/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkController : NSObject

- (void)downloadPictureWithCompletion:(void (^)(UIImage*))callbackBlock;

@end
