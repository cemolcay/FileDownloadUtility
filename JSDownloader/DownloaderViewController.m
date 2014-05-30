//
//  DownloaderViewController.m
//  JSDownloader
//
//  Created by Cem Olcay on 29/05/14.
//  Copyright (c) 2014 studionord. All rights reserved.
//

#import "DownloaderViewController.h"

@interface DownloaderViewController ()

@end

@implementation DownloaderViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (IBAction)downloadPressed:(id)sender {
    
    if (self.jsURL.stringValue.length <= 0) {
        return;
    }
    
    [self.downloadButton setHidden:YES];
    self.progress = [[NSProgressIndicator alloc] initWithFrame:self.downloadButton.frame];
    [self.progress setStyle:NSProgressIndicatorBarStyle];
    [self.progress startAnimation:self];
    [self.view addSubview:self.progress];
    
    NSURL *url = [NSURL URLWithString:self.jsURL.stringValue];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

        if (connectionError || !data) {
            [self alert:@"error getting data" ];
            [self resetApp];
        }
        
        NSSavePanel * savePanel = [NSSavePanel savePanel];
        //[savePanel setAllowedFileTypes:@[@"js"]];
        [savePanel setDirectoryURL:[NSURL URLWithString:@"~/Desktop"]];
        [savePanel beginSheetModalForWindow:self.view.window completionHandler:^(NSInteger result){
            if (result == NSFileHandlingPanelOKButton) {
                [savePanel orderOut:self];
                [data writeToURL:savePanel.URL atomically:YES];
                
                [self resetApp];
            }
            else if (result == NSFileHandlingPanelCancelButton) {
                [self resetApp];
            }
        }];
        
    }];
}

- (void)resetApp {
    [self.jsURL setStringValue:@""];
    [self.progress stopAnimation:self];
    [self.progress removeFromSuperview];
    self.progress = nil;
    [self.downloadButton setHidden:NO];
}

- (void)alert:(NSString *)title {
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:@"OK"];
    [alert setMessageText:title];
    [alert setAlertStyle:NSWarningAlertStyle];
    [alert runModal];
}

@end
