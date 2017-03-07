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
#import "WFNewsTableViewCell.h"
#import "WFDownloadImageService.h"

static NSString * const identifier = @"newsIdentifier";

@interface WFNewsTableViewController ()

@property(nonatomic,strong) WFFacebookNewsViewModel *facebookNewsViewModel;
@property(nonatomic,strong) NSArray<WFFacebookFeedModel *> *newsArray;

@end

@implementation WFNewsTableViewController

- (instancetype)initWithFacebookNewsViewModel:(WFFacebookNewsViewModel *)viewModel
{
    self = [super init];
    if (self)
    {
        _facebookNewsViewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[WFNewsTableViewCell class] forCellReuseIdentifier:identifier];
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
    WFNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier
                                                                forIndexPath:indexPath];
    [cell setupCellWithModel:self.newsArray[indexPath.row]];
    [WFDownloadImageService downloadImage:self.newsArray[indexPath.row].full_picture
                                  forCell:cell];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0f;
}

@end
