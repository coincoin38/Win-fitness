//
//  WFNewsTableViewController.m
//  Win Fitness
//
//  Created by julien gimenez on 02/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFNewsTableViewController.h"
#import "WFFacebookNewsViewModel.h"
#import "WFFacebookFeedModel.h"

static NSString * const identifier = @"newsIdentifier";

@interface WFNewsTableViewController ()

@property(nonatomic,strong) WFFacebookNewsViewModel *facebookNewsViewModel;
@property(nonatomic,strong) NSArray<WFFacebookFeedModel *> *newsArray;

@end

@implementation WFNewsTableViewController

- (instancetype)initWithFacebookNewsViewModel:(WFFacebookNewsViewModel *)viewModel
{
    self = [super init];
    if (self ) {
        _facebookNewsViewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    RAC(self,newsArray) = RACObserve(self.facebookNewsViewModel, facebookNews);
    [RACObserve(self, newsArray) subscribeNext:^(id news) {
        if(news)
        {
            [self.tableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.newsArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier
                                                            forIndexPath:indexPath];
    cell.textLabel.text = self.newsArray[indexPath.row].created_time;
        
    return cell;
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
