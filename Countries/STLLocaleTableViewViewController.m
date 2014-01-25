//
//  IGLocaleTableViewViewController.m
//  Countries
//
//  Created by Carsten Witzke on 31.05.13.
//  Copyright (c) 2014 staticline. All rights reserved.
//

#import "STLLocaleTableViewViewController.h"
#import "STLLocalizedCell.h"

@interface STLLocaleTableViewViewController ()
@property (strong, nonatomic) NSArray *locales;
@property (strong, nonatomic) NSDate *fixedDate;
@property (strong, nonatomic) NSOperationQueue *queue;
@end

@implementation STLLocaleTableViewViewController

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
    
    self.queue = [[NSOperationQueue alloc] init];
    self.fixedDate = [NSDate date];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
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
        NSSet *locales = [NSSet setWithArray:@[
                                               [NSLocale currentLocale],
                                               [[NSLocale alloc] initWithLocaleIdentifier:@"de_DE"],
                                               [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"],
                                               [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"],
                                               [[NSLocale alloc] initWithLocaleIdentifier:@"ar_AE"],
                                               [[NSLocale alloc] initWithLocaleIdentifier:@"eo"], //esperanto
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
                                               // 'crazy' combinations
                                               [[NSLocale alloc] initWithLocaleIdentifier:@"de_EN"],
                                               ]
                          ];
        self.locales = locales.allObjects;
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
    // table view cell
    static NSString *CellIdentifier = @"localizedCell";
    STLLocalizedCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        NSLocale *locale = [_locales objectAtIndex:indexPath.row];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterFullStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
        dateFormatter.locale = locale;
        
        NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
        timeFormatter.dateStyle = NSDateFormatterNoStyle;
        timeFormatter.timeStyle = NSDateFormatterFullStyle;
        timeFormatter.locale = locale;
        
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        numberFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
        numberFormatter.locale = locale;
        
        // name
        if (indexPath.section == 0 && indexPath.row == 0) {
            cell.nameLabel.text = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"current locale", nil), locale.localeIdentifier];
        } else {
            cell.nameLabel.text = locale.localeIdentifier;
        }
        // now
        cell.dateLabel.text = [dateFormatter stringFromDate:_fixedDate];
        cell.timeLabel.text = [timeFormatter stringFromDate:_fixedDate];
        // money, money, money \o/
        cell.currencyLabel.text = [numberFormatter stringFromNumber:@1231312.99];
    }];
    
    return cell;
}


@end
