//
//  DownloaderViewController.h
//  JSDownloader
//
//  Created by Cem Olcay on 29/05/14.
//  Copyright (c) 2014 studionord. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AXStatusItemPopup.h"

@interface DownloaderViewController : NSViewController

@property (nonatomic, weak) AXStatusItemPopup *popUp;
@property (nonatomic, weak) IBOutlet  NSTextField *jsURL;
@property (nonatomic, weak) IBOutlet NSButton *downloadButton;
@property (nonatomic, strong) NSProgressIndicator *progress;

- (IBAction)downloadPressed:(id)sender;

@end
