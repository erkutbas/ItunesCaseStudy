//
//  AlertViewController.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import UIKit

class AlertViewController: BaseViewController<AlertViewModel>, AwakingStoryBoardDelegate {

    static var storyboard: ApplicationStoryBoards {
        return .alert
    }
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        setupViewConfigurations()
    }
    
    deinit {
        print("DEINIT AlertViewController")
    }
    
    private func setupViewConfigurations() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        containerView.layer.cornerRadius = 10
        
        let data = viewModel.getAlertViewData()
        
        icon.image = data.icon
        titleLabel.text = data.title
        subTitleLabel.text = data.subTitle
        
        addButtons()
    }
    
    private func addButtons() {
        let buttonStack = UIStackView()
        buttonStack.alignment = .center
        buttonStack.distribution = .fill
        buttonStack.axis = .horizontal
        buttonStack.spacing = 40
        
        viewModel.getAlertViewData().buttons?.forEach({ (data) in
            let button = AlertButton(data: data).listenButtonAction { [weak self] in
                self?.viewModel.dismissCoordinator()
            }
            buttonStack.addArrangedSubview(button)
        })

        guard buttonStack.arrangedSubviews.count > 0 else { return }
        mainStackView.addArrangedSubview(buttonStack)
        
    }
    
}
