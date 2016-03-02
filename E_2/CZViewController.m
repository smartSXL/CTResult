
//
//  CZViewController.m
//  E_2
//
//  Created by Alvechen on 14-9-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZViewController.h"
#import "CZMenu.h"

@interface CZViewController ()<CZMenuDelegate>
/**
 *  菜单视图
 */
@property (nonatomic,strong) CZMenu *menuView;
/**
 *  显示选择的菜单Lb
 */
@property (weak, nonatomic) IBOutlet UILabel *showLb;
/**
 *  显示菜单按钮
 */
- (IBAction)menuBtnClick;

@end

@implementation CZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //创建菜单视图
    //[self setupMenuView];
}

/**
 *  创建菜单视图
 */
- (void)setupMenuView
{
    CZMenu *menuView = [CZMenu menu];
    menuView.delegate = self;
    
    CGRect frame = menuView.frame;
    frame.origin.x = -frame.size.width;
    
    menuView.frame = frame;
    self.menuView = menuView;
    [self.view addSubview:menuView];
    
}


- (IBAction)menuBtnClick {
    
    //没有的时候创建
    if (self.menuView == nil)
    {
        [self setupMenuView];
    }
    
    CGRect frame = self.menuView.frame;
    
    if (self.menuView.isShow == NO)
    {
        frame.origin.x = 0;
        self.menuView.show = YES;
    }else
    {
        frame.origin.x = -frame.size.width;
        self.menuView.show = NO;
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        self.menuView.frame = frame;
        
    }];
}

- (void)menu:(CZMenu *)menu didSelectedIndex:(NSInteger)index
{
    self.showLb.text = [NSString stringWithFormat:@"选中了第%ld个",index];
    
    [self menuBtnClick];
}
@end
