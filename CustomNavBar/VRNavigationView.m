//
//  VRNavigationView.m
//  CustomNavBar
//
//  Created by VINTISH ROMAN on 2/21/17.
//  Copyright © 2017 Roman Vintish. All rights reserved.
//

#import "VRNavigationView.h"

@interface VRNavigationView()

@property(nonatomic, strong) IBOutlet UIButton *leftButton;
@property(nonatomic, strong) IBOutlet UIButton *rightButton;
@property(nonatomic, strong) IBOutlet UILabel *title;
@property(nonatomic, strong) IBOutlet UIImageView *imageView;

@end

@implementation VRNavigationView

- (void)drawRect:(CGRect)rect {
    // Drawing code
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setupAppearance];
}

- (IBAction)leftButtonTapped:(id)sender{
    if ([self.barDelegate respondsToSelector:@selector(didSelectLeftBarButtonItem)] && self.leftButton.currentBackgroundImage!=nil)
    {
        [self.barDelegate didSelectLeftBarButtonItem];
    }
}

- (IBAction)rightButtonTapped:(id)sender{
    if ([self.barDelegate respondsToSelector:@selector(didSelectRightBarButtonItem)] && self.rightButton.currentBackgroundImage!=nil)
    {
        [self.barDelegate didSelectRightBarButtonItem];
    }
}

-(void)setupAppearance{
    if ([self.barDataSource respondsToSelector:@selector(cellForNavigationBarTitle)])
    {
        self.title.text = [self.barDataSource cellForNavigationBarTitle];
    }
    
    if ([self.barDataSource respondsToSelector:@selector(cellForNavigationBarBackgroundColor)])
    {
        self.backgroundColor = [self.barDataSource cellForNavigationBarBackgroundColor];
    }
    else{
        self.backgroundColor = [UIColor lightGrayColor];
    }
    
    if ([self.barDataSource respondsToSelector:@selector(cellForNavigationBarBackgroundImage)])
    {
        self.imageView.image = [self.barDataSource cellForNavigationBarBackgroundImage];
    }
    
    if ([self.barDataSource respondsToSelector:@selector(cellForLeftBarButtonItemBackgroundImage)])
    {
        if([self.barDataSource cellForLeftBarButtonItemBackgroundImage] != nil)
        {
        [self.leftButton setBackgroundImage:[self.barDataSource cellForLeftBarButtonItemBackgroundImage] forState:UIControlStateNormal];
        }
        else
        {
            [self.leftButton setBackgroundImage:[UIImage imageNamed:@"green-back-button-png-image-69590"] forState:UIControlStateNormal];
        }
    }
    
    if ([self.barDataSource respondsToSelector:@selector(cellForRightBarButtonItemBackgroundImage)])
    {
        [self.rightButton setBackgroundImage:[self.barDataSource cellForRightBarButtonItemBackgroundImage] forState:UIControlStateNormal];
    }
}

@end
