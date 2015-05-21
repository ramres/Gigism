//
//  AddGig.m
//  Gigism
//
//  Created by Student on 5/14/15.
//  Copyright (c) 2015 shp. All rights reserved.
//

#import "AddGig.h"
#import "gigDisplayViewController.h"

@interface AddGig ()

@end

@implementation AddGig

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if (sender != self.saveButton) return;
    if (self.eventName.text.length > 0)
    {
        self.gigItem = [[GigItem alloc] init];
        self.gigItem.itemName = self.eventName.text;
        self.gigItem.completed = NO;
    }
}

- (IBAction)saveButton:(id)sender
{
    /*
    // create an NSMutableArray to hold the data
    NSMutableArray *myArray = [[NSMutableArray alloc] init];
    
    // add the user entered text from the text field to the array created above
    [myArray addObject:_eventName.text];
    [myArray addObject:_artist1.text];
    [myArray addObject:_guests.text];
    [myArray addObject:_location.text];
    [myArray addObject:_venue.text];
    [myArray addObject:_month.text];
    [myArray addObject:_day.text];
    [myArray addObject:_year.text];
     
    // archiving the array
    [NSKeyedArchiver archiveRootObject:myArray toFile:[self filePath]];
     */
    
    // invoke the writeToPlist method to write the contents of the field to the plist
    [self writeToPlist];
}

-(NSString *) filePath
{
    // NSArray that will hold the path to the documents directory
    NSArray *pathToPlist = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // an NSString that holds the path to the plist file using the directory found above
    NSString *documentsdir = pathToPlist[0];
    
    // build the path to the data file by appending the name of the archiving file
    NSString *dataFilePath = [[NSString alloc] initWithString:[documentsdir stringByAppendingPathComponent:@"gigPlist.archive"]];
    
    // return the path to the myPlist
    return dataFilePath;
}

- (void) writeToPlist
{
    // create a NSMutable dictionary that will hold the plist values
    NSMutableDictionary *myPlistDict = [[NSMutableDictionary alloc]init];
    
    // create a NSArray that will hold the contents of the text field
    NSArray *values = [NSArray arrayWithObjects: _eventName.text, _artist1.text, _guests.text, _location.text, _venue.text, _month.text, _day.text, _year.text, nil];
    
    // set the plist to the NSString that is holding the contents to the plist
    [myPlistDict setValue:values forKey:@"Name"];
    
    // invoke the writeToFile method to write the contents to the plist
    [myPlistDict writeToFile:[self filePath] atomically:YES];
    
    // set the label to the contents of the text field for the user to see what is being written
    gigDisplayViewController *gdvc = [[gigDisplayViewController alloc] init];
    [gdvc.eventNameLabel setText:_eventName.text];
    
}



@end