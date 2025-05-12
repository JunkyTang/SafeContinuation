# SafeContinuation

[![CI Status](https://img.shields.io/travis/Lucky/SafeContinuation.svg?style=flat)](https://travis-ci.org/Lucky/SafeContinuation)
[![Version](https://img.shields.io/cocoapods/v/SafeContinuation.svg?style=flat)](https://cocoapods.org/pods/SafeContinuation)
[![License](https://img.shields.io/cocoapods/l/SafeContinuation.svg?style=flat)](https://cocoapods.org/pods/SafeContinuation)
[![Platform](https://img.shields.io/cocoapods/p/SafeContinuation.svg?style=flat)](https://cocoapods.org/pods/SafeContinuation)

**SafeContinuation** is a lightweight Swift utility that wraps `withCheckedContinuation` with built-in **timeout support**.  
It is ideal for bridging callback-based APIs (e.g., CoreBluetooth, delegate methods) into Swift's `async/await` world.

---

## 🚀 Features

- ✅ Safe resume — ensures continuation is resumed only once  
- ⏱ Timeout auto-resume — throws error after delay if not resumed  
- 🧵 Actor-based thread safety — no locks needed  
- 📱 Supports iOS 13+ and Swift 5+  
- 🪶 Zero third-party dependencies  

---

## 📦 Installation

### CocoaPods

```ruby
pod 'SafeContinuation'
```

---

## 🧪 Usage

```swift
let result = try await SafeContinuation.withTimeout(seconds: 3) { continuation in
    someAsyncCallbackAPI { data in
        continuation.resume(returning: data)
    }
}
```
> If resume is not called within 3 seconds, .timeout error will be thrown.


---

## 📋 Requirements

- Swift 5.0 or later
- iOS 13.0 or later


---

## 👤 Author

**Lucky**  
📧 921969987@qq.com  
🔗 [https://github.com/Lucky](https://github.com/Lucky)

---

## 📄 License

SafeContinuation is available under the MIT license.  
See the [LICENSE](./LICENSE) file for full terms.

---
