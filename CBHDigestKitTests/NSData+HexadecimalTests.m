//  NSData+HexadecimalTests.m
//  CBHDigestKitTests
//
//  Created by Christian Huxtable, January 2020.
//  Copyright (c) 2020, Christian Huxtable <chris@huxtable.ca>
//
//  Permission to use, copy, modify, and/or distribute this software for any
//  purpose with or without fee is hereby granted, provided that the above
//  copyright notice and this permission notice appear in all copies.
//
//  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
//  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
//  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
//  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
//  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
//  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
//  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

@import XCTest;
@import CBHDigestKit;

#define CBHAssertHexString(string, expected) \
{\
	NSData *testData = [NSData dataWithHexString:string];\
	XCTAssertEqualObjects(testData, expected, @"Resultant data is incorrect.");\
}

@interface NSData_HexadecimalTests : XCTestCase
@end


@implementation NSData_HexadecimalTests

- (void)testHexInitialization_basic
{
	CBHAssertHexString(@"", [[NSData alloc] init]);

	const uint8_t data[4] = { 0xDE, 0xAD, 0xBE, 0xEF };
	NSData *expectedData = [NSData dataWithBytes:data length:4];

	CBHAssertHexString(@"deadbeef",          expectedData);
	CBHAssertHexString(@"de ad b e e f",     expectedData);
	CBHAssertHexString(@"de ad b e e f ",    expectedData);
	CBHAssertHexString(@"de ad b e e f  ",   expectedData);
	CBHAssertHexString(@" de ad b e e f",    expectedData);
	CBHAssertHexString(@"  de ad b e e f",   expectedData);
	CBHAssertHexString(@" de ad b e e f ",   expectedData);
	CBHAssertHexString(@"  de ad b e e f  ", expectedData);
	CBHAssertHexString(@"DeadBeef",          expectedData);
	CBHAssertHexString(@"DEADbeef",          expectedData);
	CBHAssertHexString(@"de:ad:be:ef",       expectedData);
	CBHAssertHexString(@"DE:AD:BE:EF",       expectedData);
}

- (void)testHexInitialization_incomplete
{
	const uint8_t data[5] = { 0x0A, 0xDE, 0xAD, 0xBE, 0xEF };
	NSData *expectedData = [NSData dataWithBytes:data length:5];

	CBHAssertHexString(@"0adeadbeef", expectedData);
	CBHAssertHexString(@"adeadbeef",  expectedData);
}

@end
