import UIKit

class DetailsViewController: UIViewController {
    
    var student: Student?
    var tableView = UITableView()
    
    init(student: Student) {
        self.student = student
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        if let student = self.student {
            let age = student.age
            let hobby = student.hobby
        }
        configureTableView()
    }
    
    func createStudentNameLabel() -> UILabel {
        let studentLabel = UILabel()
        studentLabel.text = student!.name
        studentLabel.textColor = .black
        
        return studentLabel
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setDelegates()
        tableView.rowHeight = 44.5
        tableView.register(ContactCell.self, forCellReuseIdentifier: "ContactCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -3).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
    }
    
    func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") as! ContactCell
        switch indexPath.row {
        case 0:
            cell.contactNameLabel.text = "Name: \(student!.name)"
        case 1:
            cell.contactNameLabel.text = "Age: \(String(student!.age))"
        case 2:
            cell.contactNameLabel.text = "Hobby: \(student!.hobby)"
        default:
            break
        }
        return cell
    }
    
    
}



