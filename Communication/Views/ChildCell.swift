import UIKit

class ChildCell: UITableViewCell {

    // MARK: - Properties
    public static let identifier: String = {
        return String(describing: self)
    }()
    
    public var child: Child?
    private var dataManager: DataManager!
    
    private var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: 78/255, green: 13/255, blue: 58/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя:"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(displayP3Red: 131/255, green: 85/255, blue: 117/255, alpha: 1)
        textField.font = UIFont(name: "AppleSDGothicNeo-Light", size: 16)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tag = 0
        return textField
    }()
    
    private lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Возраст:"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public lazy var ageTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(displayP3Red: 131/255, green: 85/255, blue: 117/255, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        textField.tag = 1
        return textField
    }()
    
    public lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(displayP3Red: 18/255, green: 53/255, blue: 68/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setTitle("Удалить", for: .normal)
        button.addTarget(self, action: #selector(deleteButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    public func configureWithData(_ data: Child, textFieldDelegate: UITextFieldDelegate, dataManager: DataManager) {
        self.child = data
        self.nameTextField.text = data.name
        self.ageTextField.text = "\(data.age)"
        ageTextField.delegate = textFieldDelegate
        nameTextField.delegate = textFieldDelegate
        self.dataManager = dataManager
        ageTextField.addDoneCancelToolbar(onDone: (target: self, action: #selector(saveChild)))
    }
    
    @objc func saveChild() {
        ageTextField.resignFirstResponder()
        let child = Child(name: nameTextField.text ?? "", age: UInt(ageTextField.text ?? "0")!)
        print("Child name: \(child.name), age:\(child.age)")
        dataManager.saveChild(child)
    }
    
    @objc func deleteButtonTapped(_ sender: UIButton) {
        if let child = self.child {
            self.dataManager.deleteChild(child)
        }
    }
    
    private func setupLayout() {
        
        contentView.addSubview(cellView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(nameTextField)
        contentView.addSubview(ageLabel)
        contentView.addSubview(ageTextField)
        contentView.addSubview(deleteButton)
        
        NSLayoutConstraint.activate([
            
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            nameLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 3),
            nameLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 5),
            nameLabel.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.5),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            deleteButton.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 15),
            deleteButton.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -15),
            deleteButton.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -15),
            deleteButton.widthAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 0.8),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            nameTextField.heightAnchor.constraint(equalToConstant: 20),
            
            ageLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor),
            ageLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ageLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            ageLabel.heightAnchor.constraint(equalToConstant: 20),
            
            ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor),
            ageTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ageTextField.widthAnchor.constraint(equalTo: nameTextField.widthAnchor),
            ageTextField.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}
