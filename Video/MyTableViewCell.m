//
//  MyTableViewCell.m
//  ssssssss
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //清理图片缓存
        //        [[SDImageCache sharedImageCache]cleanDisk];
        [self creatUI];
    }
    
    return self;
}
-(void)creatUI{

    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 10, 200, 20)];
    
    [self.contentView addSubview:self.nameLabel];
}
-(void)configCellWithModel:(NSString *)model{
    
    self.nameLabel.text = model;
    
    //加载网络图片的知识点
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
