# CBHDigestKit

[![release](https://img.shields.io/github/release/chris-huxtable/CBHDigestKit.svg)](https://github.com/chris-huxtable/CBHDigestKit/releases)
[![pod](https://img.shields.io/cocoapods/v/CBHDigestKit.svg)](https://cocoapods.org/pods/CBHDigestKit)
[![licence](https://img.shields.io/badge/licence-ISC-lightgrey.svg?cacheSeconds=2592000)](https://github.com/chris-huxtable/CBHDigestKit/blob/master/LICENSE)
[![coverage](https://img.shields.io/badge/coverage-99%25-brightgreen.svg?cacheSeconds=2592000)](https://github.com/chris-huxtable/CBHDigestKit)

Makes calculating digests easy.

Supports:
- SHA-224
- SHA-256
- SHA-386
- SHA-512
- SHA-1
- MD2
- MD4
- MD5


## Use

`CBHDigestKit` extends `NSData` and `NSString` with a category adding methods for several digests and converting from `bytesToHex`.

#### Example:

Compute the SHA-256 digest of a `NSString`:
```objective-c
NSData *digest = [@"This is a string." sha256UsingEncoding:NSUTF8StringEncoding];
```

Compute the SHA-256 digest of a `NSData`:
```objective-c
NSData *digest = [[NSData dataWithContentsOfFile:@"/etc/hosts"] sha256];
```

Efficiently compute the  SHA-256 digest of a file:
```objective-c
NSInputStream *fileStream = [NSInputStream inputStreamWithFileAtPath:@"/etc/hosts"];
NSData *digest = [CBHDigester digestStream:fileStream usingAlgorithm:CBHDigestAlgorithm_SHA256];
```

Compute and print a digest using an arbitrary algorithm:
```objective-c
CBHDigestAlgorithm algorithm = ...
NSData *data = [NSData dataWithContentsOfFile:@"/etc/hosts"];
NSData *digest = [data digestUsingAlgorithm:algorithm];
NSLog(@"0x%@", [digest encodeAsHexadecimal]);
```


## Licence
CBHDigestKit is available under the [ISC license](https://github.com/chris-huxtable/CBHDigestKit/blob/master/LICENSE).
