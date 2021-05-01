import UIKit

/*
 Сверху должны быть поля ввода ФИО и возраста пользователя.
 Ниже должна вводится информация о детях. Изначально пользователь видит только кнопку "+", при нажатии на нее появляется блок в котором можно ввести информацию о ребенке: Имя и возраст. Таким образом пользователь может добавить вплоть до 5 детей. Когда пользователь добавил 5 детей — кнопка "+" исчезает и больше недоступна. Так же напротив каждого ребенка есть кнопка "удалить" , при нажатии на которую соответствующая запись удаляется.
 */


public class ParentFormView: UIView {
    
    // MARK: - Properties
    private var contentView: UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor(displayP3Red: 131/255, green: 85/255, blue: 117/255, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var surnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите фамилию:"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите имя:"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var secondnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите отчество:"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var surnameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var nameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var secondnameTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите возраст:"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var ageTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .white
        textField.addDoneCancelToolbar()
        textField.translatesAutoresizingMaskIntoConstraints = false
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
        self.addSubview(surnameLabel)
        self.addSubview(surnameTextField)
        self.addSubview(nameLabel)
        self.addSubview(nameTextField)
        self.addSubview(secondnameLabel)
        self.addSubview(secondnameTextField)
        self.addSubview(ageLabel)
        self.addSubview(ageTextField)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            surnameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            surnameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            surnameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            surnameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            surnameTextField.topAnchor.constraint(equalTo: surnameLabel.bottomAnchor, constant: -10),
            surnameTextField.leadingAnchor.constraint(equalTo: surnameLabel.leadingAnchor),
            surnameTextField.trailingAnchor.constraint(equalTo: surnameLabel.trailingAnchor),
            surnameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            nameLabel.topAnchor.constraint(equalTo: surnameTextField.bottomAnchor, constant: -10),
            nameLabel.leadingAnchor.constraint(equalTo: surnameLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: surnameLabel.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -10),
            nameTextField.leadingAnchor.constraint(equalTo: surnameLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: surnameLabel.trailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            secondnameLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: -10),
            secondnameLabel.leadingAnchor.constraint(equalTo: surnameLabel.leadingAnchor),
            secondnameLabel.trailingAnchor.constraint(equalTo: surnameLabel.trailingAnchor),
            secondnameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            secondnameTextField.topAnchor.constraint(equalTo: secondnameLabel.bottomAnchor, constant: -10),
            secondnameTextField.leadingAnchor.constraint(equalTo: surnameLabel.leadingAnchor),
            secondnameTextField.trailingAnchor.constraint(equalTo: surnameLabel.trailingAnchor),
            secondnameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            ageLabel.topAnchor.constraint(equalTo: secondnameTextField.bottomAnchor, constant: -10),
            ageLabel.leadingAnchor.constraint(equalTo: surnameLabel.leadingAnchor),
            ageLabel.trailingAnchor.constraint(equalTo: surnameLabel.trailingAnchor),
            ageLabel.heightAnchor.constraint(equalToConstant: 40),
            
            ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: -10),
            ageTextField.leadingAnchor.constraint(equalTo: surnameLabel.leadingAnchor),
            ageTextField.trailingAnchor.constraint(equalTo: surnameLabel.trailingAnchor),
            ageTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
