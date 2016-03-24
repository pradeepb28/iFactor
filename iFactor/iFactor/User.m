//
//  User.m
//  iFactor
//
//  Created by Pradeep Burugu on 3/23/16.
//  Copyright © 2016 Pradeep Burugu. All rights reserved.
//

#import "User.h"

@implementation User
@synthesize username;
@synthesize address;
@synthesize userid;
-(void)initWithDictionary:(NSDictionary *)userDictionary{
    userid = [userDictionary objectForKey:@"id"];
    username = [userDictionary objectForKey:@"username"];
    address = [[Address alloc]init];
    [address initWithDictionary:[userDictionary objectForKey:@"address"]];
    
}
@end
