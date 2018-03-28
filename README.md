# MCToast
<p align="center">
        <img src="https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat-square" />
        <img src="https://img.shields.io/travis/McPusz/McToast.svg?style=flat-square" />
        <img src="https://img.shields.io/cocoapods/v/MCToast.svg?style=flat-square" />
</p>

Simple popup with text inspired by Android Toasts.

### Prerequisites
Clone repository and use as a Podfile
```
pod 'MCToast'
```
## Getting Started
### Adding and removing
Add toast
```
let toast = MCToast(text: "Hello, you fool, I love you")
toast.show()
```
Hide toast
```
toast.hide()
```
### Customize

Background color
```
toast.view.backgroundColor = .red
```
Text color
```
toast.view.textColor = .black
```
Corner radius
```
toast.view.cornerRadius = 13.0
```
