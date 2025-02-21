---
title: Nibinstantiable
parent: iOS
---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

<!--- Everything above this is generated --->

---
title: Nibinstantiable
parent: iOS
---

1. TOC
{:toc}
// Definition

protocol NibInstantiable {
    static var nibName: String {get}
    static func instantiateFromNib() -> Self
}

extension NibInstantiable {
    static func instantiateFromNib() -> Self {
        let nib = UINib(nibName: nibName, bundle: nil)
        let first = nib.instantiate(withOwner: self, options: nil).first
        let view = first as! Self
        return view
    }
}

// Conformance

class CustomView: UIView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
}

extension CustomView: NibInstantiable {
    static var nibName: String {
        return "CustomView"
    }
}

// Example
let customView = CustomView.instantiateFromNib()
self.view.addSubview(customView)        
customView.translatesAutoresizingMaskIntoConstraints = false
customView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
customView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
