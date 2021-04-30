import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    private let dataManager: DataManager = DataManager()
    private var formViewController: FormViewController!
    private var childTableViewController: ChildTableViewController!
    
    private var childView: UIView {
        return self.childTableViewController.view
    }
    
    private var formView: UIView {
        return self.formViewController.view
    }
    
    private var addChildButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Child", for: .normal)
        button.addTarget(self, action: #selector(doAddChildForm(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(displayP3Red: 52/255, green: 34/255, blue: 46/255, alpha: 1)
        button.layer.cornerRadius = 5
        return button
    }()

    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        
        let formViewVC = FormViewController(withDataManager: self.dataManager)
        self.formViewController = formViewVC
        let childTableVC = ChildTableViewController(withDataManager: self.dataManager)
        self.childTableViewController = childTableVC
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(displayP3Red: 131/255, green: 85/255, blue: 117/255, alpha: 1)
        
        addSubviews()
        makeConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addButton()
    }

    // MARK: - Methods
    private func addSubviews() {
        view.addSubview(formView)
        
        addButton()   
        view.addSubview(childView)
    }
    
    private func addButton() {
        if !dataManager.isMaxChilds() {
            view.addSubview(addChildButton)
        } else {
            addChildButton.isHidden = true
        }
    }
    
    private func makeConstraints() {
        
        NSLayoutConstraint.activate([
            KeyboardLayoutConstraint(item: formView, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 1),
            formView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            formView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            formView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4),
            
            addChildButton.topAnchor.constraint(equalTo: formView.bottomAnchor, constant: 1),
            addChildButton.centerXAnchor.constraint(equalTo: formView.centerXAnchor),
            addChildButton.widthAnchor.constraint(equalToConstant: 85),
            addChildButton.heightAnchor.constraint(equalToConstant: 35),
            
            childView.topAnchor.constraint(equalTo: addChildButton.bottomAnchor),
            childView.leadingAnchor.constraint(equalTo: formView.leadingAnchor),
            childView.trailingAnchor.constraint(equalTo: formView.trailingAnchor),
            KeyboardLayoutConstraint(item: childView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 1)
        ])
    }
    
    @objc func doAddChildForm(_ sender: UIButton?) {
        dataManager.addChild()
        childTableViewController.reloadTable()
    }
}
