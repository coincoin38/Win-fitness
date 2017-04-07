//
//  WFHeaderNewsDetailLabel.h
//  Win Fitness
//
//  Created by julien gimenez on 31/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFHeaderNewsDetailLabel : UILabel

- (instancetype)initWithFrame:(CGRect)frame withName:(NSString *)name withCreatedTime:(NSString *)createdTime;
- (instancetype)initWithFrame:(CGRect)frame withCreatedTime:(NSString *)createdTime;

@end
