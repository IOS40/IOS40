//
//  StockData.m
//  lianxi
//
//  Created by Lucifer on 13-4-3.
//  Copyright (c) 2013年 Lucifer. All rights reserved.
//

#import "StockData.h"
static StockData *testStockData;
@implementation StockData

+ (StockData*) stocData
{
    
    if (testStockData == nil)
    {
        testStockData = [[StockData alloc] init];
    }
    
    return testStockData;
}
@end
