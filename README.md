# CBHDigestKit

![version](https://img.shields.io/badge/version-1.1.1-blue.svg?cacheSeconds=2592000)
![licence](https://img.shields.io/badge/licence-ISC-lightgrey.svg?cacheSeconds=2592000)
![coverage](https://img.shields.io/badge/coverage-100%25-brightgreen.svg?cacheSeconds=2592000)

An easy to use category for `NSData` and `NSString` to calculate digests.

Supports:
- SHA224
- SHA256
- SHA386
- SHA512
- SHA1
- MD2
- MD4
- MD5


## Use

`CBHDigestKit` extends `NSData` and `NSString` with a category adding methods for several digests and converting from `bytesToHex`.

#### Example:

Compute the SHA256 digest of a `NSString`:
```objective-c
NSString *string = @"This is a string.";
NSData *digest = [string sha256UsingEncoding:NSUTF8StringEncoding];
```

Compute the SHA256 digest of a `NSData`:
```objective-c
NSData *data = [NSData dataWithContentsOfFile:@"/etc/hosts"];
NSData *digest = [data sha256];
```

Compute and print SHA256 digest of a file:
```objective-c
NSData *data = [NSData dataWithContentsOfFile:@"/etc/hosts"];
NSData *digest = [data sha256];
NSLog(@"0x%@", [digest bytesToHex]);
```


## Licence
CBHDigestKit is available under the [ISC license](https://github.com/chris-huxtable/CBHDigestKit/blob/master/LICENSE).
