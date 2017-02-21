//
//  VRNavigationView.m
//  CustomNavBar
//
//  Created by VINTISH ROMAN on 2/21/17.
//  Copyright © 2017 Roman Vintish. All rights reserved.
//

#import "VRNavigationView.h"


NSString const *kDefaultLeftButtonImage = @"green-back-button-png-image-69590.png";

@interface VRNavigationView()

@property(nonatomic, weak) IBOutlet UIButton *leftButton;
@property(nonatomic, weak) IBOutlet UIButton *rightButton;
@property(nonatomic, weak) IBOutlet UILabel *title;
@property(nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation VRNavigationView

- (void)drawRect:(CGRect)rect {
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
    if ([self.barDataSource respondsToSelector:@selector(getNavigationBarTitle)])
    {
        if ([self.barDataSource getNavigationBarTitle] != nil)
        {
            if ([[self.barDataSource getNavigationBarTitle] isKindOfClass:[NSString class]])
            {
                self.title.text = [self.barDataSource getNavigationBarTitle];
            }
        }
    }
    
    if ([self.barDataSource respondsToSelector:@selector(getNavigationBarBackgroundColor)])
    {
        if ([self.barDataSource getNavigationBarBackgroundColor] != nil)
        {
            if ([[self.barDataSource getNavigationBarBackgroundColor] isKindOfClass:[UIColor class]])
            {
                self.backgroundColor = [self.barDataSource getNavigationBarBackgroundColor];
            }
        }
    }
    else
    {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    
    if ([self.barDataSource respondsToSelector:@selector(getNavigationBarBackgroundImage)])
    {
        if ([self.barDataSource getNavigationBarBackgroundImage] != nil)
        {
            if ([[self.barDataSource getNavigationBarBackgroundImage] isKindOfClass:[UIImage class]])
            {
                self.imageView.image = [self.barDataSource getNavigationBarBackgroundImage];
            }
        }
    }
    
    if ([self.barDataSource respondsToSelector:@selector(getLeftBarButtonItemBackgroundImage)])
    {
        if([self.barDataSource getLeftBarButtonItemBackgroundImage] != nil)
        {
            if ([[self.barDataSource getLeftBarButtonItemBackgroundImage] isKindOfClass:[UIImage class]])
            {
                [self.leftButton setBackgroundImage:[self.barDataSource getLeftBarButtonItemBackgroundImage] forState:UIControlStateNormal];
            }
        }
        else
        {
            if ([UIImage imageNamed:kDefaultLeftButtonImage] != nil)
            {
            [self.leftButton setBackgroundImage:[UIImage imageNamed:kDefaultLeftButtonImage] forState:UIControlStateNormal];
            }
        }
    }
    else
    {
        if ([UIImage imageNamed:kDefaultLeftButtonImage] != nil)
        {
            [self.leftButton setBackgroundImage:[UIImage imageNamed:kDefaultLeftButtonImage] forState:UIControlStateNormal];
        }
    }
    
    if ([self.barDataSource respondsToSelector:@selector(getRightBarButtonItemBackgroundImage)])
    {
        if([self.barDataSource getRightBarButtonItemBackgroundImage] != nil)
        {
            if ([[self.barDataSource getRightBarButtonItemBackgroundImage] isKindOfClass:[UIImage class]])
            {
                [self.rightButton setBackgroundImage:[self.barDataSource getRightBarButtonItemBackgroundImage] forState:UIControlStateNormal];
            }
        }
    }
}


@end
