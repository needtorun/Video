//
//  MyView4.m
//  Video
//
//  Created by apple on 16/2/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MyView4.h"
#import "MyTableViewCell.h"
#import "MJRefresh/MJRefresh.h"
@implementation MyView4

{
    NSMutableArray *_array;
//    UITableView *_tableView ;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        _array = [[NSMutableArray alloc] init];
        
        for (int i = 0; i<20; i++) {
            
            NSString *numA = [NSString stringWithFormat:@"d%d",i];
            [_array addObject:numA];
        }
        
        [self creatTableView];
        [self creatRefresh];
        
    }
    return self;
}
-(void)creatRefresh{
    [_tableView addHeaderWithTarget:self action:@selector(headRefresh)];
    
    [_tableView addFooterWithTarget:self action:@selector(footRefresh)];
}
-(void)headRefresh{
//    [_dataArray removeAllObjects];
//    _page = 1;
//    [self creatData];
    [_tableView headerEndRefreshing];
}
-(void)footRefresh{
//    _page++;
//    [self creatData];
    [_tableView footerEndRefreshing];
    
}

-(void)creatTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,WIDTH, HEIGHT-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"mycell"];
    [self addSubview:_tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTableViewCell *mycell = [tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    if (_array.count>0) {
        NSString *str = _array[indexPath.row];
        
        [mycell configCellWithModel:str];
    }
    
    return mycell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 90.0f;
}


@end
