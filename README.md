# CBHDigest

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

`CBHDigest` extends `NSData` and `NSString` with a category adding methods for several digests and converting from `bytesToHex`.

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
CBHDigest is available under the [ISC license](https://github.com/chris-huxtable/CBHDigest/blob/master/LICENSE).
