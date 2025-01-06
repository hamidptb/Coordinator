import UIKit
import SwiftUI

class HybridViewController: UIViewController {
    private let viewModel: HybridViewModel
    
    init(viewModel: HybridViewModel) {
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
        title = "Hybrid View"
        
        // Add SwiftUI view as child
        let swiftUIView = HybridSwiftUIView()
        let hostingController = UIHostingController(rootView: swiftUIView)
        addChild(hostingController)
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let uikitLabel = UILabel()
        uikitLabel.text = "UIKit Component"
        uikitLabel.textAlignment = .center
        
        let finishButton = UIButton(configuration: .filled())
        finishButton.setTitle("Finish Flow", for: .normal)
        finishButton.addTarget(self, action: #selector(finishTapped), for: .touchUpInside)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        [uikitLabel, hostingController.view, finishButton].forEach {
            stackView.addArrangedSubview($0)
        }
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),
            hostingController.view.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        hostingController.didMove(toParent: self)
    }
    
    @objc private func finishTapped() {
        viewModel.finish()
    }
} 