#import <TVSystemMenuUI/TVSMModuleContentViewControllerDelegate.h>
#import <TVSystemMenuUI/TVSMModuleContentViewController.h>
#import <TVSystemMenuUI/TVSMActionModule.h>

@interface KBRBModule : TVSMActionModule

+(long long)buttonStyle;
-(id)contentViewController;
-(void)handleAction;
-(BOOL)dismissAfterAction;
@end


