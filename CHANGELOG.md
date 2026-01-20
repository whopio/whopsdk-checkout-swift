# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0] - 2026-01-19

### Changed
- Renamed `Plan` to `PlanMapping` for clarity (avoids confusion with `CheckoutPlan`)

### Fixed
- Send `app_user_id` to checkout session when present, fixing subscriptions for authenticated users

## [0.1.0] - 2026-01-13

### Added
- Initial release of WhopCheckout SDK
- StoreKit 2 integration for Apple In-App Purchases
- Web checkout support for Whop payments (US)
- Automatic region-based payment method selection
- User login/logout for linking purchases to accounts
- Purchase restoration support
- Observable state for SwiftUI integration
