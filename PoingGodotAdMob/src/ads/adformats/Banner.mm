//
//  Banner.m
//  ads
//
//  Created by Gustavo Maciel on 18/07/23.
//

#import <Foundation/Foundation.h>
#import "Banner.h"
#import "../converters/GodotDictionaryToObject.h"
#import "../converters/ObjectToGodotDictionary.h"

enum class AdPosition {
    Top,
    Bottom,
    Left,
    Right,
    TopLeft,
    TopRight,
    BottomLeft,
    BottomRight,
    Center,
    Custom = -1 //NOT USED YET
};

@implementation Banner
- (instancetype)initWithUID:(int)UID adViewDictionary:(Dictionary)adViewDictionary {
    if ((self = [super init])) {
        self.rootController = (ViewController *)((AppDelegate *)[[UIApplication sharedApplication] delegate]).window.rootViewController;
        self.UID = [NSNumber numberWithInt:UID];
        self.adPosition = [NSNumber numberWithInt:(int) adViewDictionary["ad_position"]];

        String adUnitId = (String) adViewDictionary["ad_unit_id"];
        Dictionary adSizeDictionary = (Dictionary) adViewDictionary["ad_size"];
        GADAdSize adSize = [GodotDictionaryToObject convertDictionaryToGADAdSize:adSizeDictionary];
        
        self.bannerView = [[GADBannerView alloc] initWithAdSize:adSize];
        [self addBannerViewToView:self.bannerView];

        self.bannerView.adUnitID = [NSString stringWithUTF8String:adUnitId.utf8().get_data()];
        self.bannerView.rootViewController = self.rootController;

        self.bannerView.delegate = self;

        NSLog(@"loadRequest");
    }
    return self;
}

- (void)loadAd {
    GADRequest *request = [GADRequest request];
    [self.bannerView loadRequest:request];
}

- (void)destroy {
    [self.bannerView setHidden:YES];
    [self.bannerView removeFromSuperview];
    self.bannerView = nil;
}

- (void)hide {
    self.isHidden = YES;
    [self.bannerView setHidden:YES];
}

- (void)show {
    self.isHidden = NO;
    [self.bannerView setHidden:NO];
}

- (int)getWidth {
    return self.bannerView.bounds.size.width;
}

- (int)getHeight {
    return self.bannerView.bounds.size.height;
}

- (int)getWidthInPixels {
    CGFloat scale = [[UIScreen mainScreen] scale];
    return (int)(self.bannerView.bounds.size.width * scale);
}

- (int)getHeightInPixels {
    CGFloat scale = [[UIScreen mainScreen] scale];
    return (int)(self.bannerView.bounds.size.height * scale);
}

- (void)addBannerViewToView:(GADBannerView *)bannerView {
    bannerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.rootController.view addSubview:bannerView];
    //CENTER ON MIDDLE OF SCREEM
    [self updateBannerPositionForAdPosition:static_cast<AdPosition>([self.adPosition intValue])];
}

- (void)addConstraintForBannerView:(NSLayoutAttribute)attribute toView:(id)toView {
    [self.rootController.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.bannerView
                                  attribute:attribute
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:toView
                                  attribute:attribute
                                 multiplier:1
                                   constant:0]];
}

- (void)updateBannerPositionForAdPosition:(AdPosition)adPosition {
    NSLog(@"ADPOSITION: %i", adPosition);
    [self.rootController.view removeConstraints:self.bannerView.constraints];
    
    switch (adPosition) {
        case AdPosition::Top:
            [self addConstraintForBannerView:NSLayoutAttributeCenterX toView:self.rootController.view];
            [self addConstraintForBannerView:NSLayoutAttributeTop toView:self.rootController.view.safeAreaLayoutGuide];
            break;
            
        case AdPosition::Bottom:
            [self addConstraintForBannerView:NSLayoutAttributeCenterX toView:self.rootController.view];
            [self addConstraintForBannerView:NSLayoutAttributeBottom toView:self.rootController.view.safeAreaLayoutGuide];
            break;
            
        case AdPosition::Left:
            [self addConstraintForBannerView:NSLayoutAttributeLeft toView:self.rootController.view.safeAreaLayoutGuide];
            [self addConstraintForBannerView:NSLayoutAttributeCenterY toView:self.rootController.view.safeAreaLayoutGuide];
            break;
            
        case AdPosition::Right:
            [self addConstraintForBannerView:NSLayoutAttributeRight toView:self.rootController.view.safeAreaLayoutGuide];
            [self addConstraintForBannerView:NSLayoutAttributeCenterY toView:self.rootController.view.safeAreaLayoutGuide];
            break;
            
        case AdPosition::TopLeft:
            [self addConstraintForBannerView:NSLayoutAttributeLeft toView:self.rootController.view.safeAreaLayoutGuide];
            [self addConstraintForBannerView:NSLayoutAttributeTop toView:self.rootController.view.safeAreaLayoutGuide];
            break;
            
        case AdPosition::TopRight:
            [self addConstraintForBannerView:NSLayoutAttributeRight toView:self.rootController.view.safeAreaLayoutGuide];
            [self addConstraintForBannerView:NSLayoutAttributeTop toView:self.rootController.view.safeAreaLayoutGuide];
            break;
            
        case AdPosition::BottomLeft:
            [self addConstraintForBannerView:NSLayoutAttributeLeft toView:self.rootController.view.safeAreaLayoutGuide];
            [self addConstraintForBannerView:NSLayoutAttributeBottom toView:self.rootController.view.safeAreaLayoutGuide];
            break;
            
        case AdPosition::BottomRight:
            [self addConstraintForBannerView:NSLayoutAttributeRight toView:self.rootController.view.safeAreaLayoutGuide];
            [self addConstraintForBannerView:NSLayoutAttributeBottom toView:self.rootController.view.safeAreaLayoutGuide];
            break;
            
        case AdPosition::Center:
            [self addConstraintForBannerView:NSLayoutAttributeCenterX toView:self.rootController.view];
            [self addConstraintForBannerView:NSLayoutAttributeCenterY toView:self.rootController.view];
            break;
            
        case AdPosition::Custom:
            [self addConstraintForBannerView:NSLayoutAttributeLeft toView:self.rootController.view.safeAreaLayoutGuide attributeConstant:0];
            [self addConstraintForBannerView:NSLayoutAttributeTop toView:self.rootController.view.safeAreaLayoutGuide attributeConstant:0];
            break;
    }
    
    [self.rootController.view layoutIfNeeded];
}

- (void)addConstraintForBannerView:(NSLayoutAttribute)attribute toView:(id)toView attributeConstant:(CGFloat)constant {
    [self.rootController.view addConstraint:
     [NSLayoutConstraint constraintWithItem:self.bannerView
                                  attribute:attribute
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:toView
                                  attribute:attribute
                                 multiplier:1
                                   constant:constant]];
}

- (void)bannerViewDidReceiveAd:(GADBannerView *)bannerView {
    NSLog(@"bannerViewDidReceiveAd %@", self.UID);
    PoingGodotAdMobAdView::get_singleton()->emit_signal("on_ad_loaded", [self.UID intValue]);
}

- (void)bannerView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"bannerView:didFailToReceiveAdWithError: %@", [error localizedDescription]);
    
    PoingGodotAdMobAdView::get_singleton()->emit_signal("on_ad_failed_to_load",
                                                        [self.UID intValue],
                                                        [ObjectToGodotDictionary convertNSErrorToDictionaryAsLoadAdError:error]);
}

- (void)bannerViewDidRecordClick:(GADBannerView *)bannerView{
    NSLog(@"bannerViewDidRecordClick");
    PoingGodotAdMobAdView::get_singleton()->emit_signal("on_ad_clicked", [self.UID intValue]);
}

- (void)bannerViewDidRecordImpression:(GADBannerView *)bannerView {
    NSLog(@"bannerViewDidRecordImpression");
    PoingGodotAdMobAdView::get_singleton()->emit_signal("on_ad_impression", [self.UID intValue]);
}

- (void)bannerViewWillPresentScreen:(GADBannerView *)bannerView{
    NSLog(@"bannerViewWillPresentScreen");
    PoingGodotAdMobAdView::get_singleton()->emit_signal("on_ad_opened", [self.UID intValue]);
}

- (void)bannerViewDidDismissScreen:(GADBannerView *)bannerView {
    NSLog(@"bannerViewDidDismissScreen");
    PoingGodotAdMobAdView::get_singleton()->emit_signal("on_ad_closed", [self.UID intValue]);
}

@end

