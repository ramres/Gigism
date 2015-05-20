//
//  gigDisplayViewController.m
//  Gigism
//
//  Created by Student on 5/15/15.
//  Copyright (c) 2015 shp. All rights reserved.
//

#import "gigDisplayViewController.h"
#import "AddGig.h"

@interface gigDisplayViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;

@end

@implementation gigDisplayViewController


-(IBAction) close:(id) sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // get the path to the file by invoking the filePath method
    NSString * pathToFile = [self filePath];
    
    // check to see if the archive file was created
    if ([[NSFileManager defaultManager] fileExistsAtPath:pathToFile])
    {
        
        // create an NSMutableArray
        NSMutableArray *myArray;
        
        // unarchive the data and store it in the above array
        myArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePath]];
        
        // display the archived data into the label
        _eventNameLabel.text = myArray[0];
        _monthLabel.text = myArray[1];
        _dayLabel.text = myArray[2];
        _yearLabel.text = myArray[3];
        _artistsLabel.text = myArray[4];
        _locationLabel.text = myArray[5];
        _venueLabel.text = myArray[6];
        _friendsLabel.text = myArray[7];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
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
