//
//  WFSportModel.h
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WFSportModel : NSObject

@property(nonatomic) NSInteger idSport;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *description_id;
@property(nonatomic,strong) NSString *colorString;
@property(nonatomic,strong) NSString *image;
@property(nonatomic,strong) UIColor *colorFromHexa;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
