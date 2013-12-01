//
//  ViewController.m
//  PlistCreate
//
//  Created by albert moreno vendrell on 01/12/13.
//  Copyright (c) 2013 Albert Moreno Vendrell. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSMutableArray *testContent;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // CONTENT FOR TEST
    testContent = [[NSMutableArray alloc] init];
    for (int x = 0; x < 100; x++) {
        NSMutableDictionary *testContentDictionary = [[NSMutableDictionary alloc] init];

        [testContentDictionary setObject:@"AAAAAAAAAA" forKey:@"Field 1"];
        [testContentDictionary setObject:@"BBBBBBBBBB" forKey:@"Field 2"];
        [testContentDictionary setObject:@"0123456789" forKey:@"Field 3"];
    
        [testContent addObject:testContentDictionary];
    }
	
    // CREATE PLIST
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:testContent format:NSPropertyListBinaryFormat_v1_0 errorDescription:nil];
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:@"Test.plist"];
    
    NSLog(@"%@", filePath);
    
    [plistData writeToFile:filePath atomically:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
