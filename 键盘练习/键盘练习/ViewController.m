//
//  ViewController.m
//  键盘练习
//
//  Created by admin on 16/1/27.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ViewController.h"
#import "KeyboardTabbar.h"
#import "SHCommentViewController.h"
@interface ViewController ()<KeyboardTabbarDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;

/** 所有的文本框数组 */
@property (nonatomic, strong) NSArray *fields;

/** 工具条 */
@property (nonatomic, weak) KeyboardTabbar *toolbar;
@end

@implementation ViewController
- (IBAction)showDemo2BtnClick:(id)sender
{
    SHCommentViewController *commentVC = [[SHCommentViewController alloc]init];
    [self.navigationController pushViewController:commentVC animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fields = @[self.textField,self.textField2,self.textField3];
    
    KeyboardTabbar *toolbar = [[NSBundle mainBundle] loadNibNamed:@"KeyboardTabbar" owner:nil options:nil].firstObject;
    toolbar.toolBarDelegate = self;
    self.toolbar = toolbar;
    self.textField.inputAccessoryView = self.toolbar;
    self.textField2.inputAccessoryView = self.toolbar;
    self.textField3.inputAccessoryView = self.toolbar;
    self.textField.delegate = self;
    self.textField2.delegate = self;
    self.textField3.delegate = self;
}

- (void)keyboardTabbar:(KeyboardTabbar *)keyboardTool didClickItem:(KeyboardTabbarItem)item
{
    if (item == KeyboardTabbarItemPre)
    {
        NSUInteger currentIndex = 0;
            for (UIView *view in self.view.subviews) {
                if ([view isFirstResponder]) {
                    currentIndex = [self.fields indexOfObject:view];
                }
            }
            currentIndex--;
        
            [self.fields[currentIndex] becomeFirstResponder];
        
            self.toolbar.previousItem.enabled = (currentIndex != 0);
            self.toolbar.nextItem.enabled = YES;
    }
    else if (item == KeyboardTabbarItemNext)
    {
        NSUInteger currentIndex = 0;
            for (UIView *view in self.view.subviews) {
                if ([view isFirstResponder]) {
                    currentIndex = [self.fields indexOfObject:view];
                }
            }
            currentIndex++;
        
            [self.fields[currentIndex] becomeFirstResponder];
        
            self.toolbar.previousItem.enabled = YES;
            self.toolbar.nextItem.enabled = (currentIndex != self.fields.count - 1);
        

    }
    else if (item == KeyboardTabbarItemDone)
    {
        [self.view endEditing:YES];
    }
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSInteger currentId = [self.fields indexOfObject:textField];
    self.toolbar.previousItem.enabled = (currentId != 0);
    self.toolbar.nextItem.enabled = (currentId != self.fields.count - 1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
