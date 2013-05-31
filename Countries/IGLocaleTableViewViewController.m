//
//  IGLocaleTableViewViewController.m
//  Countries
//
//  Created by Carsten Witzke on 31.05.13.
//  Copyright (c) 2013 Innogames GmbH. All rights reserved.
//

#import "IGLocaleTableViewViewController.h"
#import "IGLocalizedCell.h"

@interface IGLocaleTableViewViewController ()
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) NSDateFormatter *timeFormatter;
@property (strong, nonatomic) NSNumberFormatter *numberFormatter;
@property (strong, nonatomic) NSArray *locales;
@property (strong, nonatomic) NSDate *fixedDate;
@end

@implementation IGLocaleTableViewViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    _dateFormatter.dateStyle = NSDateFormatterFullStyle;
    _dateFormatter.timeStyle = NSDateFormatterNoStyle;
    
    self.timeFormatter = [[NSDateFormatter alloc] init];
    _timeFormatter.dateStyle = NSDateFormatterNoStyle;
    _timeFormatter.timeStyle = NSDateFormatterFullStyle;
    
    self.numberFormatter = [[NSNumberFormatter alloc] init];
    _numberFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
    
    self.fixedDate = [NSDate date];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - properties

- (NSArray *)locales
{
    if (!_locales) {
        self.locales = @[
                         [NSLocale currentLocale],
                         [[NSLocale alloc] initWithLocaleIdentifier:@"de_DE"],
                         [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"],
                         [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"],
                         [[NSLocale alloc] initWithLocaleIdentifier:@"ar_AE"],
                         [[NSLocale alloc] initWithLocaleIdentifier:@"eo"],
                         [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"],
                         [[NSLocale alloc] initWithLocaleIdentifier:@"zh_TW"],
                         [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"],
                         [[NSLocale alloc] initWithLocaleIdentifier:@"pl_PL"],
                         [[NSLocale alloc] initWithLocaleIdentifier:@"cs_CZ"],
                         [[NSLocale alloc] initWithLocaleIdentifier:@"kk_KZ"],
                         [[NSLocale alloc] initWithLocaleIdentifier:@"fa_IR"],
                         [[NSLocale alloc] initWithLocaleIdentifier:@"es_DO"],
                         [[NSLocale alloc] initWithLocaleIdentifier:@"ko_KR"],
                         [[NSLocale alloc] initWithLocaleIdentifier:@"de_CH"],
                         // custom combination
                         //[[NSLocale alloc] initWithLocaleIdentifier:@"de_EN"],
                         ];
    }
    return _locales;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.locales.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLocale *locale = [_locales objectAtIndex:indexPath.row];
    _dateFormatter.locale = locale;
    _timeFormatter.locale = locale;
    _numberFormatter.locale = locale;
    
    // table view cell
    static NSString *CellIdentifier = @"localizedCell";
    IGLocalizedCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // name
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.nameLabel.text = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"current locale", nil), locale.localeIdentifier];
    } else {
        cell.nameLabel.text = locale.localeIdentifier;
    }
    // now
    cell.dateLabel.text = [_dateFormatter stringFromDate:_fixedDate];
    cell.timeLabel.text = [_timeFormatter stringFromDate:_fixedDate];
    // money, money, money \o/
    cell.currencyLabel.text = [_numberFormatter stringFromNumber:@1231312.99];
    
    return cell;
}

@end
