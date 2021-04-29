import UIKit

final class DataManager: NSObject {
 
    // MARK: - Properties
    private let person: Parent
    private var childs: [Child] {
        return person.returnChilds()
    }
    private var tableView: UITableView?
    private var editingChild: Child?
    
    // MARK: - Initialization
    override init() {
        let mockData = MockData()
        self.person = mockData.getPerson()
    }
    
    // MARK: - Methods
    public func addChild() {
        self.person.addChild(withName: "", andAge: 0)
    }
    
    public func isMaxChilds() -> Bool {
        return self.person.returnChilds().count > 5
    }
}

extension DataManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.tableView = tableView
        let cell = tableView.dequeueReusableCell(withIdentifier: ChildCell.identifier) as! ChildCell
        let childInfo = childs[indexPath.row]
        cell.configureWithData(childInfo, textFieldDelegate: self)
        return cell
    }
}

extension DataManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let child = childs[indexPath.row]
        self.editingChild = child
        print(child)
    }
}

extension DataManager: UITextFieldDelegate {
    
    @objc func saveChild(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard (textField.tag == 0 && string.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil) || (textField.tag == 1 && string.rangeOfCharacter(from: CharacterSet.letters) == nil) else {
            if textField.tag == 0 {
                textField.placeholder = "Please enter letters only"
            } else if textField.tag == 1 {
                textField.placeholder = "Please enter numbers only"
            }
            return false
        }

        guard let oldString = textField.text else { return false }
        
        if oldString.count > 12 {
            #warning("delete this print")
            print(string.count)
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        func getChild() -> Child? {
            if let child  = self.editingChild {
                return child
            } else {
                // shit code but it works
                let superview = textField.superview?.superview as! ChildCell
                return superview.child
            }
        }
        
        guard let child = getChild(), let newValue = textField.text else { return false }
        
        if textField.tag == 0 {
            person.addChild(withName: newValue, andAge: child.age)
            #warning("delete these prints")
            print("name saved")
        } else if textField.tag == 1 {
            person.addChild(withName: child.name, andAge: UInt(newValue) ?? 0)
            print("age saved")
        }
        self.tableView?.reloadData()
        textField.resignFirstResponder()
        return true
    }
}
