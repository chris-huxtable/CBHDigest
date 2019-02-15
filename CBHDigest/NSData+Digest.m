//
//	NSData+Digest.m
//	CBHDigest
//
//	Created by Christian Huxtable, July 2013.
//	Copyright (c) 2013, Christian Huxtable <chris@huxtable.ca>
//
//	Permission to use, copy, modify, and/or distribute this software for any
//	purpose with or without fee is hereby granted, provided that the above
//	copyright notice and this permission notice appear in all copies.
//
//	THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
//	WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
//	MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
//	ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
//	WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
//	ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
//	OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
//

#import "NSData+Digest.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSData (Digest)


#pragma mark - Secure Hash Algorithm 2

- (NSData *)sha224
{
	const uint8_t *bytes = (const uint8_t *)[self bytes];
	if ( bytes == nil ) { return nil; }

	uint8_t digest[CC_SHA224_DIGEST_LENGTH];
	if ( !CC_SHA224(bytes, (CC_LONG)[self length], digest) ) { return nil; }

	return [NSData dataWithBytes:digest length:CC_SHA224_DIGEST_LENGTH];
}

- (NSData *)sha256
{
	const uint8_t *bytes = (const uint8_t *)[self bytes];
	if ( bytes == nil ) { return nil; }

	uint8_t digest[CC_SHA256_DIGEST_LENGTH];
	if ( !CC_SHA256(bytes, (CC_LONG)[self length], digest) ) { return nil; }

	return [NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
}

- (NSData *)sha384
{
	const uint8_t *bytes = (const uint8_t *)[self bytes];
	if ( bytes == nil ) { return nil; }

	uint8_t digest[CC_SHA384_DIGEST_LENGTH];
	if ( !CC_SHA384(bytes, (CC_LONG)[self length], digest) ) { return nil; }

	return [NSData dataWithBytes:digest length:CC_SHA384_DIGEST_LENGTH];
}

- (NSData *)sha512
{
	const uint8_t *bytes = (const uint8_t *)[self bytes];
	if ( bytes == nil ) { return nil; }

	uint8_t digest[CC_SHA512_DIGEST_LENGTH];
	if ( !CC_SHA512(bytes, (CC_LONG)[self length], digest) ) { return nil; }

	return [NSData dataWithBytes:digest length:CC_SHA512_DIGEST_LENGTH];
}


#pragma mark - Secure Hash Algorithm 1

- (NSData *)sha1
{
	const uint8_t *bytes = (const uint8_t *)[self bytes];
	if ( bytes == nil ) { return nil; }

	uint8_t digest[CC_SHA1_DIGEST_LENGTH];
	if ( !CC_SHA1(bytes, (CC_LONG)[self length], digest) ) { return nil; }

	return [NSData dataWithBytes:digest length:CC_SHA1_DIGEST_LENGTH];
}


#pragma mark - Message-Digest Algorithm

- (NSData *)md2
{
	const uint8_t *bytes = (const uint8_t *)[self bytes];
	if ( bytes == nil ) { return nil; }

	uint8_t digest[CC_MD2_DIGEST_LENGTH];
	if ( !CC_MD2(bytes, (CC_LONG)[self length], digest) ) { return nil; }

	return [NSData dataWithBytes:digest length:CC_MD2_DIGEST_LENGTH];
}

- (NSData *)md4
{
	const uint8_t *bytes = (const uint8_t *)[self bytes];
	if ( bytes == nil ) { return nil; }

	uint8_t digest[CC_MD4_DIGEST_LENGTH];
	if ( !CC_MD4(bytes, (CC_LONG)[self length], digest) ) { return nil; }

	return [NSData dataWithBytes:digest length:CC_MD4_DIGEST_LENGTH];
}

- (NSData *)md5
{
	const uint8_t *bytes = (const uint8_t *)[self bytes];
	if ( bytes == nil ) { return nil; }

	uint8_t digest[CC_MD5_DIGEST_LENGTH];
	if ( !CC_MD5(bytes, (CC_LONG)[self length], digest) ) { return nil; }

	return [NSData dataWithBytes:digest length:CC_MD5_DIGEST_LENGTH];
}

@end
