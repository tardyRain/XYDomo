//
//  XYAttributeViewController.m
//  XYDomo
//
//  Created by wuxinyu on 2018/8/7.
//  Copyright © 2018年 xinyu.wu. All rights reserved.
//

#import "XYAttributeViewController.h"

@interface XYAttributeViewController ()

@end

@implementation XYAttributeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:20],
                          NSForegroundColorAttributeName:[UIColor redColor]};
    NSMutableAttributedString *attributeText = [[NSMutableAttributedString alloc] initWithString:@"一要要开心一要要开心一要要开心一要要开心" attributes:dic];
    
    [attributeText beginEditing];
    
    //设置字体颜色
    [attributeText addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 2)];
    
    //设置字体大小
    [attributeText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, 2)];
    
    //    //设置字体间距
    //    [attributeText addAttribute:NSKernAttributeName value:[NSNumber numberWithInt:5] range:NSMakeRange(2, 2)];
    //
    //    //设置文字的背景颜色
    //    [attributeText addAttribute:NSBackgroundColorAttributeName value:[UIColor cyanColor] range:NSMakeRange(0, attributeText.length)];
    //
    //    //连体字符--只针对某些特定字符--尝试没有效果
    //    [attributeText addAttribute:NSLigatureAttributeName value:[NSNumber numberWithInt:1] range:NSMakeRange(4, 2)];
    //
    //    // 中划线  0代表没有中划线 值越大中划线越粗
    //    [attributeText addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:1] range:NSMakeRange(6, 2)];
    //    [attributeText addAttribute:NSStrikethroughColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(6, 2)];
    //
    //    //下划线  value:竖直越大线越粗  10:双下划线
    //    [attributeText addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:10] range:NSMakeRange(8, 2)];
    //    [attributeText addAttribute:NSUnderlineColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(8, 2)];
    //
    //    //描边宽度 value:改变描边宽度（相对于字体size 的百分比）。默认为 0，即不改变。正数只改变描边宽度。负数同时改变文字的描边和填充宽度。例如，对于常见的空心字，这个值通常为3.0
    //    [attributeText addAttribute:NSStrokeWidthAttributeName value:[NSNumber numberWithFloat:3.0] range:NSMakeRange(10, 2)];
    //    [attributeText addAttribute:NSStrokeColorAttributeName value:[UIColor purpleColor] range:NSMakeRange(10, 2)];
    //
    //    //网络连接
    [attributeText addAttribute:NSLinkAttributeName value:[NSURL URLWithString:@"https://www.baidu.com"] range:NSMakeRange(12, 5)];
    //
    //基线位置 正数:向上移  负数:向下移
    //    [attributeText addAttribute:NSBaselineOffsetAttributeName value:[NSNumber numberWithFloat:2.0] range:NSMakeRange(0, 2)];
    //
    //    //斜体
    //    [attributeText addAttribute:NSObliquenessAttributeName value:[NSNumber numberWithFloat:0.5] range:NSMakeRange(16, 2)];
    //
    //    //膨胀--扁平化
    //    [attributeText addAttribute:NSExpansionAttributeName value:[NSNumber numberWithFloat:0.5] range:NSMakeRange(18, 2)];
    //
    //    //书写方向--还没参透
    //    [attributeText addAttribute:NSWritingDirectionAttributeName value:[NSArray arrayWithObjects:NSWritingDirectionLeftToRight, nil] range:NSMakeRange(20, 2)];
    //
    //    //阴影效果
    //    NSShadow *shadow = [[NSShadow alloc] init];
    //    shadow.shadowColor = [UIColor purpleColor];
    //    shadow.shadowBlurRadius = 0.5;//模糊程度
    //    shadow.shadowOffset = CGSizeMake(0, 2);
    //    [attributeText addAttribute:NSShadowAttributeName value:shadow range:NSMakeRange(20, 2)];
    //
    //    //设置段落样式--没有效果
    //    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    //    paragraph.lineBreakMode = NSLineBreakByCharWrapping;
    //    paragraph.paragraphSpacing = 10;
    //    paragraph.paragraphSpacingBefore = 20;
    //    [attributeText addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(22, 2)];
    
    
    [attributeText endEditing];
    
    //    self.customLabel.attributedText = attributeText;
    
    /*
     *NSShadowAttributeName
     *NSTextEffectAttributeName
     *NSAttachmentAttributeName
     *
     */
    
    [attributeText enumerateAttribute:NSLinkAttributeName inRange:NSMakeRange(12, 2) options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
        NSLog(@"嘿嘿");
    }];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 120, 300, 200)];
    label.backgroundColor = [UIColor groupTableViewBackgroundColor];
    label.userInteractionEnabled = YES;
    label.numberOfLines = 0;
    //    label.font = [UIFont systemFontOfSize:28];
    [self.view addSubview:label];
    
    label.attributedText = attributeText;
//    CGSize size = [attributeText size];
//    label.frame = CGRectMake(10, 20, size.width, size.height);
//    label.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
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
