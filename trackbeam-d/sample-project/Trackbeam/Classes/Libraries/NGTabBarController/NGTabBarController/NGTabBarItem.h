//
//  NGTabBarItem.h
//  NGTabBarController
//
//  Created by Tretter Matthias on 24.04.12.
//  Copyright (c) 2012 NOUS Wissensmanagement GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NGTabBarItem : UIControl

@property (nonatomic, strong)   UIImage *image;
@property (nonatomic, strong)   UIImage *selectedImage;
@property (nonatomic)           CGFloat  imageOffset;

@property (nonatomic, copy)     NSString *title;
@property (nonatomic, strong)   UIColor *selectedImageTintColor;
@property (nonatomic, strong)   UIColor *titleColor;
@property (nonatomic, strong)   UIColor *selectedTitleColor;

@property (nonatomic, strong)   UIFont *titleFont;

+ (NGTabBarItem *)itemWithTitle:(NSString *)title;
+ (NGTabBarItem *)itemWithTitle:(NSString *)title image:(UIImage *)image;

- (void)setSize:(CGSize)size;

@end
