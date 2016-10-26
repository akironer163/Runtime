
//
//  Peroson.m
//  Runtime
//
//  Created by user on 16/10/26.
//  Copyright © 2016年 user. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description {
    
    NSArray *keys = @[@"name", @"age"];
    
    return [self dictionaryWithValuesForKeys:keys].description;
}

@end
