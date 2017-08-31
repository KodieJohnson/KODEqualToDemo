//
//  KODShoppingVc.m
//  KODMemoryHelper
//
//  Created by KODIE on 2017/8/29.
//  Copyright © 2017年 kodie. All rights reserved.
//

#import "ViewController.h"
#import "KODCategoryTableViewCell.h"
#import "KODKCategoryCollectionViewCell.h"
#import "UIColor+KODColorHex.h"
#import "Masonry.h"

#define kCategoryTableViewCellID @"kCategoryTableViewCellID"
#define kCategoryCollectionViewCellID @"kCategoryCollectionViewCellID"
#define kCategoryCollecitonViewHeaderViewID @"kCategoryCollecitonViewHeaderViewID"
#define kCategoryCollecitonViewFooterViewID @"kCategoryCollecitonViewFooterViewID"

#define kCategoryTableViewWidth 90
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kCategoryTableViewWidthFactor (90.0 / 375.0)
#define kDeviceFactor ([UIScreen mainScreen].bounds.size.width / 375.0)

#define kNavigationBarHeight 64

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic, weak) UILabel *selectedLabel;
@property(nonatomic, weak) UITableView *categoryTableView;
@property(nonatomic, weak) UICollectionView *categoryCollectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initConfig];
    [self configCategoryTableView];
    [self configCategoryCollectionView];
}

- (void)initConfig{
    self.title = @"欢乐购物";
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f3f5f7"];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)configCategoryTableView{
    UITableView *categoryTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    categoryTableView.backgroundColor = [UIColor colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:categoryTableView];
    _categoryTableView = categoryTableView;
    
    categoryTableView.delegate = self;
    categoryTableView.dataSource = self;
    
    [categoryTableView registerClass:[KODCategoryTableViewCell class] forCellReuseIdentifier:kCategoryTableViewCellID];
    
    CGFloat categoryTableViewWidth = kCategoryTableViewWidth * kDeviceFactor;
    
    //categoryTableViewWidth = [self convertTheFloatNum:categoryTableViewWidth];
    
    [categoryTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.width.mas_equalTo(categoryTableViewWidth);
        make.height.mas_equalTo(self.view).mas_offset(- kNavigationBarHeight);
    }];
    
    categoryTableView.tableFooterView = [[UIView alloc]init];
    categoryTableView.separatorInset = UIEdgeInsetsZero;
}

- (void)configCategoryCollectionView{
    CGFloat collectionViewSectionInsetLeft = 10;
    CGFloat collectionViewSectionInsetRight = 10;
    CGFloat collectionViewSectionInsetTop = 10;
    CGFloat collectionViewSectionInsetBottom = 0;
    CGFloat collectionView2TableViewMargin = 0;
    CGFloat itemNums = 3;
    CGFloat minimumLineAndInteritemSpacing = 7;
    CGSize  headerReferenceSize = CGSizeMake(100, 25);
    CGSize  footerReferenceSize = CGSizeMake(100, 15);
    
    CGFloat categoryTableViewWidth = kCategoryTableViewWidth * kDeviceFactor;
    
    //categoryTableViewWidth = [self convertTheFloatNum:categoryTableViewWidth];
    
    CGFloat itemSizeWidth = (kScreenWidth - categoryTableViewWidth - collectionViewSectionInsetLeft - collectionViewSectionInsetRight - collectionView2TableViewMargin - minimumLineAndInteritemSpacing * (itemNums - 1))/ itemNums;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(itemSizeWidth, itemSizeWidth);
    flowLayout.minimumLineSpacing = minimumLineAndInteritemSpacing;
    flowLayout.minimumInteritemSpacing = minimumLineAndInteritemSpacing;
    flowLayout.headerReferenceSize = headerReferenceSize;
    flowLayout.footerReferenceSize = footerReferenceSize;
    flowLayout.sectionInset = UIEdgeInsetsMake(collectionViewSectionInsetTop, collectionViewSectionInsetLeft, collectionViewSectionInsetBottom, collectionViewSectionInsetRight);
    UICollectionView *categoryCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    categoryCollectionView.backgroundColor = [UIColor colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:categoryCollectionView];
    _categoryCollectionView = categoryCollectionView;
    
    categoryCollectionView.delegate = self;
    categoryCollectionView.dataSource = self;
    
    [categoryCollectionView registerClass:[KODKCategoryCollectionViewCell class] forCellWithReuseIdentifier:kCategoryCollectionViewCellID];
    
    [categoryCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_categoryTableView.mas_right).mas_offset(collectionView2TableViewMargin);
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(self.view).mas_offset(- kNavigationBarHeight);
    }];
    
    [categoryCollectionView registerClass:[UICollectionReusableView class]   forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kCategoryCollecitonViewHeaderViewID];
    [categoryCollectionView registerClass:[UICollectionReusableView class]   forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kCategoryCollecitonViewFooterViewID];
}

#pragma mark - 数据源方UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    KODCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCategoryTableViewCellID forIndexPath:indexPath];
    cell.titleText = @"招牌套餐";
    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.selectedLabel) {
        self.selectedLabel.textColor = [UIColor colorWithHexString:@"#313333"];
        self.selectedLabel.backgroundColor = [UIColor whiteColor];
    }
    KODCategoryTableViewCell *cell = (KODCategoryTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    self.selectedLabel = cell.mainLabel;
    self.selectedLabel.textColor = [UIColor redColor];
    self.selectedLabel.backgroundColor = [UIColor clearColor];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    KODKCategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCategoryCollectionViewCellID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.titleText = @"一元抢";
    return cell;
}
#pragma mark - UICollectionViewDelegate
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kCategoryCollecitonViewHeaderViewID forIndexPath:indexPath];
        UILabel *headerLabel = [[UILabel alloc]init];
        headerLabel.frame = CGRectMake(10, 0, 100, 25);
        headerLabel.backgroundColor = [UIColor clearColor];
        headerLabel.text = @"品牌坊";
        headerLabel.textColor = [UIColor blackColor];
        headerLabel.textAlignment = NSTextAlignmentLeft;
        headerLabel.font = [UIFont systemFontOfSize:14];
        [header addSubview:headerLabel];
        return header;
    }
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kCategoryCollecitonViewFooterViewID forIndexPath:indexPath];
        UILabel *footerLabel = [[UILabel alloc]init];
        footerLabel.frame = CGRectMake(0, 0, 100, 15);
        footerLabel.backgroundColor = [UIColor clearColor];
        footerLabel.textAlignment = NSTextAlignmentLeft;
        footerLabel.font = [UIFont systemFontOfSize:14];
        [footer addSubview:footerLabel];
        return footer;
    }
    return nil;
}

#pragma mark - private methods
- (CGFloat)convertTheFloatNum:(CGFloat)number{
    if (number - (int)number >= 0.75) {
        number = (int)number + 1.0;
    }else if(number - (int)number >= 0.25 ) {
        number = (int)number + 0.5;
    }else{
        number = (int)number + 0.0;
    }
    return number;
}

@end
