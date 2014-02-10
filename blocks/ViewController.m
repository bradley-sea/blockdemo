//
//  ViewController.m
//  blocks
//
//  Created by Brad on 2/9/14.
//  Copyright (c) 2014 Brad. All rights reserved.
//

#import "ViewController.h"
#import "NetworkController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (strong,nonatomic) NetworkController *netController;
@property (nonatomic,copy) void (^testblock)(int);


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.netController = [NetworkController new];
    
    self.testblock =^(int num){ NSLog(@"%d", num); };
                         
    
    self.testblock(3);
    
//    //showing how a block only captures the value of a local variable
//    int anInteger = 42;
//    
//    void (^testBlock)(void) = ^{
//        NSLog(@"Integer is: %i", anInteger);
//    };
//    
//    anInteger = 84;
//    
//    testBlock();
    
    //using __block so the variable shares its storage and also modify the value
    
    __block int anInteger = 42;
    
    void (^testBlock)(void) = ^{
        NSLog(@"Integer is: %i", anInteger);
        anInteger = 100; //shows u can modify the value inside
    };
    
    anInteger = 84;
    
    testBlock();
    
     NSLog(@"Value of original variable is now: %i", anInteger);//shows that the original variable was changed in the block

    
    //plugging a local block into a completion block
//    self.view.alpha = 0;
//    self.view.backgroundColor = [UIColor redColor];
//    
//    void (^myblock)(BOOL) = ^(BOOL success) {
//        if(success) NSLog(@" success!!!");
//    };
//    
//    [UIView animateWithDuration:2 animations:^{
//        self.view.alpha = 1;
//    } completion:myblock];
    
    [self fetchPicture];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)fetchPicture
{
    [self.indicator startAnimating];
    
    [self.netController downloadPictureWithCompletion:^(UIImage * pic) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = pic;
            [self.indicator stopAnimating];
        }];
            }];
}



@end
