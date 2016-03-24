//
//  PostsViewController.m
//  iFactor
//
//  Created by Pradeep Burugu on 3/23/16.
//  Copyright © 2016 Pradeep Burugu. All rights reserved.
//

#import "PostsViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "Posts.h"
@interface PostsViewController ()

@end

@implementation PostsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.postView.estimatedRowHeight = 100;

    self.postView.rowHeight = UITableViewAutomaticDimension;
    
    

    // Do any additional setup after loading the view.
    NSLog(@"%@",self.userid);
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSString *urlString = [NSString stringWithFormat:@"http://jsonplaceholder.typicode.com/posts?userId=%@",self.userid];
    NSURL *URL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            // NSLog(@"%@ %@", response, responseObject);
            self.array = [NSMutableArray new];
            NSArray *res = responseObject;
            for (NSDictionary *post in res) {
                Posts *userPost = [[Posts alloc]init];
                [userPost initWithDictionary:post];
                [self.array addObject:userPost];
            }
            
        }
        [self.postView reloadData];
    }];
    [dataTask resume];
}
-(void)viewDidAppear:(BOOL)animated{
    [self.postView reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.array count];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [self.postView dequeueReusableCellWithIdentifier:@"post" forIndexPath:indexPath];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"post" owner:self options:nil];
        cell = [nib objectAtIndex:indexPath.row];
        
    }
    Posts *post = [self.array objectAtIndex:indexPath.row];
    //cell.textLabel.text = post.title;
    //cell.detailTextLabel.text = post.body;
    cell.postTitle.text = post.title;
    cell.postBody.text = post.body;
    
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
