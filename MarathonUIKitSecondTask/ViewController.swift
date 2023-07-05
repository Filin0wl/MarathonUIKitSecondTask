//
//  ViewController.swift
//  MarathonUIKitSecondTask
//
//  Created by Anastasiia Perminova on 04.07.2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var firstButton: UIButton = {
        var button = UIButton.makeMyButton(title: "First Button")
        let touchDown = UILongPressGestureRecognizer(target:self, action: #selector(callAnimation))
            touchDown.minimumPressDuration = 0
        button.gestureRecognizers = [touchDown]
        return button
    }()

    private lazy var secondButton: UIButton = {
        var button = UIButton.makeMyButton(title: "Second Medium Button")
        let touchDown = UILongPressGestureRecognizer(target:self, action: #selector(callAnimation))
            touchDown.minimumPressDuration = 0
        button.gestureRecognizers = [touchDown]
        return button
    }()

    private lazy var thirdButton: UIButton = {
        var button = UIButton.makeMyButton(title: "Third")
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
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

private extension UIButton {
    static func makeMyButton(title: String) -> UIButton {
        var config = UIButton.Configuration.filled()
        config.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 14.0, bottom: 10.0, trailing: 14.0)
        config.image = UIImage(systemName: "star")
        config.imagePlacement = .trailing
        config.image?.withTintColor(.white)
        config.imagePadding = 8

        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.configuration = config
        button.tintColor = UIColor(red: 0.13, green: 0.55, blue: 0.13, alpha: 1.00)
        button.backgroundColor = UIColor(red: 0.48, green: 0.41, blue: 0.93, alpha: 1.00)
        button.layer.cornerRadius = 6
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
