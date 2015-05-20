//
//  AddGig.h
//  Gigism
//
//  Created by Student on 5/14/15.
//  Copyright (c) 2015 shp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GigItem.h"
#import "gigDisplayViewController.h"

@interface AddGig : UIViewController

@property GigItem *gigItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *eventName;
@property (weak, nonatomic) IBOutlet UITextField *artist1;
@property (weak, nonatomic) IBOutlet UITextField *guests;
@property (weak, nonatomic) IBOutlet UITextField *location;
@property (weak, nonatomic) IBOutlet UITextField *venue;
@property (weak, nonatomic) IBOutlet UITextField *month;
@property (weak, nonatomic) IBOutlet UITextField *day;
@property (weak, nonatomic) IBOutlet UITextField *year;

- (IBAction)saveButton:(id)sender;
- (NSString *) filePath;

@end
