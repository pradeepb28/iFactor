//
//  Address.h
//  iFactor
//
//  Created by Pradeep Burugu on 3/23/16.
//  Copyright © 2016 Pradeep Burugu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject
@property(nonatomic)NSString *street;
@property(nonatomic)NSString *suite;
@property(nonatomic)NSString *zipcode;
@property(nonatomic)NSString *city;
-(void)initWithDictionary:(NSDictionary *)addressDictionary;
@end
