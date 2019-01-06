//
//  XmlHelper.m
//  kissDemo
//
//  Created by  on 2018/12/10.
//  Copyright © 2018 zhijian. All rights reserved.
//

#import "XmlHelper.h"

@implementation XmlHelper


/**
 * 解析xml文件
 * @param path xml文件路径
 */
- (DDXMLElement*)analysisWithContentOfFile:(NSString*)path
{
    NSError *error;
    NSString *xml = [NSString stringWithContentsOfFile:path
                                              encoding:NSUTF8StringEncoding
                                                 error:&error];
    return [self analysisWithString:xml];
}

/**
 * 解析xml文件
 * @param data  xml文件内容
 */
- (DDXMLElement*)analysisWithContentWithData:(NSData*)data
{
    NSString *xml = [[NSString alloc] initWithData:data
                                          encoding:NSUTF8StringEncoding];
    return [self analysisWithString:xml];
}

/**
 * 解析xml文件
 * @param xml xml文件内容
 */
- (DDXMLElement*)analysisWithString:(NSString*)xml
{
    NSError *error;
    DDXMLDocument *document = [[DDXMLDocument alloc] initWithXMLString:xml
                                                               options:kNilOptions
                                                                 error:&error];
    return document.rootElement;
}

@end
