//
//  ImageItemModel.h
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 10/11/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageItemModel : NSObject

@property (strong,nonatomic) NSString *image;
@property (strong,nonatomic) NSString *image_name;
@property (strong,nonatomic) NSString *title;

-(id)initWithDict:(NSDictionary*)dict;

@end
