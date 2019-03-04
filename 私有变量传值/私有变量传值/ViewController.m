//
//  ViewController.m
//  私有变量传值
//
//  Created by Alan on 2019/3/4.
//  Copyright © 2019 zhaixingzhi. All rights reserved.
//

#import "ViewController.h"
#import "PrivateVariablesClass.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self way2];
}
-(void)way1{
    PrivateVariablesClass *classA = [[PrivateVariablesClass alloc] init];
    [classA setValue:@(4) forKey:@"_priviteNum"];
    [classA setValue:self.view forKey:@"_priviteView"];
    [classA showPropertyPrivateVariablesClass];
}
-(void)way2{
    PrivateVariablesClass *classA = [[PrivateVariablesClass alloc] init];
    
    unsigned int outCount = 0;
    Ivar *ivars = class_copyIvarList([PrivateVariablesClass class], &outCount);
    
    for (int i = 0; i < outCount; i ++) {
        Ivar ivar = ivars[i];
        
        const char *ivarName = ivar_getName(ivar);
        
        //这里要注意ARC下， 这个会报错
        /**
         在修改NSInteger型变量的时候，ARC下，编译器不允许你将NSInteger类型的值赋值给id，在buildsetting中将Objective-C Automatic Reference Counting修改为No即可。但是这样工程就会变成MRC，所以，如果是非对象类型就不建议用object_setIvar这样的方法去修改了。
         */

        int a = strcmp(ivarName, "_priviteNum");
        if (strcmp(ivarName, "_priviteNum") == 0) {
            //这种方式传值int类型会报错，不能传入
            object_setIvar(classA, ivar, 22);
        }
        
        if (strcmp(ivarName, "_priviteView") == 0) {
            object_setIvar(classA, ivar, self.view);
        }
    }
    
    [classA showPropertyPrivateVariablesClass];
}
-(void)way3{
    PrivateVariablesClass *classA = [[PrivateVariablesClass alloc] init];
    ((void (*)(id, SEL, int))(void *) objc_msgSend)((id)classA, @selector(setPriviteNum:) , 33);
    ((void (*)(id, SEL, id))(void *) objc_msgSend)((id)classA, @selector(setPriviteView:) , self.view);
    [classA showPropertyPrivateVariablesClass];
}

@end
