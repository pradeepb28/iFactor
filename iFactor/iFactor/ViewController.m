//
//  ViewController.m
//  iFactor
//
//  Created by Pradeep Burugu on 3/23/16.
//  Copyright © 2016 Pradeep Burugu. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "User.h"
#import "PostsViewController.h"
@implementation ViewController{
    User *user;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.array = @[@"hi",@"how",@"are",@"you?"];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://jsonplaceholder.typicode.com/users"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
           // NSLog(@"%@ %@", response, responseObject);
            self.array = [NSMutableArray new];
            NSArray *res = responseObject;
            for (NSDictionary *username in res) {
                //NSLog(@"%@",[username objectForKey:@"username"]);
                //[self.array addObject:[username objectForKey:@"username"]];
                User *postuser = [[User alloc]init];
                [postuser initWithDictionary:username];
                [self.array addObject:postuser];
                //self.address = [NSString stringWithFormat:@"%@",[username objectForKey:@"address"]];
            }
        }
        [self.listView reloadData];
    }];
    [dataTask resume];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.array count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.listView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    user = [self.array objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@,%@,%@,%@",user.address.street,user.address.suite,user.address.city,user.address.zipcode];
    
    
    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    user = [self.array objectAtIndex:indexPath.row];
    //NSLog(@"%@",user.userid);
    [self performSegueWithIdentifier:@"posts" sender:self];
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"posts"]) {
        PostsViewController *posts = (PostsViewController *)segue.destinationViewController;
        posts.userid = user.userid;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
