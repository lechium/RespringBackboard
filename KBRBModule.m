#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <TVSystemMenuUI/TVSMButtonViewController.h>
#include "KBRBModule.h"

@interface PBSSystemService : NSObject
+(id)sharedInstance;
-(void)relaunchBackboardd;
@end

@interface PBSSystemServiceConnection : NSObject
+(id)sharedConnection;
-(id)systemServiceProxy;
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
