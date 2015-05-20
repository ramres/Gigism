//
//  gigDisplayViewController.h
//  Gigism
//
//  Created by Student on 5/15/15.
//  Copyright (c) 2015 shp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddGig.h"

@interface gigDisplayViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *monthLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistsLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *venueLabel;
@property (weak, nonatomic) IBOutlet UILabel *friendsLabel;

-(IBAction) close:(id) sender;

-(NSString *) filePath;

@end