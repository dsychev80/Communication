import UIKit

public class AddChildFormView: UIView {
    // MARK: - Properties
    private var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите имя ребенка:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var nameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите возраст ребенка:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var ageTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.addDoneCancelToolbar()
        
        return textField
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func setupView() {
        self.layer.cornerRadius = 10
        
        self.addSubview(contentView)
        self.addSubview(nameLabel)
        self.addSubview(nameTextField)
        self.addSubview(ageLabel)
        self.addSubview(ageTextField)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -10),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            ageLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: -10),
            ageLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ageLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            ageLabel.heightAnchor.constraint(equalToConstant: 40),
            
            ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: -10),
            ageTextField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ageTextField.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            ageTextField.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    @objc func doneButtonTapped(_ sender: UIBarButtonItem) {
        ageTextField.resignFirstResponder()
    }
}
