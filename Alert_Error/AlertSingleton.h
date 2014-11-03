#import <UIKit/UIKit.h>

@interface AlertSingleton : NSObject

@property (nonatomic, strong) UIAlertView *actionAlert;

+ (AlertSingleton *)sharedActionAlert;

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;

@end
