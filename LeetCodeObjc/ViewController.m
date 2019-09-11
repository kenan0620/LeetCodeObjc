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

}

- (void)leetcode1{
    NSArray *nums = @[@"2",@"7",@"11",@"15"];
    int targetr = 22;
    if (nums.count<2) {
        NSLog(@"小于二");
        return;
    }
    NSString *firstStr = nums[0];
    NSString *secondStr = nums[1];
    NSString *lastStr = nums.lastObject;
    NSString *lastNextStr = nums[nums.count - 2];
    
    if (targetr < (firstStr.intValue+secondStr.intValue)|| targetr>(lastStr.intValue +lastNextStr.intValue)) {
        NSLog(@"超边界值");
        return;
    }
    
    NSMutableDictionary *numsDic=[NSMutableDictionary dictionary];
    [nums enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [numsDic setObject:@(idx) forKey:obj];
    }];
    NSLog(@"%@",numsDic);
    
    for (int i = 0; i < nums.count; i ++) {
        NSString *org = nums[i];
        int reduce = targetr - org.intValue;
        
        if ([numsDic objectForKey:[NSString stringWithFormat:@"%d",reduce]]) {
            int index =  [numsDic[[NSString stringWithFormat:@"%d",reduce]] intValue];
            
            NSLog(@"存在一对数据 数组下标为%@,数组值为%@,数组下标为%d,数组值为%@ 的和为目标值%d",numsDic[[NSString stringWithFormat:@"%d",reduce]],nums[index],i,org,targetr);
            return;
        }
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
