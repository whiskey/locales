//
//  IGLocalizedCell.m
//  Countries
//
//  Created by Carsten Witzke on 31.05.13.
//  Copyright (c) 2013 Innogames GmbH. All rights reserved.
//

#import "IGLocalizedCell.h"

@implementation IGLocalizedCell

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
