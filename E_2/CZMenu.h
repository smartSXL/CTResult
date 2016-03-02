//
//  CZMenu.h
//  E_2
//
//  Created by Alvechen on 14-9-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZMenu;

@protocol CZMenuDelegate <NSObject>

- (void)menu:(CZMenu *)menu didSelectedIndex:(NSInteger)index;

@end


@interface CZMenu : UIView
/**
 *  当前是否显示
 */
@property (nonatomic,assign,getter = isShow) BOOL show;
/**
 *  代理
 */
@property (nonatomic,weak) id<CZMenuDelegate> delegate;

+ (instancetype)menu;

@end
