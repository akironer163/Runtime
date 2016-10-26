//
//  NSObject+Runtime.h
//  Runtime
//
//  Created by user on 16/10/26.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Runtime)


/**
 给定义个字典，创建self类对应的对象

 @param dict 字典

 @return 对象
 */
+ (instancetype)rr_objWithDict:(NSDictionary *)dict;

/**
 获取类的属性列表数组

 @return 类的属性列表数组
 */
+ (NSArray *)rr_objProperties;

@end
