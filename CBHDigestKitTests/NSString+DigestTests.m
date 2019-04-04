//
//  NSString+DigestTests.m
//  CBHDigestKit
//
//  Created by Christian Huxtable, February 2019.
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
//

#import <XCTest/XCTest.h>

#import "NSString+CBHDigestKit.h"
#import "NSData+CBHDigestKit.h"
#import "NSData+CBHHexadecimal.h"


@interface NSStringTests : XCTestCase
@end

@implementation NSStringTests


#pragma mark - SHA224

- (void)testSHA224_works
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [message sha224UsingEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"730e109bd7a8a32b1cb9d9a09aa2325d2430587ddbc0c38bad911525";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testSHA224_empty
{
	NSString *message = @"";

	NSData *digest = [message sha224UsingEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"d14a028c2a3a2bc9476102bb288234c415a2b01f828ea62ac5b3e42f";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testSHA224_runtime
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [message digestUsingAlgorithm:CBHDigestAlgorithm_SHA224 andEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"730e109bd7a8a32b1cb9d9a09aa2325d2430587ddbc0c38bad911525";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}


#pragma mark - SHA256

- (void)testSHA256_works
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [message sha256UsingEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testSHA256_empty
{
	NSString *message = @"";

	NSData *digest = [message sha256UsingEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testSHA256_runtime
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [message digestUsingAlgorithm:CBHDigestAlgorithm_SHA256 andEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}


#pragma mark - SHA384

- (void)testSHA384_works
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [message sha384UsingEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"ca737f1014a48f4c0b6dd43cb177b0afd9e5169367544c494011e3317dbf9a509cb1e5dc1e85a941bbee3d7f2afbc9b1";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testSHA384_empty
{
	NSString *message = @"";

	NSData *digest = [message sha384UsingEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"38b060a751ac96384cd9327eb1b1e36a21fdb71114be07434c0cc7bf63f6e1da274edebfe76f65fbd51ad2f14898b95b";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testSHA384_runtime
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [message digestUsingAlgorithm:CBHDigestAlgorithm_SHA384 andEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"ca737f1014a48f4c0b6dd43cb177b0afd9e5169367544c494011e3317dbf9a509cb1e5dc1e85a941bbee3d7f2afbc9b1";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}


#pragma mark - SHA512

- (void)testSHA512_works
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [message sha512UsingEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"07e547d9586f6a73f73fbac0435ed76951218fb7d0c8d788a309d785436bbb642e93a252a954f23912547d1e8a3b5ed6e1bfd7097821233fa0538f3db854fee6";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testSHA512_empty
{
	NSString *message = @"";

	NSData *digest = [message sha512UsingEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testSHA512_runtime
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [message digestUsingAlgorithm:CBHDigestAlgorithm_SHA512 andEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"07e547d9586f6a73f73fbac0435ed76951218fb7d0c8d788a309d785436bbb642e93a252a954f23912547d1e8a3b5ed6e1bfd7097821233fa0538f3db854fee6";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}


#pragma mark - SHA1

- (void)testSHA1_works
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [message sha1UsingEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"2fd4e1c67a2d28fced849ee1bb76e7391b93eb12";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testSHA1_empty
{
	NSString *message = @"";

	NSData *digest = [message sha1UsingEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"da39a3ee5e6b4b0d3255bfef95601890afd80709";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testSHA1_runtime
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [message digestUsingAlgorithm:CBHDigestAlgorithm_SHA1 andEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"2fd4e1c67a2d28fced849ee1bb76e7391b93eb12";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}


#pragma mark - MD2

- (void)testMD2_works
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [message md2UsingEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"03d85a0d629d2c442e987525319fc471";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testMD2_empty
{
	NSString *message = @"";

	NSData *digest = [message md2UsingEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"8350e5a3e24c153df2275c9f80692773";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testMD2_runtime
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [message digestUsingAlgorithm:CBHDigestAlgorithm_MD2 andEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"03d85a0d629d2c442e987525319fc471";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}


#pragma mark - MD4

- (void)testMD4_works
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [message md4UsingEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"1bee69a46ba811185c194762abaeae90";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testMD4_empty
{
	NSString *message = @"";

	NSData *digest = [message md4UsingEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"31d6cfe0d16ae931b73c59d7e0c089c0";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testMD4_runtime
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [message digestUsingAlgorithm:CBHDigestAlgorithm_MD4 andEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"1bee69a46ba811185c194762abaeae90";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}


#pragma mark - MD5

- (void)testMD5_works
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [message md5UsingEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"9e107d9d372bb6826bd81d3542a419d6";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testMD5_empty
{
	NSString *message = @"";

	NSData *digest = [message md5UsingEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"d41d8cd98f00b204e9800998ecf8427e";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}

- (void)testMD5_runtime
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [message digestUsingAlgorithm:CBHDigestAlgorithm_MD5 andEncoding:NSUTF8StringEncoding];
	NSString *digestString = [digest bytesToHex];

	XCTAssertNotNil(digest, @"Digest should not be nil.");
	XCTAssertNotNil(digestString, @"Digest string should not be nil.");

	NSString *expected = @"9e107d9d372bb6826bd81d3542a419d6";
	XCTAssertEqualObjects(digestString, expected, @"Digest should match known digest.");
}


#pragma mark - Bad Values

- (void)testBadAlgorithm
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [message digestUsingAlgorithm:@"Made up Algorithm." andEncoding:NSUTF8StringEncoding];

	XCTAssertNil(digest, @"Digest should be nil.");
}
@end
