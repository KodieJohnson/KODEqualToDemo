//
//  KODKCategoryCollectionViewCell.m
//  KODMemoryHelper
//
//  Created by KODIE on 2017/8/30.
//  Copyright © 2017年 kodie. All rights reserved.
//

#import "KODKCategoryCollectionViewCell.h"
#import "UIColor+KODColorHex.h"
#import "Masonry.h"

@interface KODKCategoryCollectionViewCell ()
@property(nonatomic, weak) UILabel *mainLabel;
@end

@implementation KODKCategoryCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.layer.contentsScale = [UIScreen mainScreen].scale;
    self.layer.shadowOpacity = 0.35f;
    self.layer.shadowRadius = 4.0f;
    self.layer.shadowOffset = CGSizeMake(0,5);
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
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
