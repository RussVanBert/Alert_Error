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

- (IBAction)simpleAlert:(id)sender {
  UIAlertView *simpleAv = [[UIAlertView alloc] initWithTitle:@"A Simple Title"
                                                     message:@"A simple message"
                                                    delegate:nil
                                           cancelButtonTitle:@"OK"
                                           otherButtonTitles:nil];
  [simpleAv show];
  simpleAv.title = nil;
  [simpleAv show]; // showing twice? 
}

@end
