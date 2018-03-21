//
//  Person.h
//  RuntimeStudy
//
//  Created by 王晓康 on 2018/3/21.
//  Copyright © 2018年 wangxiaokang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PersonDelegate <NSObject>

- (void) playBall;

@end

@interface Person : NSObject

@property (nonatomic, weak) id <PersonDelegate> delegate;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * school;
@property (nonatomic, copy) NSString * address;

// 类方法
+ (void) flyFlyFly_ONE;
+ (void) flyFlyFly_TWO;

// 实例方法
- (void) runRun_11;
- (void) runRun_22;

@end
