//
//  ViewController.m
//  LeetCodeObjc
//
//  Created by conan on 2019/9/11.
//  Copyright © 2019年 coenen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self leetcode1];
    [self leetcode1];
    [self leetcode1];
    [self leetcode1];
    [self leetcode1];
    [self leetcode1];
    [self leetcode1];
    [self leetcode1];
    [self leetcode1];
    [self leetcode1];
    [self leetcode1];
    [self leetcode1];

}

- (void)leetcode1{
    /**
     在同时调用十二次的情况下 最短时间和最长时间区间 从测试开始到结束时间对比
     
     千万级数据 34140～42716毫秒
     百万级数据 2061～2414毫秒
     十万级数据 189～205毫秒
     万级数据 19～28毫秒
     千级数据 2～5毫秒
     百级数据 0～1毫秒
     */
    
    NSString *startDate = [self getTime];
    NSMutableArray *mutabArray = [NSMutableArray array];
    NSMutableDictionary *numsDic=[NSMutableDictionary dictionary];

    for (int i =0; i<100; i++) {
        [mutabArray addObject:@(i)];
        NSString *str = [NSString stringWithFormat:@"%d",i];
        [numsDic setObject:str forKey:str];

    }
//    NSArray *nums = @[@"2",@"7",@"11",@"15",@"22",@"27",@"31",@"35"];
    int targetr = 197;
    if (mutabArray.count<2) {
        NSLog(@"小于二");
        return;
    }
    NSString *firstStr = mutabArray[0];
    NSString *secondStr = mutabArray[1];
    NSString *lastStr = mutabArray.lastObject;
    NSString *lastNextStr = mutabArray[mutabArray.count - 2];
    
    if (targetr < (firstStr.intValue+secondStr.intValue)|| targetr>(lastStr.intValue +lastNextStr.intValue)) {
        NSLog(@"超边界值");
        return;
    }
    
    for (int i = 0; i < mutabArray.count; i ++) {
        NSString *org = mutabArray[i];
        int reduce = targetr - org.intValue;
        
        if ([numsDic objectForKey:[NSString stringWithFormat:@"%d",reduce]]) {
            int index =  [numsDic[[NSString stringWithFormat:@"%d",reduce]] intValue];
            
            if (index != i) {
//                NSLog(@"存在一对数据 数组下标为%@,数组值为%@,数组下标为%d,数组值为%@ 的和为目标值%d",numsDic[[NSString stringWithFormat:@"%d",reduce]],mutabArray[index],i,org,targetr);
            }else{
                NSLog(@"不存在");
            }
            NSString *endDate = [self getTime];
            
            NSLog(@"%ld",endDate.integerValue - startDate.integerValue);
            return;
        }else{

        }
    }
}

-(NSString *)getTime{
    // *1000 是精确到毫秒
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970]*1000;
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time]; //转为字符型
    return timeString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
