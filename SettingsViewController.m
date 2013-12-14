//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Pia on 12/12/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControlSettings;
- (void) setTipDefault;
@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings (Tip Calc)";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tipControlSettings addTarget:self action:@selector(setTipDefault) forControlEvents: UIControlEventValueChanged];
    //read the defaults here, too, so we don't make the user reset his choice over and over
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int tipIndex = [defaults integerForKey:@"defaultTipIndex"];
    NSLog(@"The default tipIndex back in the settings is now %d", tipIndex);
    NSLog(@"___________________");
    
    [self.tipControlSettings setSelectedSegmentIndex:tipIndex];
    [self setTipDefault];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) setTipDefault{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int tipIndex = [self.tipControlSettings selectedSegmentIndex];
    [defaults setInteger:tipIndex forKey:@"defaultTipIndex"];
    NSLog(@"Index of the tip percentage is %d", tipIndex);
    
    [defaults synchronize];
}
@end
