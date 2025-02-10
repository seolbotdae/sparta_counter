//
//  ViewController.swift
//  sparta_counter
//
//  Created by Seol WooHyeok on 2/10/25.
//

import UIKit

class ViewController: UIViewController {
    var counter = Counter()
    
    let countLabel: UILabel = UILabel()
    let incrementButton: UIButton = UIButton()
    let decrementButton: UIButton = UIButton()
    let resetButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemBackground
        updateView()
        
        // MARK: countLabel setting
        view.addSubview(countLabel)
        countLabel.text = "\(counter.getCount())"
        
        // MARK: incrementButton setting
        view.addSubview(incrementButton)
        incrementButton.configuration = UIButton.Configuration.tinted()
        incrementButton.configuration?.title = "+"
        
        incrementButton.addTarget(self, action: #selector(increment), for: .touchUpInside)
        
        // MARK: decrementButton setting
        view.addSubview(decrementButton)
        decrementButton.configuration = UIButton.Configuration.tinted()
        decrementButton.configuration?.title = "-"
        
        decrementButton.addTarget(self, action: #selector(decrement), for: .touchUpInside)
        
        // MARK: resetButton setting
        view.addSubview(resetButton)
        resetButton.configuration = UIButton.Configuration.tinted()
        resetButton.configuration?.title = "reset"
        
        resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        
        // MARK: stackView setting
        let stackView = UIStackView(arrangedSubviews: [incrementButton, decrementButton, resetButton])
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        // MARK: autolayout setting
        incrementButton.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        decrementButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stackView.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: view.bounds.height * 0.2),
            stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
//
//            incrementButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: view.bounds.height * 0.2),
//            decrementButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: view.bounds.height * 0.2),
//            resetButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: view.bounds.height * 0.2),
//            
//            incrementButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
//            incrementButton.rightAnchor.constraint(equalTo: decrementButton.leftAnchor, constant: -10),
//            decrementButton.rightAnchor.constraint(equalTo: resetButton.leftAnchor, constant: -10),
//            resetButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
//            
//            incrementButton.widthAnchor.constraint(equalTo: decrementButton.widthAnchor),
//            decrementButton.widthAnchor.constraint(equalTo: resetButton.widthAnchor),
        ])
    }
    
    
    // MARK: logic function
    
    @objc private func increment() {
        counter.increment()
        updateView()
    }
    
    @objc private func decrement() {
        counter.decrement()
        updateView()
    }
    
    @objc private func reset() {
        counter.reset()
        updateView()
    }
    
    private func updateView() {
        let count = counter.getCount()
        
        countLabel.text = "\(count)"
        
        if count >= 10 {
            incrementButton.isEnabled = false
        } else {
            incrementButton.isEnabled = true
        }
        
        if count <= 0 {
            decrementButton.isEnabled = false
        } else {
            decrementButton.isEnabled = true
        }
    }
}

