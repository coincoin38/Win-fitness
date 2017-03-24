//
//  WFCustomLabel.h
//  Win Fitness
//
//  Created by julien gimenez on 24/03/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    DateStyle = 1,
    DescriptionStyle
} styles;

@interface WFCustomLabel : UILabel

- (instancetype)initWithFrame:(CGRect)frame andStyle:(styles)type;

@end
