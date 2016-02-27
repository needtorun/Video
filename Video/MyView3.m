//
//  MyView3.m
//  Video
//
//  Created by apple on 16/2/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MyView3.h"
#import "MyTableViewCell.h"
@implementation MyView3

{
    NSMutableArray *_array;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self =[super initWithFrame:frame];
    if (self) {
        _array = [[NSMutableArray alloc] init];
        
        for (int i = 0; i<20; i++) {
            
            NSString *numA = [NSString stringWithFormat:@"c%d",i];
            [_array addObject:numA];
        }
        
        [self creatTableView];
        
    }
    return self;
}

-(void)creatTableView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,WIDTH, HEIGHT-64) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"mycell"];
    [self addSubview:tableView];
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
