//
//  AddGig.m
//  Gigism
//
//  Created by Student on 5/14/15.
//  Copyright (c) 2015 shp. All rights reserved.
//

#import "AddGig.h"

@interface AddGig ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UITextField *eventName;
@property (weak, nonatomic) IBOutlet UITextField *artist1;
@property (weak, nonatomic) IBOutlet UITextField *artist2;
@property (weak, nonatomic) IBOutlet UITextField *artist3;
@property (weak, nonatomic) IBOutlet UITextField *artist4;
@property (weak, nonatomic) IBOutlet UITextField *guests;
@property (weak, nonatomic) IBOutlet UITextField *location;
@property (weak, nonatomic) IBOutlet UITextField *venue;
@property (weak, nonatomic) IBOutlet UITextField *month;
@property (weak, nonatomic) IBOutlet UITextField *day;
@property (weak, nonatomic) IBOutlet UITextField *year;

@end

@implementation AddGig

- (void)viewDidLoad {
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
    // create an NSMutableArray to hold the data
    NSMutableArray *myArray = [[NSMutableArray alloc] init];
    
    // add the user entered text from the text field to the array created above
    [myArray addObject:_eventName.text];
    [myArray addObject:_artist1.text];
    [myArray addObject:_artist2.text];
    [myArray addObject:_artist3.text];
    [myArray addObject:_artist4.text];
    [myArray addObject:_guests.text];
    [myArray addObject:_location.text];
    [myArray addObject:_venue.text];
    [myArray addObject:_month.text];
    [myArray addObject:_day.text];
    [myArray addObject:_year.text];
     
    // archiving the array
    [NSKeyedArchiver archiveRootObject:myArray toFile:[self filePath]];
}

-(NSString *) filePath
{
    // NSArray that will hold the path to the documents directory
    NSArray *pathToPlist = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    // an NSString that holds the path to the plist file using the directory found above
    NSString *documentsdir = pathToPlist[0];
    
    // build the path to the data file by appending the name of the archiving file
    NSString *dataFilePath = [[NSString alloc] initWithString:[documentsdir stringByAppendingPathComponent:@"myFile.archive"]];
    
    // return the path to the myPlist
    return dataFilePath;
}

@end