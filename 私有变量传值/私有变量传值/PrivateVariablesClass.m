//
//  PrivateVariablesClass.m
//  sound
//
//  Created by Alan on 2019/3/4.
//  Copyright © 2019 zhaixingzhi. All rights reserved.
//

#import "PrivateVariablesClass.h"


@interface PrivateVariablesClass ()
@property (nonatomic, assign) NSInteger priviteNum;
@property (nonatomic, strong) UIView *priviteView;
@end
@implementation PrivateVariablesClass

-(void)showPropertyPrivateVariablesClass
{
    NSLog(@"priviteNum = %@", @(_priviteNum));
    NSLog(@"pView = %@", _priviteView);
}

@end
