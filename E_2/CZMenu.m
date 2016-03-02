//
//  CZMenu.m
//  E_2
//
//  Created by Alvechen on 14-9-21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZMenu.h"

@interface CZMenu()

@property (weak, nonatomic) IBOutlet UIView *itemView;

- (IBAction)menuBtnClick:(UIButton *)sender;

@end

@implementation CZMenu

+ (instancetype)menu
{
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"CZMenu" owner:nil options:nil];
    CZMenu *mene = [array lastObject];
    return mene;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (IBAction)menuBtnClick:(UIButton *)sender {
    
    NSArray *items = self.itemView.subviews;
    
    NSInteger index = [items indexOfObject:sender];
    
    if ([self.delegate respondsToSelector:@selector(menu:didSelectedIndex:)]) {
        [self.delegate menu:self didSelectedIndex:index];
    }
    
    NSLog(@"%ld",index);
}
@end
