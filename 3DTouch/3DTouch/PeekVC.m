//
//  PeekVC.m
//  3DTouch
//
//  Created by X on 2017/9/23.
//  Copyright © 2017年 ~X~. All rights reserved.
//

#import "PeekVC.h"


@interface PeekVC ()


@end

@implementation PeekVC

- (void)viewDidLoad {
    
    [super viewDidLoad];

   
    

}


-  (void)setShowText:(NSString *)showText
{
    _showText = showText;
  
    
    //-- 添加label的这段代码写在，viewdidload当中 测试已经执行，但是3dTouch没有效果，在这里有效果，暂时没有找到原因
    UILabel *label = [[UILabel alloc]initWithFrame:self.view.bounds];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.font = [UIFont systemFontOfSize:33];
    
    label.textColor = [UIColor greenColor];
    
    label.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:label];
  
    label.text = showText;
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [self dismissViewControllerAnimated:YES completion:nil];

}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{

    UIPreviewAction *action_01 = [UIPreviewAction actionWithTitle:@"Hello!" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
       
        NSLog(@"click Hello");
        
        
    }];

    UIPreviewAction *action_02 = [UIPreviewAction actionWithTitle:@"Hello22!" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"click Hello22");
        
        
    }];
    UIPreviewAction *action_03 = [UIPreviewAction actionWithTitle:@"Hello33!" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"click Hello33");
        
        
    }];
    
    UIPreviewActionGroup *actionGroup = [UIPreviewActionGroup actionGroupWithTitle:@"这是一组可选的操作" style:UIPreviewActionStyleDestructive actions:@[action_02, action_03]];
    

    return @[action_01,actionGroup];
}


@end
