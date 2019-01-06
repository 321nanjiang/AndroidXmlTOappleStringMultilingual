//
//  ViewController.m
//  AndroidXmlTOappleStringMultilingual
//
//  Created by  on 2019/1/6.
//  Copyright © 2019 nanjiang. All rights reserved.
//

#import "ViewController.h"
#import "XmlHelper.h"
#import "NSString+JZ.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.\
    
    [self toLocalizableStr];
}


-(void)toLocalizableStr{
    // 获取Documents目录
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path1 = [[NSBundle mainBundle]pathForResource:@"strings" ofType:@"xml"];
    XmlHelper *xmlHelper = [[XmlHelper alloc] init];
    DDXMLElement *rootElement = [xmlHelper analysisWithContentOfFile:path1];
    int i = 0;
    NSMutableString *strings = [[NSMutableString alloc] init];
    for (DDXMLElement *element in [rootElement children]) {
        i++;
        //替换字符
        NSString * text = [NSString stringWithFormat:@"\"%@\" = \"%@\";", [[element attributeForName:@"name"] stringValue],[NSString removeSpaceAndNewline:element.stringValue]];
        text = [NSString removeSpaceAndNewline:text];
        NSString * temp  = [NSString stringWithFormat:@"%@\n",text];
        temp = [NSString toEmpty:temp];
        [strings appendString:temp];
    }
    // 字符串写入沙盒
    // 在Documents下面创建一个文本路径，假设文本名称为objc.txt
    NSString *txtPath = [docPath stringByAppendingPathComponent:@"Localizable.strings"]; // 此时仅存在路径，文件并没有真实存在
    // 字符串写入时执行的方法
    [strings writeToFile:txtPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"txtPath is %@", txtPath);
}

@end
