//
//  DepartmentsDataModel.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 10/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DepartmentsDataModel : NSObject
{
    
}

@property (weak,nonatomic) NSString *deptName;
@property (weak,nonatomic) NSString *deptURL;
@property (weak,nonatomic) NSString *deptColor;

-(id)initWithDict:(NSDictionary*)dict;

@end
