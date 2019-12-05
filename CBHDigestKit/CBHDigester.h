//  CBHDigester.h
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

@import Foundation;

#import <CBHDigestKit/CBHDigestTypes.h>


NS_ASSUME_NONNULL_BEGIN

@interface CBHDigester : NSObject
{
	@protected
	BOOL _isFinished;
}

#pragma mark - Factories

/** This method digests a given string using the specified parameters.
 *
 * @param string		The string to digest.
 * @param encoding		The encoding to use in converting the string to data.
 * @param algorithm		The algorithm to use in digesting the string.
 *
 * @return				The digest of the string.
 */
+ (NSData *)digestString:(NSString *)string usingEncoding:(NSStringEncoding)encoding andAlgorithm:(CBHDigestAlgorithm)algorithm;

/** This method digests the given data using the specified parameters.
 *
 * @param data			The data to digest.
 * @param algorithm		The algorithm to use in digesting the data.
 *
 * @return				The digest of the data.
 */
+ (NSData *)digestData:(NSData *)data usingAlgorithm:(CBHDigestAlgorithm)algorithm;

/** This method digests the given stream using the specified parameters.
 *
 * @param stream		The stream of data to digest.
 * @param algorithm		The algorithm to use in digesting the stream.
 *
 * @return				The digest of the stream.
 */
+ (nullable NSData *)digestStream:(NSInputStream *)stream usingAlgorithm:(CBHDigestAlgorithm)algorithm;

/** This method digests the given stream using the specified parameters.
 *
 * @param stream		The stream of data to digest.
 * @param algorithm		The algorithm to use in digesting the stream.
 * @param bufferSize	The size of the buffer to use while digesting the stream.
 *
 * @return				The digest of the stream.
 */
+ (nullable NSData *)digestStream:(NSInputStream *)stream usingAlgorithm:(CBHDigestAlgorithm)algorithm withBufferSize:(NSUInteger)bufferSize;


#pragma mark - Cluster Factory

/** This method produces a digester which uses SHA-224.
 *
 * @return		A Digester which uses SHA-224.
 */
+ (instancetype)sha224;

/** This method produces a digester which uses SHA-256.
 *
 * @return		A Digester which uses SHA-256.
 */
+ (instancetype)sha256;

/** This method produces a digester which uses SHA-384.
 *
 * @return		A Digester which uses SHA-384.
 */
+ (instancetype)sha384;

/** This method produces a digester which uses SHA-512.
 *
 * @return		A Digester which uses SHA-512.
 */
+ (instancetype)sha512;

/** This method produces a digester which uses SHA-1.
 *
 * @return		A Digester which uses SHA-1.
 */
+ (instancetype)sha1;

/** This method produces a digester which uses MD2.
 *
 * @return		A Digester which uses MD2.
 */
+ (instancetype)md2;

/** This method produces a digester which uses MD4.
 *
 * @return		A Digester which uses MD4.
 */
+ (instancetype)md4;

/** This method produces a digester which uses MD5.
 *
 * @return		A Digester which uses MD5.
 */
+ (instancetype)md5;

/** This method produces a digester using the algorithm specified.
 *
 * @param algorithm		The algorithm for the digester to use.
 *
 * @return				A Digester.
 */
+ (instancetype)digesterUsingAlgorithm:(CBHDigestAlgorithm)algorithm;


#pragma mark - Initializers

- (instancetype)init NS_UNAVAILABLE;

/** This method produces a digester using the algorithm specified.
 *
 * @param algorithm		The algorithm to use in digesting.
 *
 * @return				A Digester.
 */
- (instancetype)initWithAlgorithm:(CBHDigestAlgorithm)algorithm NS_DESIGNATED_INITIALIZER;


#pragma mark - Operations

/** This method adds data to the digest.
 *
 * @param data			The data to update the digest with.
 */
- (void)update:(NSData *)data;

/** This method adds data to the digest.
 *
 * @param bytes			The data to update the digest with.
 * @param length		The length of the bytes parameter.
 */
- (void)updateWithBytes:(const void *)bytes ofLength:(NSUInteger)length;

/** This method finalizes and returns the digest.
 *
 * @return				The digest of the processed data
 */
- (NSData *)finish;


#pragma mark - Properties

/** This property specifies the algorithm used by this instance. */
@property (nonatomic, readonly) CBHDigestAlgorithm algorithm;

/** This property specifies if the digester is finished hashing. */
@property (nonatomic, readonly) BOOL isFinished;

@end

NS_ASSUME_NONNULL_END
