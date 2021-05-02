import UIKit

final class DataManager: NSObject {
 
    // MARK: - Properties
    private let person: Parent
    private var childs: [Child] {
        return person.returnChilds()
    }
    private var tableView: UITableView?
    private var editingChild: Child?
    
    private var dataIsUpdated: ()->()
    
    // MARK: - Initialization
    init(withClosure closure: @escaping ()->()) {
        let mockData = MockData()
        self.person = mockData.getPerson()
        self.dataIsUpdated = closure
    }
    
    // MARK: - Methods
    public func addNewChild() {
        self.person.addNewChild()
    }
    
    public func isMaxChilds() -> Bool {
        return self.person.returnChilds().count >= 5
    } 
    
    public func saveChild(_ child: Child) {
        if child.name != "" && child.age != 0 {
            self.person.addChild(withName: child.name, andAge: child.age)
        }
        self.person.removeChild(withName: "")
        self.tableView?.reloadData()
    }
    
    public func deleteChild(_ child: Child) {
        self.person.removeChild(withName: child.name)
        self.tableView?.reloadData()
        self.dataIsUpdated()
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
        cell.configureWithData(childInfo, textFieldDelegate: self, dataManager: self)
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
        guard oldString.count < 12 else { return false }

        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        func getChild() -> Child? {
            if let child  = self.editingChild {
                return child
            } else {
                #warning("Code Smell!!! Change this code latter")
                let superview = textField.superview?.superview as! ChildCell
                return superview.child
            }
        }
        
        guard let child = getChild(), let newValue = textField.text else { return false }
        
        if textField.tag == 0 {
            person.addChild(withName: newValue, andAge: child.age)
        } else if textField.tag == 1 {
            person.addChild(withName: child.name, andAge: UInt(newValue) ?? 0)
        }
        self.tableView?.reloadData()
        textField.resignFirstResponder()
        return true
    }
}
