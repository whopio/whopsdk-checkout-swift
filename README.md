# WhopCheckout

A lightweight iOS SDK for integrating Whop subscriptions with Apple In-App Purchases.

## Requirements

- iOS 17.0+
- Swift 5.10+
- Xcode 15.0+

## Installation

### Swift Package Manager

Add WhopCheckout to your project via SPM:

```swift
dependencies: [
    .package(url: "https://github.com/whopio/whopsdk-checkout-swift.git", from: "0.1.0")
]
```

Or in Xcode: File → Add Package Dependencies → Enter the repository URL.

## Quick Start

### 1. Configure the SDK

Configure WhopCheckout early in your app lifecycle:

```swift
import WhopCheckout

@main
struct MyApp: App {
    init() {
        Task.detached {
            try await Checkout.shared.configure(
                companyId: "biz_xxx",
                apiKey: "your-api-key",
                plans: [
                    .init(whopId: "plan_xxx", appleId: "weekly_subscription"),
                    .init(whopId: "plan_yyy", appleId: "monthly_subscription"),
                ]
            )
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(Checkout.shared)
        }
    }
}
```

### 2. Check Subscription Status

```swift
@Environment(Checkout.self) var checkout

var body: some View {
    if checkout.isSubscribed {
        // Show premium content
    } else {
        // Show upgrade prompt
    }
}
```

### 3. Purchase a Plan

```swift
func purchase() async {
    do {
        let result = try await Checkout.shared.purchase("plan_xxx")
        print("Purchased! Receipt: \(result.receiptId)")
    } catch WhopCheckoutError.cancelled {
        // User cancelled
    } catch {
        // Handle error
    }
}
```

### 4. Display Available Plans

```swift
ForEach(checkout.plans) { plan in
    VStack {
        Text(plan.title ?? "Plan")
        Text(plan.appleDisplayPrice ?? plan.whopDisplayPrice)
    }
}
```

### 5. Refresh Plans

Fetch updated plans and pricing after initialization:

```swift
// Refresh and get updated plans
let plans = try await Checkout.shared.refreshPlans()

// Or just refresh (plans property updates automatically)
try await Checkout.shared.refreshPlans()
```

## Payment Methods

WhopCheckout automatically selects the best payment method based on region:

- **US users**: Web checkout via Whop (saves Apple's 30% fee)
- **Other regions**: Apple StoreKit

You can override this behavior:

```swift
// Force Whop web checkout
try await Checkout.shared.purchase("plan_xxx", method: .whop)

// Force Apple StoreKit
try await Checkout.shared.purchase("plan_xxx", method: .apple)
```

## User Management

### Link purchases to a user account

```swift
// Log in a user to claim device purchases
try await Checkout.shared.logIn(appUserId: "user_123")

// Log out
Checkout.shared.logOut()
```

### Restore purchases

```swift
let hasActiveSubscription = try await Checkout.shared.restorePurchases()
```

## License

Copyright Whop, Inc. All rights reserved.
