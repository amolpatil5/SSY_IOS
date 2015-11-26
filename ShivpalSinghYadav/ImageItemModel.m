//
//  ImageItemModel.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 10/11/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "ImageItemModel.h"

@implementation ImageItemModel

@synthesize image_name;
@synthesize image;
@synthesize title;

-(id)initWithDict:(NSDictionary*)dict
{
    if(self = [super init])
    {
        if (dict != nil &&  (NSNull *)dict != [NSNull class] )
        {
            self.image = [dict valueForKey:@"image"];
            self.image_name = [dict valueForKey:@"image_name"];
            self.title = [dict valueForKey:@"title"];
        }
    }
    return self;
}


@end
