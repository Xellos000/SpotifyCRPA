//
//  SearchViewController.m
//  SpotifyCRPA
//
//  Created by MAC on 9/9/15.
//  Copyright (c) 2015 Your Company. All rights reserved.
//


#import "Config.h"
#import "SearchViewController.h"
#import <Spotify/SPTDiskCache.h>


@interface SearchViewController ()
@property (nonatomic,strong) NSMutableArray *artists;
@property (nonatomic,strong) NSMutableArray *nam;
@property (nonatomic,strong) SPTUser *user;
+(NSMutableArray*)array;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    
   [super viewDidLoad];
  
    SPTAuth *auth = [SPTAuth defaultInstance];
    [SPTUser requestCurrentUserWithAccessToken:auth.session.accessToken callback:^(NSError *error, SPTUser *response) {
        if(error != nil){
            NSLog(@"*** Failed to get user %@", error);
            return;
        }
        self.user = response;
        
    }];
    
    self.artists = [[NSMutableArray alloc]init];
    
    [SPTSearch performSearchWithQuery:@"Pokemon" queryType:SPTQueryTypeArtist accessToken: nil callback:^(NSError *error, SPTListPage *result) {
        
        for (SPTArtist *artist in result.items) {
            [self.artists addObject:artist];
          //  [self.nam addObject:artist.name];
        }
        
        //[self.array]= self.artists;
    }];
    
  
    
 
}




+(NSMutableArray*)array {
    static NSMutableArray *statArray;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        statArray = [NSMutableArray array];
    });
    return statArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Table View Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
  
    return self.artists.count;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    SPTPartialArtist* partialArtist = self.artists[indexPath.row];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    cell.textLabel.text = partialArtist.name;;
    return cell;

    
}










@end
