//
//  Address.m
//  iFactor
//
//  Created by Pradeep Burugu on 3/23/16.
//  Copyright © 2016 Pradeep Burugu. All rights reserved.
//

#import "Address.h"

@implementation Address
@synthesize suite;
@synthesize street;
@synthesize zipcode;
@synthesize city;
-(void)initWithDictionary:(NSDictionary *)addressDictionary{
    suite = [addressDictionary objectForKey:@"suite"];
   // NSLog(@"suite:%@",suite);
    street = [addressDictionary objectForKey:@"street"];
    //NSLog(@"street:%@",street);
    city = [addressDictionary objectForKey:@"city"];
    //NSLog(@"city:%@",city);
    zipcode = [addressDictionary objectForKey:@"zipcode"];
    //NSLog(@"zipcode:%@",zipcode);
}
@end
