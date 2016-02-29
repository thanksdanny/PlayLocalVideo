//
//  ViewController.m
//  PlayLocalVideo2
//
//  Created by Danny Ho on 2/28/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "ViewController.h"
#import "VideoCell.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>


@interface ViewController () <UITableViewDataSource>
{
    NSArray *videoList;
}
@property (weak, nonatomic) IBOutlet UITableView *videoTableView;
@property (nonatomic, strong) AVPlayer *playerView;


@end

@implementation ViewController

- (NSArray *)data {
    return [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"videoList" ofType:@"plist"]];
}

- (IBAction)playBtn {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"emoji zone" ofType:@"mp4"];
    NSLog(@"%@", path);
    NSURL *videoUrl = [NSURL fileURLWithPath:path];
    self.playerView = [[AVPlayer alloc] initWithURL:videoUrl];
    AVPlayerViewController *videoVC = [[AVPlayerViewController alloc] init];
    videoVC.player = self.playerView;
    [self presentViewController:videoVC animated:YES completion:^{
        [videoVC.player play];
        NSLog(@"haha");
    }];
    NSLog(@"%s", __func__);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"videoCell" forIndexPath:indexPath];
    cell.videoImg.image = [UIImage imageNamed:[[self data][indexPath.row] objectForKey:@"image"]];
    cell.videoTitleLabel.text = [NSString stringWithFormat:@"%@", [[self data][indexPath.row] objectForKey:@"title"]];
    cell.videoSourceLabel.text = [NSString stringWithFormat:@"%@", [[self data][indexPath.row] objectForKey:@"source"]];
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
