//
//  SHCommentViewController.m
//  宋航百思不得姐01
//
//  Created by admin on 16/2/1.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "SHCommentViewController.h"
@interface SHCommentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomViewConstraint;
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SHCommentViewController
- (IBAction)voiceButtonClick:(id)sender {
}
- (IBAction)monkeyButtonClick:(id)sender {
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //设置
    [self setupBasic];
}

- (void)setupBasic
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    self.tableView.delegate = self;
}
- (void)keyboardWillChangeFrame:(NSNotification *)noti
{
    //键盘显示、隐藏完毕的frame
    CGRect frame = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    //修改底部的约束
    self.bottomViewConstraint.constant = [UIScreen mainScreen].bounds.size.height - frame.origin.y;
    //动画时间
    CGFloat duration = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
    }];
}



- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}




@end
