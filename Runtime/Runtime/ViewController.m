//
//  ViewController.m
//  Runtime
//
//  Created by user on 16/10/26.
//  Copyright © 2016年 user. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+Additions.h"
#import "Person.h" //继承自NSObject
#import "NSObject+Runtime.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self demo1];
//    [self demo2];
    [self demo3];
}

//关联对象
- (void)demo1 {
    
    _imageView.url = [NSURL URLWithString:@"www.baidu.com"];
    
    NSLog(@"%@",_imageView.url);
}

//动态获取类的属性
- (void)demo2 {
    NSArray *properties = [Person rr_objProperties];
    
    NSLog(@"%@", properties);
}

//字典转模型
- (void)demo3 {
    
    Person *person = [Person rr_objWithDict:@{
                                              @"name": @"xx",
                                              @"age": @18
                                              }];
}
@end
