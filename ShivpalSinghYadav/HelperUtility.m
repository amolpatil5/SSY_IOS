//
//  HelperUtility.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 25/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "HelperUtility.h"
#import "Constants.h"

@implementation HelperUtility
static NSBundle *bundle = nil;
static NSBundle *ukBundle = nil;


+ (void)setLanguage:(NSString *)language
{
    NSString *path = [[ NSBundle mainBundle ] pathForResource:language ofType:@"lproj" ];
    bundle = [NSBundle bundleWithPath:path];
    
    //Use en Bundle as default Bundle
    NSString *ukPath = [[NSBundle mainBundle ] pathForResource:@"en" ofType:@"lproj" ];
    ukBundle = [NSBundle bundleWithPath:ukPath];
    
    if(bundle == nil)
    {
        NSString *path = [[ NSBundle mainBundle ] pathForResource:@"en" ofType:@"lproj" ];
        bundle = [NSBundle bundleWithPath:path];
    }
}


+ (NSString *)getText:(NSString *)key errorText:(NSString *)alternate tableName:(NSString*)table
{
    NSString *strVal = [bundle localizedStringForKey:key value:alternate table:table];
    if ([strVal isEqualToString:@"Not Found!!"] )
    {
        if(bundle != ukBundle)
        {
            strVal = [ukBundle localizedStringForKey:key value:alternate table:table];
            if ([strVal isEqualToString:@"Not Found!!"]) {
               // NSLog(@"--- Not Found --- %@", key);
            }
        }
    }

    return strVal;
}


+(NSString *)getPrefferedLanguage
{
    NSString* lang=[[NSUserDefaults standardUserDefaults]valueForKey:CURRENT_LANGUAGE];
    if (lang==nil)
    {
        lang = [[NSLocale preferredLanguages] objectAtIndex:0];
    }
    
    if([lang isEqualToString:HINDI_LANGUAGE])
    {
        return HINDI_LANGUAGE;
    }
    else
    {
        return ENGLISH_LANGUAGE;
    }
}

+(NSBundle*)getBundleForApp
{
    
    NSBundle* bundle;
    NSString* CurrentLanguage=[HelperUtility getPrefferedLanguage];
    NSString *path = [[ NSBundle mainBundle ] pathForResource:CurrentLanguage ofType:@"lproj" ];
    bundle = [NSBundle bundleWithPath:path];
    return bundle;
}

@end

