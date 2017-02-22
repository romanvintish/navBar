//
//  ViewController.m
//  CustomNavBar
//
//  Created by VINTISH ROMAN on 2/21/17.
//  Copyright © 2017 Roman Vintish. All rights reserved.
//

#import "ViewController.h"
#import "VRNavigationView.h"

@interface ViewController () <VRNavigationDelegate, VRNavigationDataSource>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    VRNavigationView *navBar = [[VRNavigationView alloc] init];
    navBar.barDelegate = self;
    navBar.barDataSource = self;
    [self.view addSubview:navBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - VRNavigationDataSource

- (NSString*)getNavigationBarTitle
{
    return @"ASDADADASDSADSADASDASdasdasdDASDASDasdasdasdasda";
}

- (UIColor*)getNavigationBarBackgroundColor
{
    return [UIColor redColor];
}

- (UIImage*)getNavigationBarBackgroundImage
{
    return [UIImage imageNamed:@"wood+pattern+texture+7.jpg"];
}

- (UIImage*)getLeftBarButtonItemBackgroundImage
{
    //return [UIImage imageNamed:@"iTunes.png"];
    return nil;
}

- (UIImage*)getRightBarButtonItemBackgroundImage
{
    return [UIImage imageNamed:@"Mail2.png"];
}

#pragma mark - VRNavigationDelegate 

- (void)didSelectLeftBarButtonItem
{
    NSLog(@"left");
}

- (void)didSelectRightBarButtonItem
{
    NSLog(@"right");
}

@end
