//
//  UIImageView+Additions.m
//  Runtime
//
//  Created by user on 16/10/24.
//  Copyright © 2016年 HM. All rights reserved.
//

#import "UIImageView+Additions.h"
#import <objc/runtime.h>

@implementation UIImageView (Additions)

const char *CZ_URL_KEY = "CZ_URL_KEY";

// 使用分类动态添加属性的目的，就在于封装的框架，能够更加易用
// 让使用者不需要对原有的类进行任何的修改，就能够直接使用框架！
// 提示：日常开发，如果要添加属性，仍然需要使用`子类`的方法，因为关联对象的释放周期比较缓慢，会影响性能！
- (NSURL *)url {
    /*
     1. 绑定 url 的对象
     2. 绑定属性的 key
     */
    return objc_getAssociatedObject(self, CZ_URL_KEY);
}

- (void)setUrl:(NSURL *)url {
    // 在分类中不允许使用成员变量来存储属性值
    // 使用关联对象
    /*
     1. 绑定 url 的对象
     2. 绑定属性的 key
     3. 绑定的属性值 url
     4. 对值的引用关系 assign/retain/copy
     
     OBJC_ASSOCIATION_ASSIGN = 0,
     OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1,
     OBJC_ASSOCIATION_COPY_NONATOMIC = 3,
     OBJC_ASSOCIATION_RETAIN = 01401,
     OBJC_ASSOCIATION_COPY = 01
     */
    objc_setAssociatedObject(self, CZ_URL_KEY, url, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
