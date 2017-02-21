//
//  VRNavigationView.h
//  CustomNavBar
//
//  Created by VINTISH ROMAN on 2/21/17.
//  Copyright © 2017 Roman Vintish. All rights reserved.
//

#import <UIKit/UIKit.h>


#import <UIKit/UIKit.h>

@protocol VRNavigationDelegate <NSObject>

@optional

- (void)didSelectLeftBarButtonItem;
- (void)didSelectRightBarButtonItem;

@end


@protocol VRNavigationDataSource <NSObject>

@optional

- (NSString*)cellForNavigationBarTitle;
- (UIColor*)cellForNavigationBarBackgroundColor;
- (UIImage*)cellForNavigationBarBackgroundImage;
- (UIImage*)cellForLeftBarButtonItemBackgroundImage;
- (UIImage*)cellForRightBarButtonItemBackgroundImage;

@end


@interface VRNavigationView : UIView

@property(nonatomic, weak) IBOutlet id<VRNavigationDelegate> barDelegate;
@property(nonatomic, weak) IBOutlet id<VRNavigationDataSource> barDataSource;

@end
