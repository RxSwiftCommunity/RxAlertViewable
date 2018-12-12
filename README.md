# RxAlertViewable [![Build Status](https://travis-ci.org/lm2343635/RxAlertViewable.svg?branch=master)](https://travis-ci.org/lm2343635/RxAlertViewable) [![Version](https://img.shields.io/cocoapods/v/RxAlertViewable.svg?style=flat)](https://cocoapods.org/pods/RxAlertViewable) [![License](https://img.shields.io/cocoapods/l/RxAlertViewable.svg?style=flat)](https://cocoapods.org/pods/RxAlertViewable) [![Platform](https://img.shields.io/cocoapods/p/RxAlertViewable.svg?style=flat)](https://cocoapods.org/pods/RxAlertViewable)

RxAlertViewable is created for developing the MVVM app with RxSwift. 
It supports to show a simple alert from the view model class using the signal `Observable<RxAlert>`.

## Installation

RxAlertViewable is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ShapeView'
```

## Documentaion

To use RxAlertViewable, confirm the `RxAlertViewable` protocol in your view controller class.

```Swift
class ViewController: UIViewController, RxAlertViewable {}
```

Prepare a singal `Observable<RxAlert>` in your view model class.

```Swift
let clickTimes = BehaviorRelay<Int>(value: 0)

var tip: Observable<RxAlert> {
    return clickTimes.map {
        RxAlert.tip(message: "Clicked \($0) times.")
    }
}
```

RxAlertViewable supports the following alert types.

- ```tip(String)```
- ```customTip(title: String, message: String)```
- ```warning(String)```
- ```error(String)```
- ```confirm(message: String, onConfirm: (() -> ())?)```
- ```customConfirm(title: String, message: String, onConfirm: (() -> ())?)```
    
Bind it in the view controller class.

```Swift
viewModel.tip.bind(to: rx.alert).disposed(by: disposeBag)
```

![Demo](https://raw.githubusercontent.com/lm2343635/RxAlertViewable/master/screenshots/demo.png)


#### Customization

Customize you own strings and tint color using the following code.

```Swfit
RxAlertCreator.instance.config = RxAlertViewConfig(tip: "My Tip",
                                                       confirm: "My Confirm",
                                                       warning: "My Warning",
                                                       error: "My Error",
                                                       yes: "My Yes",
                                                       no: "My No",
                                                       ok: "My OK",
                                                       tintColor: .blue)
```

## Author

lm2343635, lm2343635@126.com

## License

RxOrientation is available under the MIT license. See the LICENSE file for more info.
