//
//  ViewController.m
//  UIImageView的动画
//
//  Created by 刘浩浩 on 15/12/18.
//  Copyright © 2015年 KG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 320, 440)];
    
    NSMutableArray * images = [[NSMutableArray alloc]init];
    NSMutableArray * highlightImages = [[NSMutableArray alloc]init];
    
    for (int i = 1; i<9; i++) {
        NSString * string = [NSString stringWithFormat:@"%.2d.JPG",i];
        UIImage * image = [UIImage imageNamed:string];
        [images addObject:image];
    }
    for (int i = 1; i<14; i++) {
        NSString * string = [NSString stringWithFormat:@"png%d.png",i];
        UIImage * image = [UIImage imageNamed:string];
        
        [highlightImages addObject:image];
    }
    
    //把初始化好的图片数组，赋给imageView的动画数组
    imageView.animationImages = images;
    //同样，高亮状态的动画
    imageView.highlightedAnimationImages = highlightImages;
    
    imageView.image = [UIImage imageNamed:@"01.JPG"];
    imageView.highlightedImage = [UIImage imageNamed:@"png1.png"];
    
    
    //动画播放时间
    imageView.animationDuration = 1;
    // 动画重复播放次数,如果设置为0，那么一直播放
    imageView.animationRepeatCount = 0;
    
    imageView.tag = 100;
    
    imageView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:imageView];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 460, 320, 20);
    [button setTitle:@"换" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    [imageView startAnimating];

}
-(void)buttonClicked
{
    UIImageView * imageView = (UIImageView *)[self.view viewWithTag:100];
    
    
    
    if (imageView.isHighlighted) {
        imageView.highlighted = NO;

    }
    else
        imageView.highlighted = YES;
    

    if (imageView.isAnimating==NO) {
        [imageView startAnimating];
    }
    else
        [imageView stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
