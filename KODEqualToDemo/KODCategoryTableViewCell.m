//
//  KODCategoryTableViewCell.m
//  KODMemoryHelper
//
//  Created by KODIE on 2017/8/30.
//  Copyright © 2017年 kodie. All rights reserved.
//

#import "KODCategoryTableViewCell.h"
#import "UIColor+KODColorHex.h"
#import "Masonry.h"

@interface KODCategoryTableViewCell ()
@end

@implementation KODCategoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupUI];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSeparatorStyleNone;
    
    UILabel *mainLabel = [[UILabel alloc]init];
    mainLabel.backgroundColor = [UIColor whiteColor];
    mainLabel.text = @"";
    mainLabel.textColor = [UIColor colorWithHexString:@"#313333"];
    mainLabel.textAlignment = NSTextAlignmentCenter;
    mainLabel.font = [UIFont systemFontOfSize:14];
    _mainLabel = mainLabel;
    
    [self addSubview:mainLabel];
    
    [mainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
}

- (void)setTitleText:(NSString *)titleText{
    _titleText = titleText;
    _mainLabel.text = titleText;
}

@end
