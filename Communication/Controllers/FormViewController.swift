import UIKit

class FormViewController: UIViewController {
    
    // MARK: - Properties
    let dataManager: DataManager
    
    private let formView: ParentFormView = {
        let view = ParentFormView()
        return view
    }()

    // MARK: - Lifecycle
    init(withDataManager dataManager: DataManager) {
        self.dataManager = dataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        makeConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        // Here all of the views knows their sizes
    }
    
    // MARK: - Methods
    @objc func doDismiss(_ sender: UIButton?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func addSubviews() {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(formView)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            formView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 1),
            formView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 1),
            formView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -1),
            formView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -1)
        ])
    }
}




//=====================ToDelete==================================

//    lazy private var infoLabel: UILabel = {
//        let label = UILabel()
//        label.layer.cornerRadius = 10
//        label.font = UIFont(name: "PartyLetPlain", size: 24)
//        label.text = "No data passed"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    private lazy var buttonDismiss: UIButton = {
//        let button = UIButton()
//        button.setTitle("Close", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(doDismiss(_:)), for: .touchUpInside)
//        return button
//    }()

//        self.view.addSubview(infoLabel)
//        self.view.addSubview(buttonDismiss)

//            infoLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            infoLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            buttonDismiss.heightAnchor.constraint(equalToConstant: 40),
//            buttonDismiss.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
//            buttonDismiss.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
//            buttonDismiss.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -50)
