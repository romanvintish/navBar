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
@property(nonatomic) UIView *bottomView;

@end

@implementation VRNavigationView

-(void)setBarDelegate:(id<VRNavigationDelegate>)barDelegate
{
    _barDelegate = barDelegate;
    [self setupAppearance];
}

-(void)setBarDataSource:(id<VRNavigationDataSource>)barDataSource
{
    _barDataSource = barDataSource;
    [self setupAppearance];
}

#pragma mark - init

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setupAppearance];
}

-(instancetype)init
{
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    self = [self initWithFrame:CGRectMake(0, 0, width, height/7)];
    return self;
}

-(instancetype)initWithHeight:(CGFloat)height
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    self = [self initWithFrame:CGRectMake(0, 0, width, height)];
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addViewsAndConstraints];
        [self setupAppearance];
    }
    return self;
}

#pragma mark - views&constraints

-(void)addViewsAndConstraints
{
    [self addImage];
    [self addBottomView];
    [self addRightButton];
    [self addLeftButton];
    [self addTitle];
}

-(void)addImage
{
    UIImageView *imageView = [[UIImageView alloc] init];
    self.imageView = imageView;
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:self.imageView];
    
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.imageView
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeTop
                         multiplier:1.0
                         constant:0.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.imageView
                         attribute:NSLayoutAttributeBottom
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:0.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.imageView
                         attribute:NSLayoutAttributeLeft
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeLeft
                         multiplier:1.0
                         constant:0.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.imageView
                         attribute:NSLayoutAttributeRight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeRight
                         multiplier:1.0
                         constant:0.0]];
}

-(void)addBottomView
{
    self.bottomView = [[UIView alloc] init];
    self.bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.bottomView];
    
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bottomView
                         attribute:NSLayoutAttributeTop
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeTop
                         multiplier:1.0
                         constant:20.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bottomView
                         attribute:NSLayoutAttributeBottom
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:0.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bottomView
                         attribute:NSLayoutAttributeLeft
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeLeft
                         multiplier:1.0
                         constant:0.0]];
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.bottomView
                         attribute:NSLayoutAttributeRight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeRight
                         multiplier:1.0
                         constant:0.0]];
}

-(void)addRightButton
{
    UIButton *rbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton = rbutton;
    self.rightButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.rightButton addTarget:self action:@selector(rightButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:self.rightButton];
    
    
    
    [self.bottomView addConstraint:[NSLayoutConstraint
                                    constraintWithItem:self.rightButton
                                    attribute:NSLayoutAttributeWidth
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.bottomView
                                    attribute:NSLayoutAttributeWidth
                                    multiplier:0.106
                                    constant:0]];
    
    [self.rightButton addConstraint:[NSLayoutConstraint
                                     constraintWithItem:self.rightButton
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self.rightButton
                                     attribute:NSLayoutAttributeWidth
                                     multiplier:1.0
                                     constant:0]];
    
    [self.bottomView addConstraint:[NSLayoutConstraint
                                    constraintWithItem:self.rightButton
                                    attribute:NSLayoutAttributeRight
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.bottomView
                                    attribute:NSLayoutAttributeRight
                                    multiplier:1.0
                                    constant:-5.0]];
    
    [self.bottomView addConstraint:[NSLayoutConstraint
                                    constraintWithItem:self.rightButton
                                    attribute:NSLayoutAttributeCenterY
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.bottomView
                                    attribute:NSLayoutAttributeCenterY
                                    multiplier:1.0
                                    constant:0.0]];
}

-(void)addLeftButton
{
    UIButton *lbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton = lbutton;
    self.leftButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.leftButton addTarget:self action:@selector(leftButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:self.leftButton];
    
    [self.bottomView addConstraint:[NSLayoutConstraint
                                    constraintWithItem:self.leftButton
                                    attribute:NSLayoutAttributeWidth
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.bottomView
                                    attribute:NSLayoutAttributeWidth
                                    multiplier:0.106
                                    constant:0]];
    
    [self.leftButton addConstraint:[NSLayoutConstraint
                                    constraintWithItem:self.leftButton
                                    attribute:NSLayoutAttributeHeight
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.leftButton
                                    attribute:NSLayoutAttributeWidth
                                    multiplier:1.0
                                    constant:0]];
    
    [self.bottomView addConstraint:[NSLayoutConstraint
                                    constraintWithItem:self.leftButton
                                    attribute:NSLayoutAttributeLeft
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.bottomView
                                    attribute:NSLayoutAttributeLeft
                                    multiplier:1.0
                                    constant:5.0]];
    
    [self.bottomView addConstraint:[NSLayoutConstraint
                                    constraintWithItem:self.leftButton
                                    attribute:NSLayoutAttributeCenterY
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.bottomView
                                    attribute:NSLayoutAttributeCenterY
                                    multiplier:1.0
                                    constant:0.0]];
}

-(void)addTitle
{
    UILabel *title = [[UILabel alloc] init];
    self.title = title;
    self.title.translatesAutoresizingMaskIntoConstraints = NO;
    self.title.textAlignment = NSTextAlignmentCenter;
    self.title.adjustsFontSizeToFitWidth = YES;
    self.title.minimumScaleFactor = 0.7;
    [self.bottomView addSubview:self.title];
    
    [self.bottomView addConstraint:[NSLayoutConstraint
                                    constraintWithItem:self.title
                                    attribute:NSLayoutAttributeLeft
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.leftButton
                                    attribute:NSLayoutAttributeRight
                                    multiplier:1.0
                                    constant:5.0]];
    
    [self.bottomView addConstraint:[NSLayoutConstraint
                                    constraintWithItem:self.title
                                    attribute:NSLayoutAttributeRight
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.rightButton
                                    attribute:NSLayoutAttributeLeft
                                    multiplier:1.0
                                    constant:-5.0]];
    
    [self.bottomView addConstraint:[NSLayoutConstraint
                                    constraintWithItem:self.title
                                    attribute:NSLayoutAttributeTop
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.rightButton
                                    attribute:NSLayoutAttributeTop
                                    multiplier:1.0
                                    constant:0]];
    
    [self.bottomView addConstraint:[NSLayoutConstraint
                                    constraintWithItem:self.title
                                    attribute:NSLayoutAttributeBottom
                                    relatedBy:NSLayoutRelationEqual
                                    toItem:self.rightButton
                                    attribute:NSLayoutAttributeBottom
                                    multiplier:1.0
                                    constant:0]];
}

#pragma mark - actions

- (IBAction)leftButtonTapped:(id)sender
{
    if ([self.barDelegate respondsToSelector:@selector(didSelectLeftBarButtonItem)] && self.leftButton.currentBackgroundImage!=nil)
    {
        [self.barDelegate didSelectLeftBarButtonItem];
    }
}

- (IBAction)rightButtonTapped:(id)sender
{
    if ([self.barDelegate respondsToSelector:@selector(didSelectRightBarButtonItem)] && self.rightButton.currentBackgroundImage!=nil)
    {
        [self.barDelegate didSelectRightBarButtonItem];
    }
}

#pragma mark - setup

-(void)setupAppearance
{
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
