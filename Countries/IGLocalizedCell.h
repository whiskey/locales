//
//  IGLocalizedCell.h
//  Countries
//
//  Created by Carsten Witzke on 31.05.13.
//  Copyright (c) 2013 Innogames GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IGLocalizedCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;
@end
