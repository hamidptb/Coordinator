import UIKit

class HomeViewController: UIViewController {
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Home"
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let detailButton = UIButton(configuration: .filled())
        detailButton.setTitle("Show Detail", for: .normal)
        detailButton.addTarget(self, action: #selector(showDetail), for: .touchUpInside)
        
        let nestedButton = UIButton(configuration: .filled())
        nestedButton.setTitle("Nested Navigation", for: .normal)
        nestedButton.addTarget(self, action: #selector(showNestedNavigation), for: .touchUpInside)
        
        let swiftUIButton = UIButton(configuration: .filled())
        swiftUIButton.setTitle("SwiftUI Flow", for: .normal)
        swiftUIButton.addTarget(self, action: #selector(showSwiftUIFlow), for: .touchUpInside)
        
        let complexModalButton = UIButton(configuration: .filled())
        complexModalButton.setTitle("Complex Modal", for: .normal)
        complexModalButton.addTarget(self, action: #selector(showComplexModal), for: .touchUpInside)
        
        [detailButton, nestedButton, swiftUIButton, complexModalButton].forEach {
            stackView.addArrangedSubview($0)
        }
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    @objc private func showDetail() {
        let item = Item(id: 1, title: "Sample Item")
        viewModel.showDetail(item: item)
    }
    
    @objc private func showNestedNavigation() {
        viewModel.showNestedNavigation()
    }
    
    @objc private func showSwiftUIFlow() {
        viewModel.showSwiftUIFlow()
    }
    
    @objc private func showComplexModal() {
        viewModel.showComplexModal()
    }
} 