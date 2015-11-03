//
//  HelperUtility.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 25/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelperUtility : NSObject

+ (void)setLanguage:(NSString *)language;
+ (NSString *)getText:(NSString *)key errorText:(NSString *)alternate tableName:(NSString*)table;
+(NSString *)getPrefferedLanguage;
+(NSBundle*)getBundleForApp;
@end
