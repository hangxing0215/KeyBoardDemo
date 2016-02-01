//
//  KeyboardTabbar.m
//  键盘练习
//
//  Created by admin on 16/1/27.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "KeyboardTabbar.h"

@implementation KeyboardTabbar





- (IBAction)previous:(id)sender
{
    NSLog(@"%s",__func__);
    
    if ([self.toolBarDelegate respondsToSelector:@selector(keyboardTabbar:didClickItem:)]) {
        //
        [self.toolBarDelegate keyboardTabbar:self didClickItem:KeyboardTabbarItemPre];
    }
    
}
- (IBAction)next:(id)sender
{
    NSLog(@"%s",__func__);
    if ([self.toolBarDelegate respondsToSelector:@selector(keyboardTabbar:didClickItem:)]) {
        //
        [self.toolBarDelegate keyboardTabbar:self didClickItem:KeyboardTabbarItemNext];
    }
}
- (IBAction)down:(id)sender
{
    NSLog(@"%s",__func__);
    if ([self.toolBarDelegate respondsToSelector:@selector(keyboardTabbar:didClickItem:)]) {
        //
        [self.toolBarDelegate keyboardTabbar:self didClickItem:KeyboardTabbarItemDone];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
