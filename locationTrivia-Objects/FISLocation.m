//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by John Hussain on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"

@interface FISLocation ()

@end

@implementation FISLocation

//default
- (instancetype) init{
    
    self = [self initWithName:@""
                     latitude:0.0
                    longitude:0.0];
    
    return self;
}

//designated
- (instancetype) initWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude{
    
    self = [super init];
    
    if (self) {
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [[NSMutableArray alloc] init];
    }

    
    return self;
}

- (NSString*) stringByTruncatingNameToLength:(NSUInteger)length{
    
    if (length > self.name.length) {
        return self.name;
    }
    
    return [self.name substringToIndex:length];

}

- (BOOL) hasValidData{
    
    if ([self.name isEqualToString:@""] || self.name == 0) {
        
        return NO;
    }
    
    if (self.latitude < -90.0 || self.latitude > 90.0) {
        
        return NO;
    }
    
    if (self.longitude < -180.0 || self.longitude > 180.0 || self.longitude == -180.0) {
        
        return NO;
    }
    
    return YES;
}

- (FISTrivium*) triviumWithMostLikes{
    
    if (self.trivia.count == 0) {
        
        return nil;
    }
    
    NSSortDescriptor *sortByLikesDesc = [NSSortDescriptor sortDescriptorWithKey:@"likes"
                                                                      ascending:NO];
    
    NSArray *highestValueOfLikes = [self.trivia sortedArrayUsingDescriptors:@[sortByLikesDesc]];
    
    return highestValueOfLikes[0];

}

@end

