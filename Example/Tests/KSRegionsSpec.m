//
//  KSRegionsTests.m
//  KSGeographyTests
//
//  Created by Kevin Sylvestre on 06/17/2015.
//  Copyright (c) 2015 Kevin Sylvestre. All rights reserved.
//

#import <KSGeography/KSRegions.h>
#import <KSGeography/KSRegion.h>

SpecBegin(KSRegions)

describe(@"KSRegions", ^{
    describe(@".all", ^{
        it(@"loads all regions from the configuration", ^{
            KSRegions *collection = [KSRegions all];
            expect(collection.models).toNot.beEmpty();
        });
    });
    
    describe(@"#named:", ^{
        it(@"finds a country by name", ^{
            KSRegion *region = [KSRegions.all named:@"Yukon"];
            expect(region.name).to.equal(@"Yukon");
        });
    });
    
    describe(@"#coded:", ^{
        it(@"finds a country by name", ^{
            KSRegion *region = [KSRegions.all coded:@"YT"];
            expect(region.code).to.equal(@"YT");
        });
    });
});

SpecEnd
