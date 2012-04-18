#import "UIApplication+BKDNetworkActivity.h"

static NSUInteger bkd_networkActivityCount = 0;

@implementation UIApplication (BKDNetworkActivity)

- (NSUInteger)bkd_networkActivityCount {
    return bkd_networkActivityCount;
}

- (void)bkd_refreshNetworkActivityIndicator {
    BOOL active = (bkd_networkActivityCount > 0);
    self.networkActivityIndicatorVisible = active;
}

- (void)bkd_pushNetworkActivity {
    bkd_networkActivityCount++;
    [self bkd_refreshNetworkActivityIndicator];
}

- (void)bkd_popNetworkActivity {
    if (bkd_networkActivityCount > 0) {
        bkd_networkActivityCount--;
        [self bkd_refreshNetworkActivityIndicator];
    } else {
        NSLog(@"-[%@ %@] Unbalanced network activity: activity count already 0.",
              NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    }
}

- (void)bkd_resetNetworkActivity {
    bkd_networkActivityCount = 0;
    [self bkd_refreshNetworkActivityIndicator];
}

@end