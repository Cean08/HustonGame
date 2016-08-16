//
//  RegistViewController.m
//  GroupC_TuWan
//
//  Created by tarena11 on 16/7/25.
//  Copyright © 2016年 tarena. All rights reserved.
//
//duetdisplay
#import "RegistViewController.h"
#import "LoginCell.h"
@interface RegistViewController ()
@property(nonatomic)UIButton *btnIV;
@property(nonatomic)UILabel *consentLabel;
@property(nonatomic)UIButton *termsBtn;
@property(nonatomic)UIView *footerView;
@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    [self.tableView registerClass:[LoginCell class] forCellReuseIdentifier:@"Cell"];
}

//代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else{
        return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LoginCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.label.text = @"用户名";
            cell.textField.placeholder = @"请输入用户名";
        }else if(indexPath.row == 1){
            cell.label.text = @"密码";
            cell.textField.placeholder = @"请输入密码";
        }else{
            cell.label.text = @"确认密码";
            cell.textField.placeholder = @"请再次输入密码";
        }
    }
    if (indexPath.section == 1) {
        [cell.Btn setTitle:@"立即注册" forState:UIControlStateNormal];
        [cell.Btn addTarget:self action:@selector(Loginbtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    if (indexPath.section == 2) {
        [cell.Btn setTitle:@"使用QQ登录" forState:UIControlStateNormal];
        [cell.Btn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//自定义尾部视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0) {
        //创建一个View设置为尾部视图并设置他的frame
        self.footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
        
        //尾部视图上面的图片Button
        self.btnIV = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btnIV setImage:[UIImage imageNamed:@"agreementbox_selected_18x18_"] forState:UIControlStateSelected];
        [self.btnIV setImage:[UIImage imageNamed:@"agreementbox_18x18_"] forState:UIControlStateNormal];
        [self.btnIV addTarget:self action:@selector(clikcAgree) forControlEvents:UIControlEventTouchUpInside];
        [self.footerView addSubview:_btnIV];
        [self.btnIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(36);
            make.centerY.equalTo(0);
            make.left.equalTo(20);
        }];
        
        //尾部视图上面的Label
        self.consentLabel = [[UILabel alloc]init];
        self.consentLabel = [[UILabel alloc] init];
        self.consentLabel.text = @"同意";
        self.consentLabel.font = [UIFont systemFontOfSize:14];
        [self.footerView addSubview:_consentLabel];
        [self.consentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.btnIV.mas_right).equalTo(2);
            make.centerY.equalTo(0);
        }];
        
        //尾部视图上面的条款Button
        self.termsBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        self.termsBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.termsBtn setTitle:@"《兔玩网服务及隐私条款》" forState:UIControlStateNormal];
        [self.termsBtn setTintColor:[UIColor colorWithRed:46 / 255.0 green:179 / 255.0 blue:116 / 255.0 alpha:1.0]];
        [self.footerView addSubview:_termsBtn];
        [self.termsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.consentLabel.mas_right).equalTo(2);
            make.centerY.equalTo(0);
        }];
        return self.footerView;
    }
    return nil;
}
//设置尾部视图的高
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 44;
    }else{
        return 0;
    }
}
//点击事件
-(void)Loginbtn:(UIButton *)sender{
    NSLog(@"立即登录");
}
-(void)btn:(UIButton *)sender{
    NSLog(@"使用QQ登录");
}

- (void)clikcAgree {
    self.btnIV.selected = !self.btnIV.selected;
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
