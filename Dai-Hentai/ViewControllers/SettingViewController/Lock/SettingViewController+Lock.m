//
//  SettingViewController+Lock.m
//  Dai-Hentai
//
//  Created by DaidoujiChen on 2018/3/12.
//  Copyright © 2018年 DaidoujiChen. All rights reserved.
//

#import "SettingViewController+Lock.h"
#import "UIAlertController+Block.h"
#import "Dai_Hentai-Swift.h"
#import "DBUserPreference.h"

@implementation SettingViewController (Lock)

- (void)onLockThisAppPress {
    if (self.info.isLockThisApp.boolValue) {
        @weakify(self);
        [AuthHelper checkFor:@"Verify identity to unlock " completion: ^(BOOL pass) {
            @strongify(self);
            
            if (pass) {
                self.info.isLockThisApp = @(NO);
                [self displayLockThisAppText];
                [DBUserPreference setInfo:self.info];
                [AuthHelper refresh];
            }
            else {
                exit(0);
            }
        }];
        return;
    }
    
    // 無上鎖時, 跟用戶確認要上鎖這件事
    @weakify(self);
    [UIAlertController showAlertTitle:@"Are you sure you want to lock it?" message:@"In the future, only fingerprints or faces can be used to unlock, passwords can not!" defaultOptions:@[ @"OK" ] cancelOption:@"O口O Yes or No, let me consider " handler: ^(NSInteger optionIndex) {
        if (!optionIndex) {
            return;
        }
        
        @strongify(self);
        if ([AuthHelper canLock]) {
            self.info.isLockThisApp = @(YES);
            [self displayLockThisAppText];
            [DBUserPreference setInfo:self.info];
        }
    }];
}

- (void)displayLockThisAppText {
    if (self.info.isLockThisApp.boolValue) {
        self.lockThisAppLabel.text = @"Currently locked";
    }
    else {
        self.lockThisAppLabel.text = @"Currently unlocked";
    }
}

@end
