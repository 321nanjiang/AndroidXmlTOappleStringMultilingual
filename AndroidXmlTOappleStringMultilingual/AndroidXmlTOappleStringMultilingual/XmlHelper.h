//
//  XmlHelper.h
//  kissDemo
//
//  Created by  on 2018/12/10.
//  Copyright © 2018 zhijian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KissXML.h"

NS_ASSUME_NONNULL_BEGIN

@interface XmlHelper : NSObject

- (DDXMLElement*)analysisWithString:(NSString*)xml;

- (DDXMLElement*)analysisWithContentWithData:(NSData*)data;

- (DDXMLElement*)analysisWithContentOfFile:(NSString*)path;
@end

NS_ASSUME_NONNULL_END
