//
//  main.m
//  WeightRecordr
//
//  Created by Weerasak Witthawaskul on 3/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "AppDelegate.h"

int main(int argc, char *argv[])
{
    [Parse setApplicationId:@"DE8CnuxzLTTXZ3fyxRKecTIm0m6C9ZUmz3ox767D" 
                  clientKey:@"KPAx8TflkYkW3V2IkAWEWb4Fk1YlbDdTQ40CXq5D"];

    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
