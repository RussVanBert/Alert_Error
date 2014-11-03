#import "AlertSingleton.h"

@implementation AlertSingleton

+ (AlertSingleton *)sharedActionAlert {
  static AlertSingleton *_sharedInstance;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedInstance = AlertSingleton.new;
  });
  
  return _sharedInstance;
}

- (id)init {
  self = [super init];
  if (!self) return nil;
  
  self.actionAlert = [[UIAlertView alloc] initWithTitle:nil
                                                message:nil
                                               delegate:nil
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
  return self;
}

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message {
  [self showAlert:self.actionAlert
        withTitle:title
          message:message];
}

- (void)showAlert:(UIAlertView *)alert
        withTitle:(NSString *)title
          message:(NSString *)message {
  if (self.isAlertDisplayed) {
    NSLog(@"Alert already showing! Not opening another one.\n"
          @"Title: %@, Message: %@", title, message);
    return; // never open two at once
  }
  
  alert.title = title;
  alert.message = message;
  [alert show];
}

- (BOOL)isAlertDisplayed {
  return self.actionAlert.visible;
}

@end
