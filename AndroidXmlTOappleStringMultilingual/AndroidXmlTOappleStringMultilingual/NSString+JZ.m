//
//  NSString+JZ.m
//  wanhongfarm
//
//  Created by wanhongios on 16/4/11.
//  Copyright © 2016年 wanhongios. All rights reserved.
//

#import "NSString+JZ.h"

@implementation NSString (JZ)


+(NSString *)stringWithLetter:(NSString *)letter string:(NSString * )string
{
    if (string) {
        NSRange range = [string rangeOfString:letter];
        NSString * str = [string substringToIndex:range.location];
        return str;
    }else{
        return @" ";
    }

}


//验证密码
+ (BOOL)validateloginPassword:(NSString *) textString{
    NSString *regex = @"^(?!^\\d*$)(?!^[a-zA-Z]*$)(?!^[-_*+@]*$)[-\\d\\w*+@]{6,16}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:textString];
}



-(NSString *)stringWithLetter:(NSString *)letter string:(NSString *)string
{
    NSRange range = [string rangeOfString:letter];
    NSString * str = [string substringToIndex:range.location];
    return str;
}


-(NSURL *)stringWithbreakpoint:(NSString *)breakpoint string:(NSString *)string
{
    if (string.length > 0 )
    {
        NSArray * picStrs = [string componentsSeparatedByString:breakpoint];
        NSURL * url = [NSURL URLWithString:picStrs[0]];
        return url;
    }else{
        return [NSURL URLWithString:@" "];
    }
}


+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\r\n" withString:@""];
    
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"&" withString:@","];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"=" withString:@":"];
//    jsonString = [NSString stringWithFormat:@"{%@}",jsonString];
    ////JLog(@"哈哈哈 jsonString= %@",jsonString);
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


+ (NSString *)requestDataWithArr:(NSArray *)arr {
    
    //    if (arr.count>0) {
    //        return nil;
    //    }
    //
    //
    //    NSString *str = [arr componentsJoinedByString];
    //
    //
    //
    //    NSString *requestDataStr;
    //    for (int i=0; i<arr.count; i++) {
    //        if ([arr[i] isKindOfClass:[NSString class]]) {
    //
    //
    //
    //        }
    //        requestDataStr =  [NSString stringWithFormat:@"%@",arr[i]];
    //        
    //    }
    return nil;
}


- (NSString *)requestUrlWithKey:(NSString *)Keystr {
    
    
    return nil;
}




// 当天时间
+(NSString *)setToday
{
    NSDate *  senddate=[NSDate date];
    
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYY-MM-dd"];
    
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    
    return locationString;
}

// 明天
+(NSString *)setTomorrow
{
    NSDate * date = [NSDate date];//当前时间
    NSDate *nextDay = [NSDate dateWithTimeInterval:24*60*60 sinceDate:date];//后一天
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    
    [dateformatter setDateFormat:@"YYYY-MM-dd"];
    NSString *  locationString=[dateformatter stringFromDate:nextDay];
    
    return locationString;
}



// 截取字符串中的数字
+(NSString *)cutOutNumberWithStr:(NSString *)str
{
    NSScanner *scanner = [NSScanner scannerWithString:str];
    [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:nil];
    
    int number;
    [scanner scanInt:&number];
    NSString *num=[NSString stringWithFormat:@"%d",number];
    return num;
}


/** * 时间转字符串 */
+(NSString *)stringWithDate:(NSDate *)date
{
    NSDateFormatter *df = [[NSDateFormatter alloc]init];//格式化
    [df setDateFormat:@"yyyy-MM-dd"];
    NSString* s1 = [df stringFromDate:date];
    return s1;
}





-(NSString *)filterHTML:(NSString *)html
{
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        [scanner scanUpToString:@"<" intoString:nil];
        [scanner scanUpToString:@">" intoString:&text];
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    return html;
}


+(NSString *)toEmpty:(NSString *)urlString
{
    return [urlString stringByReplacingOccurrencesOfString:@" " withString:@""];
}


+ (NSString *)removeSpaceAndNewline:(NSString *)str{
    NSString *temp = [str stringByReplacingOccurrencesOfString:@" " withString:@""];temp = [temp stringByReplacingOccurrencesOfString:@"\r" withString:@""];temp = [temp stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return temp;
    
}

@end
