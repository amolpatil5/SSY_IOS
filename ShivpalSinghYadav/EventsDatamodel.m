//
//  EventsDatamodel.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 10/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "EventsDatamodel.h"

@implementation EventsDatamodel

@synthesize image;
@synthesize title;
@synthesize desc;
@synthesize details;

-(id)initWithDict:(NSDictionary*)dict
{
    if(self = [super init])
    {
        if (dict != nil &&  (NSNull *)dict != [NSNull class] )
        {
            self.image = [dict valueForKey:@"image"];
            self.title = [dict valueForKey:@"title"];
            self.desc= [dict valueForKey:@"desc"];
            self.details=[dict valueForKey:@"details"];

            
//            self.desc= [self convertHtmlPlainText:[dict valueForKey:@"desc"]];
//            self.details= [self convertHtmlPlainText:[dict valueForKey:@"details"]];
        }
    }
    return self;
}






@end
