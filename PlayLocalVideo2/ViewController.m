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
//{
//    NSString *docPath;
//    //    docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
//
//}
@property (weak, nonatomic) IBOutlet UITableView *videoTableView;
//@property (nonatomic, strong) AVPlayerViewController *playViewController;
@property (nonatomic, strong) AVPlayer *playerView;

@end

@implementation ViewController

//- (AVPlayer *)playerView {
//    if (!_playerView) {
//        AVPlayerItem *playerItem = [self getPlayItem];
//        _playerView = [[AVPlayer alloc] initWithPlayerItem:playerItem];
//    }
//    return _playerView;
//}
//
//- (AVPlayerItem *)getPlayItem {
//    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    NSString *savePath = [cachePath stringByAppendingPathComponent:@"MOVIEPATH"]; // 示例没有加 @“”
//    NSURL *saverUrl = [NSURL fileURLWithPath:savePath];
//    
//    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:saverUrl];
//    
//    return playerItem;
//}

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
    return 1;
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
