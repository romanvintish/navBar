//
//  VRNavigationView.h
//  CustomNavBar
//
//  Created by VINTISH ROMAN on 2/21/17.
//  Copyright © 2017 Roman Vintish. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VRNavigationDelegate <NSObject>

@required

- (void)didSelectLeftBarButtonItem;

@optional

- (void)didSelectRightBarButtonItem;

@end


@protocol VRNavigationDataSource <NSObject>

@optional

- (NSString*)getNavigationBarTitle;
- (UIColor*)getNavigationBarBackgroundColor;
- (UIImage*)getNavigationBarBackgroundImage;
- (UIImage*)getLeftBarButtonItemBackgroundImage;
- (UIImage*)getRightBarButtonItemBackgroundImage;

@end


@interface VRNavigationView : UIView

@property(nonatomic, weak) IBOutlet id<VRNavigationDelegate> barDelegate;
@property(nonatomic, weak) IBOutlet id<VRNavigationDataSource> barDataSource;

-(instancetype)initWithHeight:(CGFloat)height;

@end
