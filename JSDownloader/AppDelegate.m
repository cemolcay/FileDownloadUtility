//
//  AppDelegate.m
//  JSDownloader
//
//  Created by Cem Olcay on 29/05/14.
//  Copyright (c) 2014 studionord. All rights reserved.
//

#import "AppDelegate.h"
#import "DownloaderViewController.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    DownloaderViewController *dwn = [[DownloaderViewController alloc] initWithNibName:@"DownloaderViewController" bundle:nil];
    
    self.popUp = [[AXStatusItemPopup alloc] initWithViewController:dwn image:[NSImage imageNamed:@"jsIcon.png"] alternateImage:[NSImage imageNamed:@"jsIconPressed.png"]];
}



@end
