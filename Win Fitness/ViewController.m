//
//  ViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 27/02/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "ViewController.h"
#import "WFFacebookNewsViewModel.h"
#import <ReactiveObjC.h>

@interface ViewController ()

@property(nonatomic,strong) WFFacebookNewsViewModel *facebookNewsViewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel * newLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 25, 200, 25)];
    [self.view addSubview:newLabel];
    
    WFFacebookServices *FBService = [WFFacebookServices new];
    
    
    self.facebookNewsViewModel = [[WFFacebookNewsViewModel alloc]initWithFacebookServices:FBService];
    
    RAC(newLabel,text) = RACObserve(self.facebookNewsViewModel, firstNewsTitle);
    
    //newLabel.text = self.facebookNewsViewModel.firstNewsTitle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
