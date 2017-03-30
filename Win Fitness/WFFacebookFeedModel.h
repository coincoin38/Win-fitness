//
//  WFFaceBookFeedModel.h
//  Win Fitness
//
//  Created by julien gimenez on 28/02/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WFFacebookFeedModel : NSObject

@property(nonatomic,strong) NSString *created_time;
@property(nonatomic,strong) NSString *_description;
@property(nonatomic,strong) NSString *message;
@property(nonatomic,strong) NSString *full_picture;
@property(nonatomic,strong) NSString *identifier;
@property(nonatomic,strong) NSString *type;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSArray<NSString *>*actions;
@property(nonatomic,strong) NSDictionary *data;

@property(nonatomic,strong) UIImage * downloadedPicture;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
