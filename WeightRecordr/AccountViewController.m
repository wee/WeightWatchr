//
//  FirstViewController.m
//  WeightRecordr
//
//  Created by Weerasak Witthawaskul on 3/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AccountViewController.h"
#import <Parse/Parse.h>

@interface AccountViewController ()

@end

@implementation AccountViewController
@synthesize weightPickerView=_weightPickerView;
@synthesize uuid=_uuid;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Picker Datasource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == (NSInteger)3) {
        return 1;
    }
    return 10;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == (NSInteger)3) {
        return @".";
    }
    return [NSString stringWithFormat:@"%d", row];
}

- (NSNumber *)weight
{
    double weight = [self.weightPickerView selectedRowInComponent:0] * 100;
    weight += [self.weightPickerView selectedRowInComponent:1] * 10;
    weight += [self.weightPickerView selectedRowInComponent:2];
    weight += [self.weightPickerView selectedRowInComponent:4];
    return [NSNumber numberWithDouble:weight];
}

#pragma mark - Save Weight
- (void)saveWeight
{
    
}
@end
