//
//	NSString+Digest.m
//	CBHDigest
//
//	Created by Christian Huxtable, February 2019.
//	Copyright (c) 2019, Christian Huxtable <chris@huxtable.ca>
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

#import "NSString+Digest.h"

#import "NSData+Digest.h"


@implementation NSString (Digest)


#pragma mark - Secure Hash Algorithm 2

- (NSData *)sha224UsingEncoding:(NSStringEncoding)encoding
{
	return [[self dataUsingEncoding:encoding] sha224];
}

- (NSData *)sha256UsingEncoding:(NSStringEncoding)encoding
{
	return [[self dataUsingEncoding:encoding] sha256];
}

- (NSData *)sha384UsingEncoding:(NSStringEncoding)encoding
{
	return [[self dataUsingEncoding:encoding] sha384];
}

- (NSData *)sha512UsingEncoding:(NSStringEncoding)encoding
{
	return [[self dataUsingEncoding:encoding] sha512];
}


#pragma mark - Secure Hash Algorithm 1

- (NSData *)sha1UsingEncoding:(NSStringEncoding)encoding
{
	return [[self dataUsingEncoding:encoding] sha1];
}


#pragma mark - Message-Digest Algorithm

- (NSData *)md2UsingEncoding:(NSStringEncoding)encoding
{
	return [[self dataUsingEncoding:encoding] md2];
}

- (NSData *)md4UsingEncoding:(NSStringEncoding)encoding
{
	return [[self dataUsingEncoding:encoding] md4];
}

- (NSData *)md5UsingEncoding:(NSStringEncoding)encoding
{
	return [[self dataUsingEncoding:encoding] md5];
}

@end
