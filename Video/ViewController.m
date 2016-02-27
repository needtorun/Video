//
//  ViewController.m
//  Video
//
//  Created by apple on 16/2/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "RootNavigationController.h"
#import "MyView1.h"
#import "MyView2.h"
#import "MyView3.h"
#import "MyView4.h"
#import "MyView5.h"
#import "MyView6.h"
@interface ViewController ()
{
    UIScrollView *_mainScrollView ;
    UIScrollView *_titleScrollView;
    NSArray *_mainArray;
    NSArray *_views;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  _mainArray =@[@"热门",@"动画",@"搞笑",@"美女",@"音乐",@"体育",@"动作",@"模仿"];
  _views =@[[MyView1 new],[MyView2 new],[MyView3 new],[MyView4 new],[MyView5 new],[MyView6 new]];
//    self.navigationController.navigationBarHidden = YES;
    [self creatTitleScrollView];
    [self creatMainScrollView];
    
}



//视图展示的ScrollView
-(void)creatMainScrollView{
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,WIDTH, HEIGHT-64)];
    _mainScrollView.contentSize = CGSizeMake(WIDTH * _mainArray.count, HEIGHT-64);
    NSLog(@"MY%f YOU%f",HEIGHT,self.view.frame.size.height);
    _mainScrollView.bounces = NO;
    _mainScrollView.pagingEnabled = YES;
//    _mainScrollView.showsHorizontalScrollIndicator=NO;
//    _mainScrollView.showsVerticalScrollIndicator = y;
    for (int i = 0; i<_views.count; i++) {
      
        UIView *mainView =_views[i];
        mainView.tag = 100+i;
        
        mainView.frame =CGRectMake(i*WIDTH,0,i*WIDTH+WIDTH, HEIGHT-64);

        [ _mainScrollView addSubview:mainView];
    }
   
    [self.view addSubview:_mainScrollView];
}

//按钮的scrollView
-(void)creatTitleScrollView{
    //创建UIScrollView滑动
    _titleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,WIDTH, 44)];
     _titleScrollView.contentSize = CGSizeMake(WIDTH * 2, 44);
     _titleScrollView.bounces = NO;
    _titleScrollView.showsHorizontalScrollIndicator=NO;

    for (int i = 0; i<_mainArray.count; i++) {
        UIButton *mainButton =[UIButton buttonWithType:UIButtonTypeSystem];
        mainButton.tag = 10+i;
        mainButton.frame =CGRectMake(i*(WIDTH-35)/4+i*10, 0,(WIDTH-35)/4, 44);
        
        mainButton.backgroundColor = [UIColor redColor];
        
        [mainButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [mainButton setTitle:_mainArray[i] forState:UIControlStateNormal];
        [mainButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [ _titleScrollView addSubview:mainButton];
        if (mainButton.tag ==10) {
             [mainButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
    
    self.navigationItem.titleView = _titleScrollView;

}
//按钮的点击事件
-(void)buttonClick:(UIButton *)btn{
    for (int i = 10; i<18; i++) {
         UIButton *myButton =(UIButton *)[self.navigationItem.titleView viewWithTag:i];
    
        [myButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        if (btn.tag ==i) {
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            _mainScrollView.contentOffset = CGPointMake(WIDTH*(btn.tag-10), 0);

        }
    }
//    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
