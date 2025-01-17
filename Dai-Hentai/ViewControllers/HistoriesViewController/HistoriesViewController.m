//
//  HistoriesViewController.m
//  Dai-Hentai
//
//  Created by DaidoujiChen on 2017/3/22.
//  Copyright © 2017年 DaidoujiChen. All rights reserved.
//

#import "HistoriesViewController.h"
#import "PrivateListViewController.h"
#import "FilesManager.h"
#import "DBGallery.h"

@interface HistoriesViewController ()

@property (nonatomic, strong) NSString *deletingMessage;

@end

@implementation HistoriesViewController

#pragma mark - Private Instance Method

- (void)refreshAction {
    if (self.isLoading) {
        return;
    }
    
    if (self.galleries.count) {
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionTop animated:NO];
    }
    [self reloadGalleries];
}

#pragma mark - Method to Override

#define pageCout 40

- (void)fetchGalleries {
    self.isLoading = YES;
    if ([self.pageLocker tryLock]) {
        NSInteger index = self.pageIndex * pageCout;
        NSArray<HentaiInfo *> *hentaiInfos = [DBGallery historiesFrom:index length:pageCout];
        if (hentaiInfos && hentaiInfos.count) {
            [self.galleries addObjectsFromArray:hentaiInfos];
            [self.collectionView reloadData];
            self.pageIndex++;
            self.isEndOfGalleries = hentaiInfos.count < 40;
        }
        else {
            self.isEndOfGalleries = YES;
        }
        self.isLoading = NO;
        [self.pageLocker unlock];
    }
}

- (void)showMessageTo:(MessageCell *)cell onLoading:(BOOL)isLoading {
    [super showMessageTo:cell onLoading:isLoading];
    if (isLoading) {
        cell.messageLabel.text = self.deletingMessage;
    }
    else {
        cell.messageLabel.text = @"You haven't seen any works yet O3O";
    }
}

- (void)onCellBeSelectedAction:(HentaiInfo *)info {
    [self performSegueWithIdentifier:@"PushToGallery" sender:info];
}

- (void)initValues {
    [super initValues];
    self.isLoading = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshAction) name:DBGalleryTimeStampUpdateNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshAction) name:DBGalleryDownloadedUpdateNotification object:nil];
}

#pragma mark - IBAction

- (IBAction)deleteAllHistoriesAction:(id)sender {
    if (!self.isLoading) {
        self.isLoading = YES;
        
        __weak HistoriesViewController *weakSelf = self;
        [UIAlertController showAlertTitle:@"O3O" message:@"Delete all watch history!" defaultOptions:@[ @"Yes O3Ob" ] cancelOption:@"Don't do it OwO\"" handler: ^(NSInteger optionIndex) {
            if (optionIndex) {
                weakSelf.deletingMessage = @"Deleting works...";
                [weakSelf.galleries removeAllObjects];
                [weakSelf.collectionView reloadData];
                
                [DBGallery deleteAllHistories: ^(NSInteger total, NSInteger index, HentaiInfo *info) {
                    weakSelf.deletingMessage = [NSString stringWithFormat:@"Deleting works ( %td / %td )", index, total];
                    [weakSelf.collectionView reloadData];
                    [[FilesManager documentFolder] rd:[info folder]];
                } onFinish: ^(BOOL successed) {
                    weakSelf.isLoading = NO;
                    [weakSelf.collectionView reloadData];
                }];
            }
        }];
    }
}

@end
