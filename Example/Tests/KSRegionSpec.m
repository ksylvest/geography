//
//  KSRegionTests.m
//  KSGeographyTests
//
//  Created by Kevin Sylvestre on 06/17/2015.
//  Copyright (c) 2015 Kevin Sylvestre. All rights reserved.
//

#import <KSGeography/KSRegion.h>

SpecBegin(KSRegion)

describe(@"KSRegion", ^{
    describe(@"#parse:", ^{
        it(@"parses", ^{
            KSRegion *region = [KSRegion new];
            NSDictionary *parameters = @{ KSRegionAttributes.type: @"territory",
                                          KSRegionAttributes.name: @"Yukon",
                                          KSRegionAttributes.code: @"YT" };
            
            [region parse:parameters];
            
            expect(region.type).to.equal(KSRegionTypeTerritory);
            expect(region.name).to.equal(@"Yukon");
            expect(region.code).to.equal(@"YT");
        });
    });
});

SpecEnd
