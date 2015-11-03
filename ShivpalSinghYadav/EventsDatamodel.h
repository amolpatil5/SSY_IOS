//
//  EventsDatamodel.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 10/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventsDatamodel : NSObject

@property (strong,nonatomic) NSString *image;
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *desc;
@property (strong,nonatomic) NSString *details;

-(id)initWithDict:(NSDictionary*)dict;


@end
