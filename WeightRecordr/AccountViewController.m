//
//  FirstViewController.m
//  WeightRecordr
//
//  Created by Weerasak Witthawaskul on 3/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AccountViewController.h"
#import <Parse/Parse.h>
#define KEY_WEIGHT @"weight"

@interface AccountViewController ()

@end

@implementation AccountViewController
@synthesize weightPickerView=_weightPickerView;
@synthesize uuid=_uuid;


- (void)loadUser:(NSString *)uuid
{
    if (self.uuid != nil) {
        PFQuery *query = [PFQuery queryWithClassName:@"User"];
        query.cachePolicy = kPFCachePolicyNetworkElseCache;
        [query whereKey:@"uuid" equalTo:self.uuid];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                NSLog(@"Successfully retrieved %d records.", objects.count);
                PFObject *user = [objects objectAtIndex:(objects.count - 1)];
                NSNumber *weight = [user valueForKey:KEY_WEIGHT];
                
            } else {
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.uuid = (NSString *)[defaults valueForKey:@"uuid"];
    if (self.uuid == nil) {
        self.uuid = [[NSProcessInfo processInfo] globallyUniqueString];
        [defaults setValue:self.uuid forKey:@"uuid"];
    }
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
    PFObject *user = [PFObject objectWithClassName:@"User"];
    [user setObject:self.uuid forKey:@"uuid"];
    [user setObject:[self weight] forKey:KEY_WEIGHT];
    [user save];
    NSLog(@"Saving uuid: %@ weight: %@", self.uuid, [self weight]);
}
@end
