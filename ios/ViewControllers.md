# View Controllers

[Developer Documentation](https://developer.apple.com/documentation) >
[UIKit](https://developer.apple.com/documentation/uikit) >
[View Controllers](https://developer.apple.com/documentation/uikit/view_controllers)

## Table of Contents
- [Common Boilerplate](#common-boilerplate)
- [Alerts](#alerts)
- [Keyboard](#keyboard)
- [Popover Presentation](#popover-presentation)
- [Storyboard Instantiation](#storyboard-instantiation)
- [Storyboard Unwind Segue](#unwind-segue)
- [View Controller Containment](#view-controller-containment) 


#### Common Boilerplate
```swift
protocol ViewControllerDelegate: class {
    func viewControllerDidCancel(_ viewController: ViewController)
    func viewControllerDidSave(_ viewController: ViewController)
}


// MARK: - Instantiation
static func fromStoryboard(model: Model, delegate: ViewControllerDelegate) -> ViewController {
    let vc = fromStoryboard() // defined in StoryboardInstantiable
    vc.model = model
    vc.delegate = delegate
    return vc
}


// MARK: - View Controller Lifecycle
override func viewDidLoad() {
    super.viewDidLoad()
    configureNavigationBar()
    configureToolbar()
}

func configureNavigationBar() {
    self.navigationItem.title = self.topic?.title
    let cancelSel =  #selector(cancelBarButtonTouched(sender:))
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: cancelSel)
    let saveSel = #selector(saveBarButtonTouched(sender:))
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: saveSel)
}

func configureToolbar() {
    let compose = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(composeButtonItemTouched(_:)))
    let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let export = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(exportButtonItemTouched(_:)))
    navigationController?.setToolbarHidden(false, animated: false)
    toolbarItems = [compose, spacer, export]
}

// MARK: - Actions
@objc func composeButtonItemTouched(_ sender: UIBarButtonItem) {}
@objc func exportButtonItemTouched(_ sender: UIBarButtonItem) {}
@objc func cancelBarButtonTouched(sender: UIBarButtonItem) {}
@objc func saveBarButtonTouched(sender: UIBarButtonItem) {}


// MARK: - TextView Delegate
extension ViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let nsString = textView.text as NSString? else { return true }
        let newString = nsString.replacingCharacters(in: range, with: text)
        return true
    }
}
```

#### Alerts
```swift
func showTextFieldAlert() {
    let alertController = UIAlertController(title: "New Item", message: "Add a new item", preferredStyle: .alert)
    alertController.addTextField { textField in
        textField.placeholder = "Item"
    }
    alertController.addTextField { textField in
        textField.placeholder = "Group"
    }
    let saveAction = UIAlertAction(title: "Save", style: .default) { [unowned self] action in
        guard let note = alertController.textFields?.first?.text else { return }
        let group = alertController.textFields?.last?.text
        self.createItem(title: note, group: group)
    }
    alertController.addAction(saveAction)
    alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    present(alertController, animated: true)
}
func createItem(title: String, group: String?) {
}
```

#### Keyboard

```swift
/*
MARK: - Keyboard
*/
func registerForKeyboardNotifications(shouldRegister: Bool) {
    if shouldRegister {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidShow(notif:)),
                                               name: NSNotification.Name.UIKeyboardDidShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notif:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
        }
        else {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.UIKeyboardDidShow,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.UIKeyboardWillHide,
                                                  object: nil)
        }
    }
}
func keyboardDidShow(notif: NSNotification) {
    guard let info = notif.userInfo, let infoNSValue = info[UIKeyboardFrameEndUserInfoKey] as? NSValue else { return }
    let kbSize = infoNSValue.cgRectValue.size
    let contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0)
    textView.contentInset = contentInsets
    textView.scrollIndicatorInsets = contentInsets
}
func keyboardWillHide(notif: NSNotification) {
    let contentInsets = UIEdgeInsets.zero
    textView.contentInset = contentInsets
    textView.scrollIndicatorInsets = contentInsets
}
```

#### Popover Presentation
```swift
@objc func labelButtonTouched(sender: UIBarButtonItem) {
    let vc = UIHostingController(rootView: ScreenLabelAttributesView(screen: screen))
    let nc = UINavigationController(rootViewController: vc)
    nc.modalPresentationStyle = .popover
    present(nc, animated: true)
    nc.popoverPresentationController?.barButtonItem = sender
}
```

#### Storyboard Instantiation

```swift
protocol StoryboardInstantiable {
    static var storyboardName: String { get }
    static var viewControllerIdentifier: String { get }
    static func instantiateFromStoryboard() -> Self
}

extension StoryboardInstantiable where Self: UIViewController {
    static func instantiateFromStoryboard() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
        return vc as! Self
    }
}
```

```swift
/*
 MARK - StoryboardInstantiable
 */
extension CustomViewController: StoryboardInstantiable {
    static var storyboardName: String = "Main"
    static var viewControllerIdentifier: String = "CustomViewController"
    class func instantiateFromStoryboard(delegate: CustomViewControllerDelegate) {        
        let vc = self.instantiateFromStoryboard()
        vc.delegate = delegate
        return vc
    }
}
```

- [Storyboard Initializable - NSScreencast](https://nsscreencast.com/episodes/273-storyboard-initializable)


#### Storyboard Unwind Segue

```swift
@IBAction func unwindToThisView(sender: UIStoryboardSegue) {
    if let sourceViewController = sender.sourceViewController as? ViewControllerB {
        dataRecieved = sourceViewController.dataPassed
    }
}
```
[*Source*](https://stackoverflow.com/a/35314768/12940679)

#### View Controller Containment

```swift
    /*
     View Controller Containment
     */
    var embedded: UIViewController?

    func embed(_ vc: UIViewController) {
        unembed()
        addChild(vc)
        view.addSubview(vc.view)
        vc.view.frame = view.bounds
        vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        vc.didMove(toParent: self)
        self.embedded = vc
    }

    func unembed() {
        guard let some = embedded else {
            return
        }
        some.willMove(toParent: nil)
        some.view.removeFromSuperview()
        some.removeFromParent()
        self.embedded = nil
    }

```

