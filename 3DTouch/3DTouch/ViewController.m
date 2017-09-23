//
//  ViewController.m
//  3DTouch
//
//  Created by X on 2017/9/23.
//  Copyright © 2017年 ~X~. All rights reserved.
//

#import "ViewController.h"

#import "PeekVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewingDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UITableView *tab = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:tab];
    
    tab.delegate = self;
    
    tab.dataSource = self;
    

}


#pragma mark --tabDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

   
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"3DTouch_%ld",indexPath.row];
    
    
    //-- 控件添加3DTouch功能  注意 必须要判断设备是否支持此功能
    if ([self respondsToSelector:@selector(traitCollection)]) {
        
        if ([self.traitCollection respondsToSelector:@selector(forceTouchCapability)])
        {
            
            if(self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
            {
                
                [self registerForPreviewingWithDelegate:self sourceView:cell];
                
            }
            
        }
        
    }
    
    
    return cell;

}


/**
    第一阶段，当用户轻点你添加的3DTouch功能的控件，系统会自动将控件周围都变的模糊，来响应你的按压，说明这个控件支持3DTouch效果，你不用做额外的操作
 
 */


/**
 *  第二阶段回来到这个代理方法，手势力度递增 对你将要peek的控制器尽心设置
 */
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location NS_AVAILABLE_IOS(9_0)
{
 
    //-- 1 可以直接用sourceVIew获取cell location是你点击的那个点在这个cell坐标系中的位置
    UITableViewCell * cell =  (UITableViewCell *)[previewingContext sourceView];
    
    NSString *title = cell.textLabel.text;
    
    PeekVC *vc = [PeekVC new];
    
    vc.showText = title;
    
//    previewingContext.sourceRect = CGRectMake(550, 0, 10,10); 从哪里冒出来的
    
 
    
    return vc;
    

}

/**
 *  当你的手势力度继续增加的话，回来到第三阶段，可以设置将要显示的控制器，如果你不实现这个代理方法，则不会出现第三阶段
 */
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit NS_AVAILABLE_IOS(9_0)
{


    [self presentViewController:viewControllerToCommit animated:YES completion:nil];

}
















@end
