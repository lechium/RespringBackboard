#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <TVSystemMenuUI/TVSMButtonViewController.h>
#include "KBRBModule.h"
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <sys/types.h>
#include <stdint.h>
#include <spawn.h>
#include <sys/wait.h>

@interface PBSSystemService : NSObject
+(id)sharedInstance;
-(void)deactivateApplication;
-(void)registerServiceProviderEndpoint:(id)arg1 forProviderType:(id)arg2 ;
-(void)endpointForProviderType:(id)arg1 withIdentifier:(id)arg2 responseBlock:(/*^block*/id)arg3 ;
-(void)launchKioskApp;
-(void)sleepSystemForReason:(id)arg1 ;
-(void)wakeSystemForReason:(id)arg1 ;
-(void)relaunchBackboardd;
@end

@interface PBSSystemServiceConnection : NSObject
+(id)sharedConnection;
-(id)systemServiceProxy;
-(BOOL)isValid;
-(void)setValid:(BOOL)arg1;
@end


@implementation KBRBModule

+(long long)buttonStyle {
    return 2;
}

-(id)contentViewController {
    
    TVSMButtonViewController *buttonController = (TVSMButtonViewController*)[super contentViewController];
    [buttonController setTitleText:@"Restart"];
    [buttonController setSecondaryText:@"backboardd"];
    NSString *packageFile = [[self bundle] pathForResource:@"RespringIcon" ofType:@"png"];
    [buttonController setImage:[[UIImage imageWithContentsOfFile:packageFile] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];

    return buttonController;
}

-(void)handleAction {

    id connection = [PBSSystemServiceConnection sharedConnection];
    id ssp = [connection systemServiceProxy];
    [ssp relaunchBackboardd];
}

-(BOOL)dismissAfterAction {
    return TRUE;
}

@end
