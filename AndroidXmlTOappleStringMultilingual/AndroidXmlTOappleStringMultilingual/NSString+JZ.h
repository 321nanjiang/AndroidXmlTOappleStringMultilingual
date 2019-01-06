//
//  NSString+JZ.h
//  wanhongfarm
//
//  Created by wanhongios on 16/4/11.
//  Copyright © 2016年 wanhongios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JZ)
/**
 * 截取字符串 从第一位开始 截止到某个特点的字母  letter（制定的字母）  string（整个字符串）;
 */
+(NSString *)stringWithLetter:(NSString *)letter string:(NSString * )string;

-(NSString *)stringWithLetter:(NSString *)letter string:(NSString * )string;

/**
 * 截取字符串  从第一位开始 截止到某个特点的字母  breakpoint（制定的字母）  string（整个字符串）解决超长字符串问题;
 */
-(NSURL *)stringWithbreakpoint:(NSString *)breakpoint string:(NSString *)string;

/** * json字符串转字典 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;


/** * 把一个动态字典转化成字符串 加密 */
//+(NSString *)strWithDic:(NSMutableDictionary *)dic;


/**
 *  请求私有数据
 *
 *  @return 请求私有数据json
 */
+(NSString *)requestPrivatedataWith:(NSMutableDictionary*)requestDic;

/**
 *  请求公有数据JSON
 *
 *  @return 请求公有数据json
 */

+(NSString *)requestPublicdata;

+(NSString *)requestPublicdataWithPageNo:(NSInteger)pageNo andPageSize:(NSInteger)PageSize;

+(NSString *)requestPublicdataWithPageNo:(NSInteger)pageNo andPageSize:(NSInteger)PageSize clicks:(NSString *)clicks code:(NSString *)code brand:(NSString *)brand level:(NSString *)level;


/**
 *  通用拼接请求字符串方法
 *
 *  @param pageNo   页号
 *  @param PageSize 单页显示数据条数
 *  @param dic      其它请求参数，需要开发者来配置，如果没有请填写nil。
 *
 *  @return 返回请求JSON串，如果拼接失败，会返回提示字符串。
 */
+(NSString *)requestPublicdataWithPageNo:(NSInteger)pageNo andPageSize:(NSInteger)PageSize andRequestDic:(NSMutableDictionary *)dic;


/** * 获取当前时间的字符串 年-月-日 */
+(NSString *)setToday;

/** * 当天时间（时分秒） */
+(NSString *)setAllToday;

/** * 获取第二天的时间字符串 年-月-日 */
+(NSString *)setTomorrow;

/** * 给定时间的第二天 */
+(NSString *)setTomorrowWithDateStr:(NSString *)dateStr;


/** * 判断是周几 */
+(NSString *)calculateWeek:(NSDate *)date;


/** * 取出字符串中的数字 */
+(NSString *)cutOutNumberWithStr:(NSString *)str;

/** * 时间转字符串 */

+(NSString *)stringWithDate:(NSDate *)date;


/** * 验证密码为6-16位英文字符与数字组合  */
+ (BOOL)validateloginPassword:(NSString *) textString;


+(NSString *)orderStatus:(NSString*)status;

/** * 去除html标签  */
-(NSString *)filterHTML:(NSString *)html;

/** * 去除空格  */
+(NSString *)toEmpty:(NSString *)urlString;

/** * 去除所有空格及回车  */
+ (NSString *)removeSpaceAndNewline:(NSString *)str;
@end
