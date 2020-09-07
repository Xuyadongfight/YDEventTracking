//
//  AViewController.m
//  无侵入埋点
//
//  Created by 徐亚东 on 2020/9/7.
//  Copyright © 2020 xuyadong. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"
@interface AViewController ()
@property(strong,nonatomic)UIButton *btn1;
@property(strong,nonatomic)UIButton *btn2;
@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.btn1];
    [self.view addSubview:self.btn2];
    
}
- (UIButton *)btn1{
    if (_btn1 == nil){
        _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn1 addTarget:self action:@selector(actionOfBtn1) forControlEvents:UIControlEventTouchUpInside];
        [_btn1 setTitle:@"btn1" forState:UIControlStateNormal];
        [_btn1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_btn1 setBackgroundColor:[UIColor whiteColor]];
        _btn1.frame = CGRectMake(100, 100, 80, 40);
    }
    return _btn1;
}


-(void)actionOfBtn1{
    NSLog(@"btn1");
}

- (UIButton *)btn2{
    if (_btn2 == nil){
        _btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn2 addTarget:self action:@selector(actionOfBtn2) forControlEvents:UIControlEventTouchUpInside];
        [_btn2 setTitle:@"btn2" forState:UIControlStateNormal];
        [_btn2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_btn2 setBackgroundColor:[UIColor whiteColor]];
        _btn2.frame = CGRectMake(200, 100, 80, 40);
    }
    return _btn2;
}


-(void)actionOfBtn2{
    NSLog(@"btn2");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:[[BViewController alloc] init] animated:true];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
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
