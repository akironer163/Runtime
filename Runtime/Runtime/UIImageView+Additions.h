//
//  UIImageView+Additions.h
//  Runtime
//
//  Created by user on 16/10/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Additions)

// SDWebImage URL 的属性
// 如果在分类中定义存储型，需要手动实现 getter & setter 方法
@property (nonatomic, strong) NSURL *url;

@end
