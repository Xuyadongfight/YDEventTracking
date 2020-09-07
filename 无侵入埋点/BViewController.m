//
//  BViewController.m
//  无侵入埋点
//
//  Created by 徐亚东 on 2020/9/7.
//  Copyright © 2020 xuyadong. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()
@property(strong,nonatomic)UIButton *btn;
@end

@implementation BViewController
- (UIButton *)btn{
    if (_btn == nil){
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn addTarget:self action:@selector(actionOfbtn) forControlEvents:UIControlEventTouchUpInside];
        [_btn setTitle:@"btn" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_btn setBackgroundColor:[UIColor whiteColor]];
        _btn.frame = CGRectMake(100, 100, 80, 40);
    }
    return _btn;
}


-(void)actionOfbtn{
    NSLog(@"btn");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.btn];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)dealloc
{
    NSLog(@"%@ dealloc",self);
}

@end
