//
//  Posts.m
//  iFactor
//
//  Created by Pradeep Burugu on 3/23/16.
//  Copyright © 2016 Pradeep Burugu. All rights reserved.
//

#import "Posts.h"

@implementation Posts
@synthesize user;
@synthesize title;
@synthesize body;
-(void)initWithDictionary:(NSDictionary *)postDictionary{
    self.title = [postDictionary objectForKey:@"title"];
    NSLog(@"%@",self.title);
    self.body = [postDictionary objectForKey:@"body"];
}
@end
