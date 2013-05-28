//
//  StockData.h
//  lianxi
//
//  Created by Lucifer on 13-4-3.
//  Copyright (c) 2013年 Lucifer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StockData : NSObject
{
    NSString *stockName;
    float price;
}

+ (StockData*) stocData;
@end
