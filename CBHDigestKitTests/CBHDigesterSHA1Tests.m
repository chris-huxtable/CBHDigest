//  CBHDigesterSHA1Tests.m
//  CBHDigestKit
//
//  Created by Christian Huxtable, April 2019.
//  Copyright (c) 2019, Christian Huxtable <chris@huxtable.ca>
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


@interface CBHDigesterSHA1Tests : XCTestCase
@end


@implementation CBHDigesterSHA1Tests

- (void)testString
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [CBHDigester digestString:message usingEncoding:NSUTF8StringEncoding andAlgorithm:CBHDigestAlgorithm_SHA1];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"2fd4e1c67a2d28fced849ee1bb76e7391b93eb12";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testData
{
	NSData *message = [@"The quick brown fox jumps over the lazy dog" dataUsingEncoding:NSUTF8StringEncoding];

	NSData *digest = [CBHDigester digestData:message usingAlgorithm:CBHDigestAlgorithm_SHA1];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"2fd4e1c67a2d28fced849ee1bb76e7391b93eb12";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testStream
{
	NSData *message = [@"The quick brown fox jumps over the lazy dog" dataUsingEncoding:NSUTF8StringEncoding];
	NSInputStream *stream = [NSInputStream inputStreamWithData:message];

	NSData *digest = [CBHDigester digestStream:stream usingAlgorithm:CBHDigestAlgorithm_SHA1];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"2fd4e1c67a2d28fced849ee1bb76e7391b93eb12";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testEmpty
{
	NSString *message = @"";

	NSData *digest = [CBHDigester digestString:message usingEncoding:NSUTF8StringEncoding andAlgorithm:CBHDigestAlgorithm_SHA1];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"da39a3ee5e6b4b0d3255bfef95601890afd80709";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

@end
