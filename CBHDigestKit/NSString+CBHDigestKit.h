//
//	NSString+CBHDigestKit.h
//	CBHDigestKit
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

@import Foundation.NSString;


NS_ASSUME_NONNULL_BEGIN

@interface NSString (CBHDigestKit)


#pragma mark - Secure Hash Algorithm 2

/** This method digests the receiving string using SHA224.
 * @param encoding	A string encoding to use in the serialization of the string.
 * @return			A NSData object containing the raw digest.
 * @since			Available in version 1.0 and later.
 */
- (NSData *)sha224UsingEncoding:(NSStringEncoding)encoding;

/** This method digests the receiving string using SHA256.
 * @param encoding	A string encoding to use in the serialization of the string.
 * @return			A NSData object containing the raw digest.
 * @since			Available in version 1.0 and later.
 */
- (NSData *)sha256UsingEncoding:(NSStringEncoding)encoding;

/** This method digests the receiving string using SHA384.
 * @param encoding	A string encoding to use in the serialization of the string.
 * @return			A NSData object containing the raw digest.
 * @since			Available in version 1.0 and later.
 */
- (NSData *)sha384UsingEncoding:(NSStringEncoding)encoding;

/** This method digests the receiving string using SHA512.
 * @param encoding	A string encoding to use in the serialization of the string.
 * @return			A NSData object containing the raw digest.
 * @since			Available in version 1.0 and later.
 */
- (NSData *)sha512UsingEncoding:(NSStringEncoding)encoding;


#pragma mark - Secure Hash Algorithm 1

/** This method digests the receiving string using SHA1.
 * @param encoding	A string encoding to use in the serialization of the string.
 * @return			A NSData object containing the raw digest.
 * @since			Available in version 1.0 and later.
 */
- (NSData *)sha1UsingEncoding:(NSStringEncoding)encoding;


#pragma mark - Message-Digest Algorithm

/** This method digests the receiving string using MD2.
 * @param encoding	A string encoding to use in the serialization of the string.
 * @return			A NSData object containing the raw digest.
 * @since			Available in version 1.0 and later.
 */
- (NSData *)md2UsingEncoding:(NSStringEncoding)encoding;

/** This method digests the receiving string using MD4.
 * @param encoding	A string encoding to use in the serialization of the string.
 * @return			A NSData object containing the raw digest.
 * @since			Available in version 1.0 and later.
 */
- (NSData *)md4UsingEncoding:(NSStringEncoding)encoding;

/** This method digests the receiving string using MD5.
 * @param encoding	A string encoding to use in the serialization of the string.
 * @return			A NSData object containing the raw digest.
 * @since			Available in version 1.0 and later.
 */
- (NSData *)md5UsingEncoding:(NSStringEncoding)encoding;

@end

NS_ASSUME_NONNULL_END
