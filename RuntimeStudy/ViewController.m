//
//  ViewController.m
//  RuntimeStudy
//
//  Created by 王晓康 on 2018/3/21.
//  Copyright © 2018年 wangxiaokang. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //    [self logPropertyList];
    //    [self logMethodList]
    //    [self logIvarList];
    [self logProtocolList];
    
    
}

// 打印属性列表
- (void) logPropertyList
{
    unsigned int count;
    objc_property_t * propertyList = class_copyPropertyList([Person class], &count);
    for (int i = 0; i < count; i++)
    {
        const char * propertyName = property_getName(propertyList[i]);
        
        NSLog(@"property ---- > %@",[NSString stringWithUTF8String:propertyName]);
    }
}

// 打印方法列表
- (void) logMethodList
{
    unsigned int count;
    Method * methodList = class_copyMethodList([Person class], &count);
    for (int i = 0; i < count; i++)
    {
        Method * method = &methodList[i];
        NSLog(@"method --- > %@",NSStringFromSelector(method_getName(*method)));
    }
}

// 获得成员变量列表
- (void) logIvarList
{
    unsigned int count;
    Ivar * ivarList = class_copyIvarList([Person class], &count);
    for (int i = 0 ; i < count; i++)
    {
        Ivar myIvar = ivarList[i];
        const char * ivarName = ivar_getName(myIvar);
        NSLog(@"Ivar ---> %@",[NSString stringWithUTF8String:ivarName]);
    }
}

- (void) logProtocolList
{
    unsigned int count;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([Person class], &count);
    for (int i = 0; i < count; i++)
    {
        Protocol * myProtocol = protocolList[i];
        const char * protocolName = protocol_getName(myProtocol);
        NSLog(@"Protocol ---> %@",[NSString stringWithUTF8String:protocolName]);
    }
}



@end
