//
//  KSCountryTests.m
//  KSGeographyTests
//
//  Created by Kevin Sylvestre on 06/17/2015.
//  Copyright (c) 2015 Kevin Sylvestre. All rights reserved.
//

#import <KSGeography/KSCountry.h>

SpecBegin(KSCountry)

describe(@"KSCountry", ^{
    describe(@"#parse:", ^{
        it(@"parses", ^{
            KSCountry *country = [KSCountry new];
            NSDictionary *parameters = @{ KSCountryAttributes.name: @"Canada",
                                          KSCountryAttributes.code: @"CAN" };
            
            [country parse:parameters];
            
            expect(country.name).to.equal(@"Canada");
            expect(country.code).to.equal(@"CAN");

        });
    });
});

SpecEnd
