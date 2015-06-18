//
//  KSCountriesTests.m
//  KSGeographyTests
//
//  Created by Kevin Sylvestre on 06/17/2015.
//  Copyright (c) 2015 Kevin Sylvestre. All rights reserved.
//

#import <KSGeography/KSCountries.h>
#import <KSGeography/KSCountry.h>

SpecBegin(KSCountries)

describe(@"KSCountries", ^{
    describe(@".all", ^{
        it(@"loads all countries from the configuration", ^{
            KSCountries *collection = [KSCountries all];
            expect(collection.models).toNot.beEmpty();
        });
    });
    
    describe(@"#named:", ^{
        it(@"finds a country by name", ^{
            KSCountry *country = [KSCountries.all named:@"Canada"];
            expect(country.name).to.equal(@"Canada");
        });
    });
    
    describe(@"#coded:", ^{
        it(@"finds a country by name", ^{
            KSCountry *country = [KSCountries.all coded:@"CAN"];
            expect(country.code).to.equal(@"CAN");
        });
    });
});

SpecEnd
