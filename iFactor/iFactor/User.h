//
//  User.h
//  iFactor
//
//  Created by Pradeep Burugu on 3/23/16.
//  Copyright © 2016 Pradeep Burugu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"
@interface User : NSObject
@property(nonatomic)NSString *userid;
@property(nonatomic)NSString *username;
@property(nonatomic)Address *address;
-(void)initWithDictionary:(NSDictionary *)userDictionary;
@end
