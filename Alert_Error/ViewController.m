#import "ViewController.h"
#import "AlertSingleton.h"

@implementation ViewController

static int count = 0;

- (IBAction)showBug:(id)sender {
  NSString *title;
  NSString *message;
  if (count % 2 == 0) {
    title   = @"My Error Title";
    message = @"Something went wrong.";
  } else {
    title   = nil;
    message = @"Everything is fine.";
  }

  count++;
  [[AlertSingleton sharedActionAlert] showAlertWithTitle:title message:message];
}

@end
