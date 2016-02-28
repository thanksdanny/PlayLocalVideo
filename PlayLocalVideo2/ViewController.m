//
//  ViewController.m
//  PlayLocalVideo2
//
//  Created by Danny Ho on 2/28/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "ViewController.h"
#import "VideoCell.h"

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *videoTableView;

@end

@implementation ViewController
- (IBAction)playBtn {
    NSLog(@"%s", __func__);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"videoCell" forIndexPath:indexPath];
    cell.videoImg.image = [UIImage imageNamed:@"videoScreenshot01"];
    cell.videoTitleLabel.text = @"这是第一个标题";
    cell.videoSourceLabel.text = @"source";
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.videoTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
