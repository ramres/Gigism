//
//  GigismTableViewController.m
//  Gigism
//
//  Created by Student on 5/14/15.
//  Copyright (c) 2015 shp. All rights reserved.
//

#import "GigismTableViewController.h"
#import "GigItem.h"
#import "AddGig.h"
#import "gigDisplayViewController.h"

@interface GigismTableViewController ()

@property NSMutableArray *gigItems;

@end

@implementation GigismTableViewController
/*
- (void)loadInitialData
{
    GigItem *item1 = [[GigItem alloc] init];
    item1.itemName = @"Lydia";
    [self.gigItems addObject:item1];
    GigItem *item2 = [[GigItem alloc] init];
    item2.itemName = @"Fall Out Boy";
    [self.gigItems addObject:item2];
    GigItem *item3 = [[GigItem alloc] init];
    item3.itemName = @"From Indian Lakes";
    [self.gigItems addObject:item3];

 
}
 */

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    AddGig *source = [segue sourceViewController];
    GigItem *item = source.gigItem;
    if (item != nil)
    {
        [self.gigItems addObject:item];
        [self.tableView reloadData];
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.gigItems = [[NSMutableArray alloc] init];
    /*
    [self loadInitialData];

    
    gigDisplayViewController *gdvc = [[gigDisplayViewController alloc] init];
    AddGig *agvc = [[AddGig alloc] init];
    
    gdvc.eventNameLabel.text = agvc.eventName.text;
    gdvc.monthLabel.text = agvc.month.text;
    gdvc.dayLabel.text = agvc.day.text;
    gdvc.yearLabel.text = agvc.year.text;
    gdvc.artistsLabel.text = agvc.artist1.text;
    gdvc.locationLabel.text = agvc.location.text;
    gdvc.venueLabel.text = agvc.venue.text;
    gdvc.friendsLabel.text = agvc.guests.text;
    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    // Return the number of rows in the section.
    return [self.gigItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    GigItem *gigItem = [self.gigItems objectAtIndex:indexPath.row];
    cell.textLabel.text = gigItem.itemName;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
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
 */


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier]isEqualToString:@"toGigDisplay"])
    {
        gigDisplayViewController *gdvc = [[gigDisplayViewController alloc] init];
    
        // Get reference to the destination view controller
        gdvc = [segue destinationViewController];
    }

}
 */

@end
