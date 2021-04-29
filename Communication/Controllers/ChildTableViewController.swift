import UIKit

class ChildTableViewController: UIViewController {
    
    // MARK: - Properties
    private var dataManager: DataManager
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        
        self.view.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(tableView)
        makeConstraints()
        
        tableView.register(ChildCell.self, forCellReuseIdentifier: ChildCell.identifier)
        tableView.dataSource = dataManager
        tableView.delegate = dataManager
    }
    
    // MARK: - Methods
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    public func reloadTable() {
        self.tableView.reloadData()
    }
}
