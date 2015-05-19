//
//  AddGig.h
//  Gigism
//
//  Created by Student on 5/14/15.
//  Copyright (c) 2015 shp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GigItem.h"

@interface AddGig : UIViewController

@property GigItem *gigItem;

- (IBAction)saveButton:(id)sender;

-(NSString *) filePath;

@end
