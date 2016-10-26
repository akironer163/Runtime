//
//  NSObject+Runtime.m
//  Runtime
//
//  Created by user on 16/10/26.
//  Copyright © 2016年 user. All rights reserved.
//

#import "NSObject+Runtime.h"

@implementation NSObject (Runtime)

+ (instancetype)rr_objWithDict:(NSDictionary *)dict {
    
    id object = [[self alloc] init];
    
    //使用字典设置对象信息
    NSArray *proList = [self rr_objProperties];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSLog(@"key %@ -- value %@",key, obj);
        
        if ([proList containsObject:key]) {
            //说明属性存在 可以使用KVC设置数值
            [object setValue:obj forKey:key];
        }
        
    }];
    
    return object;
}

+ (NSArray *)rr_objProperties {
    
    //1.调用运行时方法，取得类的属性列表
    //参数1：要获取的类
    //参数2：类属性的个数指针
    unsigned int count = 0;
    objc_property_t *proList = class_copyPropertyList([self class], &count);
    
    NSLog(@"属性的个数 %d",count);
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    //2.从数组中取得属性
    for (unsigned int i = 0; i < count; i ++) {
        
        objc_property_t pty = proList[i];
        
        //获取属性名
        const char *cName = property_getName(pty);

        NSLog(@"%s", cName);
        
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        
        [arrayM addObject:name];
    }
    
    //3.释放
    free(proList);
    
    return @[@"hello"];
}

@end
