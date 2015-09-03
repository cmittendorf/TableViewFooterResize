//
//  MyTableViewController.m
//  TableViewFooterResize
//
//  Created by Christian Mittendorf on 30.10.13.
//  Copyright (c) 2013 Christian Mittendorf. All rights reserved.
//

#import "MyTableViewController.h"


NSString * const longText = @"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque ligula ligula, dignissim id, rhoncus rhoncus, sagittis et, massa. In sit amet nulla a mi ultricies suscipit.";
NSString * const shortText = @"foobar";

@interface MyTableViewController ()
@property (assign) IBOutlet UIView *footerView;
@property (assign) IBOutlet UILabel *footerLabel;

@property (nonatomic) NSArray *tableViewItems;
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableViewItems = @[@"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", @"ten", @"eleven", @"twelve", @"thirteen", @"fourteen", @"fivteen"];
    
    self.footerLabel.text = longText;
    
    [self.tableView setTableFooterView:_footerView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    // calculate the height for the footerView
    CGRect frame = self.footerView.frame;
    frame.size.height = [self.footerView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;

    // adjust the contentSize of the tableView
    CGSize contentSize = self.tableView.contentSize;
    CGFloat delta = (frame.size.height - self.footerView.frame.size.height);
    self.tableView.contentSize = CGSizeMake(contentSize.width, contentSize.height + delta);

    self.footerView.frame = frame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableViewItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.tableViewItems[indexPath.row];
    return cell;
}

- (IBAction)updateFooterText:(id)sender {
    _footerLabel.text = [_footerLabel.text isEqualToString:longText] ? shortText : longText;
    [self.tableView setNeedsLayout];
}

@end
