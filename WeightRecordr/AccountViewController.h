//
//  FirstViewController.h
//  WeightRecordr
//
//  Created by Weerasak Witthawaskul on 3/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

- (IBAction)saveWeight;

@property (nonatomic, retain) IBOutlet UIPickerView *weightPickerView;
@property (nonatomic, copy) NSString *uuid;

@end
