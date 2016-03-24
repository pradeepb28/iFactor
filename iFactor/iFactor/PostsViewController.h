//
//  PostsViewController.h
//  iFactor
//
//  Created by Pradeep Burugu on 3/23/16.
//  Copyright © 2016 Pradeep Burugu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
@interface PostsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic)NSString *userid;
@property(nonatomic)NSMutableArray *array;
@property (weak, nonatomic) IBOutlet UITableView *postView;

@property (weak, nonatomic) IBOutlet UILabel *body;
@property (weak, nonatomic) IBOutlet UILabel *postTitle;


@end
