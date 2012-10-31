//
//  ViewController.m
//  ruler
//
//  Created by li shuai on 12-10-31.
//  Copyright (c) 2012年 li shuai. All rights reserved.
//

#import "ViewController.h"
#import "Ruler.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Ruler *ruler = [[Ruler alloc] initWithFrame:CGRectMake(0, 100, 320, 200)];
    [self.view addSubview:ruler];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
