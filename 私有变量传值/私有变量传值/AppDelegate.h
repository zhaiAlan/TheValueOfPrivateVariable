//
//  AppDelegate.h
//  私有变量传值
//
//  Created by Alan on 2019/3/4.
//  Copyright © 2019 zhaixingzhi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

