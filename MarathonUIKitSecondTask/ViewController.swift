//
//  ViewController.swift
//  MarathonUIKitSecondTask
//
//  Created by Anastasiia Perminova on 04.07.2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var firstButton: UIButton = {
        var button = UIButton()
        button.setTitle("First Button", for: .normal)
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .systemGray
        config.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 14.0, bottom: 10.0, trailing: 14.0)
        config.image = UIImage(systemName: "star")
        config.imagePlacement = .trailing
        config.imageColorTransformer = .grayscale
        config.imagePadding = 8
        button.configuration = config
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        let touchDown = UILongPressGestureRecognizer(target:self, action: #selector(callAnimation))
            touchDown.minimumPressDuration = 0
        button.gestureRecognizers = [touchDown]
        return button
    }()

    private lazy var secondButton: UIButton = {
        var button = UIButton()
        button.setTitle("Second Medium Button", for: .normal)
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .systemGray
        config.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 14.0, bottom: 10.0, trailing: 14.0)
        config.image = UIImage(systemName: "star")
        config.imagePlacement = .trailing
        config.imageColorTransformer = .grayscale
        config.imagePadding = 8
        button.configuration = config
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        let touchDown = UILongPressGestureRecognizer(target:self, action: #selector(callAnimation))
            touchDown.minimumPressDuration = 0
        button.gestureRecognizers = [touchDown]
        return button
    }()

    private lazy var thirdButton: UIButton = {
        var button = UIButton()
        button.setTitle("Third", for: .normal)
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .systemGray
        config.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 14.0, bottom: 10.0, trailing: 14.0)
        config.image = UIImage(systemName: "star")
        config.imagePlacement = .trailing
        config.imageColorTransformer = .grayscale
        config.imagePadding = 8
        button.configuration = config
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 5),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 5)
            ]
        )
    }

    @objc func buttonPressed(_ button: UIButton) {
        animationIncrease(button)
        animationDecrease(button)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        present(viewController, animated: true)

    }

    @objc func animationIncrease(_ button: UIButton) {
         UIView.animate(
            withDuration: 1,
            delay: 0,
            options: [.allowUserInteraction, .beginFromCurrentState],
            animations: {
                button.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }
        )
    }

    @objc func animationDecrease(_ button: UIButton) {
        let t = button.transform
         UIView.animate(
            withDuration: 1,
            delay: 0,
            options: [.allowUserInteraction, .beginFromCurrentState],
            animations: {

                button.transform = CGAffineTransform.identity
            }
        )
    }



    @objc func callAnimation(_ recognizer: UIGestureRecognizer){
        if let view = recognizer.view as? UIButton {
            switch recognizer.state {
            case .began:
                animationIncrease(view)
            case .ended:
                animationDecrease(view)
            default:
                break
            }
        }

    }
}
