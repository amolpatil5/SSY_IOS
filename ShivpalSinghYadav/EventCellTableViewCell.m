//
//  EventCellTableViewCell.m
//  ShivpalSinghYadav
//
//  Created by Amol Patil on 11/04/15.
//  Copyright (c) 2015 Amol Patil. All rights reserved.
//

#import "EventCellTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>



#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 45.0f

@implementation EventCellTableViewCell

- (void)awakeFromNib
{
    
}

-(void) configureCellWithData:(EventsDatamodel *)eventModel
{
    [self.titleLbl setText:eventModel.title];
//    [self.descLbl setText:eventModel.desc];
    [self.descLbl setText:[self convertHtmlPlainText:eventModel.desc]];
    [self.eventImageView setImageWithURL:[NSURL URLWithString:eventModel.image]
                        placeholderImage:[UIImage imageNamed:@"head_banner"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}


-(NSString*)convertHtmlPlainText:(NSString*)HTMLString
{
    NSData *HTMLData = [HTMLString dataUsingEncoding:NSUTF8StringEncoding];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithData:HTMLData options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)} documentAttributes:NULL error:NULL];
    NSString *plainString = attrString.string;
    return plainString;
}

@end
