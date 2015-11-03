//
//  DepartmentsDataModel.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 10/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "DepartmentsDataModel.h"
#import "Constants.h"

@implementation DepartmentsDataModel
@synthesize deptName;
@synthesize deptURL;
@synthesize deptColor;


-(id)initWithDict:(NSDictionary*)dict
{
    if(self = [super init])
    {
        if (dict != nil &&  (NSNull *)dict != [NSNull class] )
        {
            self.deptName = [dict valueForKey:KEY_DEPT_NAME];
            self.deptURL = [dict valueForKey:KEY_DEPT_URL];
            self.deptColor= [dict valueForKey:KEY_DEPT_COLOR];
        }
    }
    return self;
}

@end
