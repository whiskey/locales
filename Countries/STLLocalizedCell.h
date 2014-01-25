//
//  IGLocalizedCell.h
//  Countries
//
//  Created by Carsten Witzke on 31.05.13.
//  Copyright (c) 2014 staticline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STLLocalizedCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyLabel;
@end
