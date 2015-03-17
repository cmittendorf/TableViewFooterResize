//
//  MyTableViewController.m
//  TableViewFooterResize
//
//  Created by Christian Mittendorf on 30.10.13.
//  Copyright (c) 2013 Christian Mittendorf. All rights reserved.
//

#import "MyTableViewController.h"


@interface MyTableViewController ()
@end

@implementation MyTableViewController
{
    NSArray *_tableViewItems;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _tableViewItems = @[@"one", @"two", @"three", @"four", @"five"];
    
    _footerLabel.text = @"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque ligula ligula, dignissim id, rhoncus rhoncus, sagittis et, massa. In sit amet nulla a mi ultricies suscipit.";
    
    [self.tableView setTableFooterView:_footerView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect frame = _footerView.frame;
    frame.size.height = [_footerView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    _footerView.frame = frame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableViewItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = _tableViewItems[indexPath.row];
    return cell;
}

@end
