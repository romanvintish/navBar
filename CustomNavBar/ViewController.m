//
//  ViewController.m
//  CustomNavBar
//
//  Created by VINTISH ROMAN on 2/21/17.
//  Copyright © 2017 Roman Vintish. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - VRNavigationDataSource

- (NSString*)cellForNavigationBarTitle{
    return @"ASDADADASDADADASDADADASDADADASDADADASDADADA";
}

- (UIColor*)cellForNavigationBarBackgroundColor{
    return [UIColor redColor];
}

- (UIImage*)cellForNavigationBarBackgroundImage{
    return [UIImage imageNamed:@"wood+pattern+texture+7.jpg"];
}

- (UIImage*)cellForLeftBarButtonItemBackgroundImage{
    //return [UIImage imageNamed:@"iTunes.png"];
    return nil;
}

- (UIImage*)cellForRightBarButtonItemBackgroundImage{
    return [UIImage imageNamed:@"Mail2.png"];
}

#pragma mark - VRNavigationDelegate 

- (void)didSelectLeftBarButtonItem{
    NSLog(@"left");
}

- (void)didSelectRightBarButtonItem{
    NSLog(@"right");

}

@end
