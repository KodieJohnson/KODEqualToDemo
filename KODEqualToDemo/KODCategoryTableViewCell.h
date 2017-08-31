//
//  KODCategoryTableViewCell.h
//  KODMemoryHelper
//
//  Created by KODIE on 2017/8/30.
//  Copyright © 2017年 kodie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KODCategoryTableViewCell : UITableViewCell
@property(nonatomic, copy) NSString *titleText;
@property(nonatomic, weak) UILabel *mainLabel;
@end
