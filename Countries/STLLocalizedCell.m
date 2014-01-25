//
//  IGLocalizedCell.m
//  Countries
//
//  Created by Carsten Witzke on 31.05.13.
//  Copyright (c) 2014 staticline. All rights reserved.
//

#import "STLLocalizedCell.h"

@implementation STLLocalizedCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
