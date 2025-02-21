---
title: Tableviews
parent: iOS
---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

<!--- Everything above this is generated --->

# Table View

Table of Contents:

[Cell Actions](#cell-actions)\
[Cell containing UITextView ](#cell-containing-uitextview)\
[Cell Selection](#cell-selection)\
[UITableViewHeaderFooterView](https://nshipster.com/uitableviewheaderfooterview/)

#### Cell Actions
```swift

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ///  Notifications - Remove Button Touched
        let sel = #selector(removeButtonTouched(notif:))
        let name = NSNotification.Name(rawValue: "TableViewCellRemoveTouched")
        NotificationCenter.default.addObserver(self, selector: sel, name: name, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        /// Remove Notifications
        NotificationCenter.default.removeObserver(self)
        super.viewWillDisappear(animated)
    }
    
    /*
     MARK: - Actions - Remove Cell
     */
    func removeButtonTouched(notif: Notification) {
        guard
            let cell = notif.object as? UITableViewCell,
            let indexToRemove = self.tableView.indexPath(for: cell)?.row,
            indexToRemove < selectedOptions.count else {
                return
        }
        self.arr.remove(at: indexToRemove)
        self.render()
    }
```

#### Cell containing UITextView 

*Avoid this - use EditableTextViewController*

```swift
    // MARK: - UITextViewDelegate
    func textViewDidChange(_ textView: UITextView) {
        DispatchQueue.main.async { [weak tableView] in
            tableView?.beginUpdates()
            tableView?.endUpdates()
        }
    }
```
[Source](https://medium.com/@georgetsifrikas/embedding-uitextview-inside-uitableviewcell-9a28794daf01)


#### Cell Selection

*Types:\
Single vs Multiple\
String vs Objects*

Ensure *item* is Equatable

```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let item = arr[indexPath.row]
        cell.textLabel?.text = item.title

        if selected.contains(item) {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let cell = tableView.cellForRow(at: indexPath) else { return }

        let item = arr[indexPath.row]

        if cell.accessoryType == .checkmark {
            if let idx = selected.firstIndex(of: item) {
                selected.remove(at: idx)
            }
            cell.accessoryType = .none
        }
        else {
            selected.append(item)
            cell.accessoryType = .checkmark
        }
    }

```
