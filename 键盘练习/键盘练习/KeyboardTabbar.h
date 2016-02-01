//
//  KeyboardTabbar.h
//  键盘练习
//
//  Created by admin on 16/1/27.
//  Copyright © 2016年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    KeyboardTabbarItemPre,
    KeyboardTabbarItemNext,
    KeyboardTabbarItemDone
}KeyboardTabbarItem;

@class KeyboardTabbar;

@protocol  KeyboardTabbarDelegate<NSObject>
- (void)keyboardTabbar:(KeyboardTabbar *)keyboardTool didClickItem:(KeyboardTabbarItem)item;
@end
@interface KeyboardTabbar : UIToolbar
@property (weak, nonatomic) IBOutlet UIBarButtonItem *previousItem;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextItem;

@property (nonatomic ,weak)id<KeyboardTabbarDelegate> toolBarDelegate;



@end
