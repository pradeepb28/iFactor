//
//  Posts.h
//  iFactor
//
//  Created by Pradeep Burugu on 3/23/16.
//  Copyright © 2016 Pradeep Burugu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
@interface Posts : NSObject
@property(nonatomic)User *user;
@property(nonatomic)NSString *title;
@property(nonatomic)NSString *body;
-(void)initWithDictionary:(NSDictionary *)postDictionary;
@end
