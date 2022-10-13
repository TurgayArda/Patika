//
//  CalculatorVC.swift
//  Calculator
//
//  Created by Arda Sisli on 30.09.2022.
//

import UIKit
import SnapKit

class CalculatorVC: UIViewController {
    
    //MARK: - Views
      
      private lazy var label1: UILabel = {
          let label = UILabel()
          label.textAlignment = .right
          label.font = UIFont.boldSystemFont(ofSize: 34)
          return label
      }()
      
      private lazy var label2: UILabel = {
          let label = UILabel()
          label.textAlignment = .right
          label.font = UIFont.boldSystemFont(ofSize: 34)
          return label
      }()
      
      private lazy var label3: UILabel = {
          let label = UILabel()
          label.textAlignment = .right
          label.font = UIFont.boldSystemFont(ofSize: 34)
          return label
      }()
      
      private lazy var zeroButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle(CalculatorConstant.ButtonTitle.zero.rawValue, for: .normal)
          button.setTitleColor(.systemBlue, for: .normal)
          button.backgroundColor = .white
          button.layer.borderWidth = 0.3
          button.layer.borderColor = UIColor.black.cgColor
          button.layer.cornerRadius = 8
          return button
      }()
      
      private lazy var equalButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle(CalculatorConstant.ButtonTitle.equal.rawValue, for: .normal)
          button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
          button.setTitleColor(.orange, for: .normal)
          button.layer.borderWidth = 0.3
          button.layer.borderColor = UIColor.black.cgColor
          button.backgroundColor = .white
          button.layer.cornerRadius = 8
          return button
      }()
      
      private lazy var oneButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle(CalculatorConstant.ButtonTitle.one.rawValue, for: .normal)
          button.setTitleColor(.systemBlue, for: .normal)
          button.layer.borderWidth = 0.3
          button.layer.borderColor = UIColor.black.cgColor
          button.backgroundColor = .white
          button.layer.cornerRadius = 8
          return button
      }()
      
      private lazy var twoButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle(CalculatorConstant.ButtonTitle.two.rawValue, for: .normal)
          button.setTitleColor(.systemBlue, for: .normal)
          button.layer.borderWidth = 0.3
          button.layer.borderColor = UIColor.black.cgColor
          button.backgroundColor = .white
          button.layer.cornerRadius = 8
          return button
      }()
      
      private lazy var threeButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle(CalculatorConstant.ButtonTitle.three.rawValue, for: .normal)
          button.setTitleColor(.systemBlue, for: .normal)
          button.layer.borderWidth = 0.3
          button.layer.borderColor = UIColor.black.cgColor
          button.backgroundColor = .white
          button.layer.cornerRadius = 8
          return button
      }()
      
      private lazy var fourButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle(CalculatorConstant.ButtonTitle.four.rawValue, for: .normal)
          button.setTitleColor(.systemBlue, for: .normal)
          button.layer.borderWidth = 0.3
          button.layer.borderColor = UIColor.black.cgColor
          button.backgroundColor = .white
          button.layer.cornerRadius = 8
          return button
      }()
      
      private lazy var fiveButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle(CalculatorConstant.ButtonTitle.five.rawValue, for: .normal)
          button.setTitleColor(.systemBlue, for: .normal)
          button.layer.borderWidth = 0.3
          button.layer.borderColor = UIColor.black.cgColor
          button.backgroundColor = .white
          button.layer.cornerRadius = 8
          return button
      }()
      
      private lazy var sixButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle(CalculatorConstant.ButtonTitle.six.rawValue, for: .normal)
          button.setTitleColor(.systemBlue, for: .normal)
          button.layer.borderWidth = 0.3
          button.layer.borderColor = UIColor.black.cgColor
          button.backgroundColor = .white
          button.layer.cornerRadius = 8
          return button
      }()
      
      private lazy var sevenButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle(CalculatorConstant.ButtonTitle.seven.rawValue, for: .normal)
          button.setTitleColor(.systemBlue, for: .normal)
          button.layer.borderWidth = 0.3
          button.layer.borderColor = UIColor.black.cgColor
          button.backgroundColor = .white
          button.layer.cornerRadius = 8
          return button
      }()
      
      private lazy var eightButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle(CalculatorConstant.ButtonTitle.eight.rawValue, for: .normal)
          button.setTitleColor(.systemBlue, for: .normal)
          button.layer.borderWidth = 0.3
          button.layer.borderColor = UIColor.black.cgColor
          button.backgroundColor = .white
          button.layer.cornerRadius = 8
          return button
      }()
      
      private lazy var nineButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle(CalculatorConstant.ButtonTitle.nine.rawValue, for: .normal)
          button.setTitleColor(.systemBlue, for: .normal)
          button.layer.borderWidth = 0.3
          button.layer.borderColor = UIColor.black.cgColor
          button.backgroundColor = .white
          button.layer.cornerRadius = 8
          return button
      }()
      
      private lazy var clearButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle(CalculatorConstant.ButtonTitle.clear.rawValue, for: .normal)
          button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
          button.setTitleColor(.red, for: .normal)
          button.layer.borderWidth = 0.3
          button.layer.borderColor = UIColor.black.cgColor
          button.backgroundColor = .white
          button.layer.cornerRadius = 8
          return button
      }()
      
      
      private lazy var percentButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle(CalculatorConstant.ButtonTitle.percent.rawValue, for: .normal)
          button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
          button.setTitleColor(.orange, for: .normal)
          button.layer.borderWidth = 0.3
          button.layer.borderColor = UIColor.black.cgColor
          button.backgroundColor = .white
          button.layer.cornerRadius = 8
          return button
      }()
      
      
      private lazy var dividedByButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle(CalculatorConstant.ButtonTitle.dividedBy.rawValue, for: .normal)
          button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
          button.setTitleColor(.orange, for: .normal)
          button.layer.borderWidth = 0.3
          button.layer.borderColor = UIColor.black.cgColor
          button.backgroundColor = .white
          button.layer.cornerRadius = 8
          return button
      }()
      
      
      private lazy var multiplyButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle(CalculatorConstant.ButtonTitle.multiply.rawValue, for: .normal)
          button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
          button.setTitleColor(.orange, for: .normal)
          button.layer.borderWidth = 0.3
          button.layer.borderColor = UIColor.black.cgColor
          button.backgroundColor = .white
          button.layer.cornerRadius = 8
          return button
      }()
      
      
      private lazy var minusButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle(CalculatorConstant.ButtonTitle.minus.rawValue, for: .normal)
          button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
          button.setTitleColor(.orange, for: .normal)
          button.layer.borderWidth = 0.3
          button.layer.borderColor = UIColor.black.cgColor
          button.backgroundColor = .white
          button.layer.cornerRadius = 8
          return button
      }()
      
      
      private lazy var plusButton: UIButton = {
          let button = UIButton()
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle(CalculatorConstant.ButtonTitle.plus.rawValue, for: .normal)
          button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
          button.setTitleColor(.orange, for: .normal)
          button.layer.borderWidth = 0.3
          button.layer.borderColor = UIColor.black.cgColor
          button.backgroundColor = .white
          button.layer.cornerRadius = 8
          return button
      }()
      
    private lazy var squareRootButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(CalculatorConstant.ButtonTitle.squareRoot.rawValue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.orange, for: .normal)
        button.layer.borderWidth = 0.3
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        return button
    }()
    
    private lazy var squareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(CalculatorConstant.ButtonTitle.square.rawValue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.orange, for: .normal)
        button.layer.borderWidth = 0.3
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        return button
    }()
    
    private lazy var squareNButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(CalculatorConstant.ButtonTitle.squareN.rawValue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.orange, for: .normal)
        button.layer.borderWidth = 0.3
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        return button
    }()
    
    private lazy var squareSixNButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(CalculatorConstant.ButtonTitle.squareSixN.rawValue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.orange, for: .normal)
        button.layer.borderWidth = 0.3
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        return button
    }()
    
      //MARK: Properties
      
      var labelNumber = ""
      var textNumber = ""
    var numberResult = 0.0
      var calculatorOperator = ""
      
      
      //MARK: - Life Cycle
      
      override func viewDidLoad() {
          super.viewDidLoad()
          
          configure()
          label1.text = "0"
          buttonActions()
      }
      
      //MARK: - private Func
      
      private func configure() {
          propetyUI()
      }
      
      private func propetyUI() {
          view.backgroundColor = .white
          
          view.addSubview(zeroButton)
          view.addSubview(equalButton)
          view.addSubview(oneButton)
          view.addSubview(twoButton)
          view.addSubview(threeButton)
          view.addSubview(plusButton)
          view.addSubview(fourButton)
          view.addSubview(fiveButton)
          view.addSubview(sixButton)
          view.addSubview(minusButton)
          view.addSubview(sevenButton)
          view.addSubview(eightButton)
          view.addSubview(nineButton)
          view.addSubview(multiplyButton)
          view.addSubview(clearButton)
          view.addSubview(squareButton)
          view.addSubview(squareRootButton)
          view.addSubview(squareNButton)
          view.addSubview(squareSixNButton)
          view.addSubview(percentButton)
          view.addSubview(dividedByButton)
          view.addSubview(label1)
          view.addSubview(label2)
          view.addSubview(label3)
        
          propetyUIConstraints()
      }
      
      private func propetyUIConstraints() {
          makeLabel3()
          makeLabel2()
          makeLabel1()
          
          makeZeroButons()
          makeEqualButton()
          makeOneButton()
          makeTwoButton()
          makeThreeButton()
          makePlusButton()
          makeFourButton()
          makeFiveButton()
          makeSixButton()
          makeMinusButton()
          makeSevenButton()
          makeEightButton()
          makeNineButton()
          makeMultiplyButton()
          makeClearButton()
          makeSquareRootButton()
          makeSquareButton()
          makeSquareNButton()
          makeSquareSixNButton()
          makePercentButton()
          makeDividedByButton()
      }
      
      private func buttonActions() {
          button0()
          button1()
          button2()
          button3()
          button4()
          button5()
          button6()
          button7()
          button8()
          button9()
          
          buttonPlus()
          buttonMinus()
          buttonMultiply()
          buttonDividedBy()
          buttonPercent()
          buttonSquare()
          buttonSquareRoot()
          buttonSquareN()
          buttonSquareSixN()
          
          buttonClear()
          buttonEqual()
      }
      
      private func buttonLabelText(labelNumber: String) {
          if label2.text == nil ||  label2.text == "" {
              textNumber += labelNumber
              label1.text = textNumber
          }else{
              if label1.text == "" || label1.text == nil {
                  textNumber = labelNumber
                  label1.text = textNumber
              }else{
                  textNumber += labelNumber
                  label1.text = textNumber
              }
          }
      }
      
      private func clear() {
          label1.text = "0"
          label2.text?.removeAll()
          label3.text?.removeAll()
          textNumber.removeAll()
      }
      
      private func textInversion() {
          label3.text = label1.text
          label1.text?.removeAll()
      }
  }

  //MARK: - Number Number Buttons

  extension CalculatorVC {
      private func button1() {
          oneButton.addTarget(self, action: #selector(button1(_:)), for: .touchUpInside)
      }
      
      @objc func button1(_ button1: UIButton) {
          self.labelNumber = "1"
          buttonLabelText(labelNumber: labelNumber)
      }
      
      private func button2() {
          twoButton.addTarget(self, action: #selector(button2(_:)), for: .touchUpInside)
      }
      
      @objc func button2(_ button2: UIButton) {
          self.labelNumber = "2"
          buttonLabelText(labelNumber: labelNumber)
      }
      
      private func button3() {
          threeButton.addTarget(self, action: #selector(button3(_:)), for: .touchUpInside)
      }
      
      @objc func button3(_ button3: UIButton) {
          self.labelNumber = "3"
          buttonLabelText(labelNumber: labelNumber)
      }
      
      private func button4() {
          fourButton.addTarget(self, action: #selector(button4(_:)), for: .touchUpInside)
      }
      
      @objc func button4(_ button4: UIButton) {
          self.labelNumber = "4"
          buttonLabelText(labelNumber: labelNumber)
      }
      
      private func button5() {
          fiveButton.addTarget(self, action: #selector(button5(_:)), for: .touchUpInside)
      }
      
      @objc func button5(_ button5: UIButton) {
          self.labelNumber = "5"
          buttonLabelText(labelNumber: labelNumber)
      }
      
      private func button6() {
          sixButton.addTarget(self, action: #selector(button6(_:)), for: .touchUpInside)
      }
      
      @objc func button6(_ button6: UIButton) {
          self.labelNumber = "6"
          buttonLabelText(labelNumber: labelNumber)
      }
      
      private func button7() {
          sevenButton.addTarget(self, action: #selector(button7(_:)), for: .touchUpInside)
      }
      
      @objc func button7(_ button7: UIButton) {
          self.labelNumber = "7"
          buttonLabelText(labelNumber: labelNumber)
      }
      
      private func button8() {
          eightButton.addTarget(self, action: #selector(button8(_:)), for: .touchUpInside)
      }
      
      @objc func button8(_ button8: UIButton) {
          self.labelNumber = "8"
          buttonLabelText(labelNumber: labelNumber)
      }
      
      private func button9() {
          nineButton.addTarget(self, action: #selector(button9(_:)), for: .touchUpInside)
      }
      
      @objc func button9(_ button9: UIButton) {
          self.labelNumber = "9"
          buttonLabelText(labelNumber: labelNumber)
      }
      
      private func button0() {
          zeroButton.addTarget(self, action: #selector(button0(_:)), for: .touchUpInside)
      }
      
      @objc func button0(_ button0: UIButton) {
          self.labelNumber = "0"
          buttonLabelText(labelNumber: labelNumber)
      }
  }

  //MARK: - Transactions

  extension CalculatorVC {
      private func buttonPlus() {
          plusButton.addTarget(self, action: #selector(buttonPlus(_:)), for: .touchUpInside)
      }
      
      @objc func buttonPlus(_ buttonPlus: UIButton) {
          self.calculatorOperator = "+"
          if label1.text == "" || label1.text == nil {
              
          }else{
              label2.text = calculatorOperator
              textInversion()
          }
      }
      
      private func buttonMinus() {
          minusButton.addTarget(self, action: #selector(buttonMinus(_:)), for: .touchUpInside)
      }
      
      @objc func buttonMinus(_ buttonMinus: UIButton) {
          self.calculatorOperator = "-"
          if label1.text == "" {
              
          }else{
              label2.text = calculatorOperator
              textInversion()
          }
      }
      
      private func buttonMultiply() {
          multiplyButton.addTarget(self, action: #selector(buttonMultiply(_:)), for: .touchUpInside)
      }
      
      @objc func buttonMultiply(_ buttonMultiply: UIButton) {
          self.calculatorOperator = "*"
          if label1.text == "" {
              
          }else{
              label2.text = calculatorOperator
              textInversion()
          }
      }
      
      private func buttonDividedBy() {
          dividedByButton.addTarget(self, action: #selector(buttonDividedBy(_:)), for: .touchUpInside)
      }
      
      @objc func buttonDividedBy(_ buttonDividedBy: UIButton) {
          self.calculatorOperator = "/"
          if label1.text == "" {
              
          }else{
              label2.text = calculatorOperator
              textInversion()
          }
      }
      
      private func buttonPercent() {
          percentButton.addTarget(self, action: #selector(buttonPercent(_:)), for: .touchUpInside)
      }
      
      @objc func buttonPercent(_ buttonPercent: UIButton) {
          self.calculatorOperator = "%"
          if label1.text == "" {
              
          }else{
              label2.text = calculatorOperator
              textInversion()
          }
      }
      
      private func buttonSquare() {
          squareButton.addTarget(self, action: #selector(buttonSquare(_:)), for: .touchUpInside)
      }
      
      @objc func buttonSquare(_ buttonSquare: UIButton) {
         self.calculatorOperator = "x²"
      }
      
      private func buttonSquareRoot() {
          squareRootButton.addTarget(self, action: #selector(buttonSquareRoot(_:)), for: .touchUpInside)
      }
      
      @objc func buttonSquareRoot(_ buttonSquareRoot: UIButton) {
         self.calculatorOperator = "√¯"
      }
      
      private func buttonSquareN() {
          squareNButton.addTarget(self, action: #selector(buttonSquareN(_:)), for: .touchUpInside)
      }
      
      @objc func buttonSquareN(_ buttonSquareN: UIButton) {
         self.calculatorOperator = "xⁿ"
          if label1.text == "" {
              
          }else{
              label2.text = calculatorOperator
              textInversion()
          }
      }
      
      private func buttonSquareSixN() {
          squareSixNButton.addTarget(self, action: #selector(buttonSquareSixN(_:)), for: .touchUpInside)
      }
      
      @objc func buttonSquareSixN(_ buttonSquareSixN: UIButton) {
         self.calculatorOperator = "10ⁿ"
      }
  }

  //MARK: - Clear

  extension CalculatorVC {
      private func buttonClear() {
          clearButton.addTarget(self, action: #selector(buttonClear(_:)), for: .touchUpInside)
      }
      
      @objc func buttonClear(_ buttonClear: UIButton) {
          clear()
      }
  }

  //MARK: - Equal

  extension CalculatorVC {
      private func buttonEqual() {
          equalButton.addTarget(self, action: #selector(buttonEqual(_:)), for: .touchUpInside)
      }
      
      @objc func buttonEqual(_ buttonEqual: UIButton) {
          guard let number2 = Double(label1.text ?? "") else { return }
          var number1 = 0.0
          if calculatorOperator != "x²" && calculatorOperator != "√¯" && calculatorOperator != "10ⁿ" {
              guard let number = Double(label3.text ?? "") else { return }
              number1 = number
          }
        
          clear()
          
          switch calculatorOperator {
          case "+":
              numberResult = number1 + number2
              label1.text = "\(numberResult)"
          case "-":
              numberResult = number1 - number2
              label1.text = "\(numberResult)"
          case "*":
              numberResult = number1 * number2
              label1.text = "\(numberResult)"
          case "/":
              if number2 == 0 {
                  print("Error")
              }else{
                  numberResult = number1 / number2
                  label1.text = "\(numberResult)"
              }
          case "%":
            let numberTwo = Int(number2)
            let numberOne = Int(number1)
              let result = numberOne % numberTwo
              numberResult = Double(result)
              label1.text = "\(numberResult)"
          case "x²":
              numberResult = pow(number2, 2.0)
              label1.text = "\(numberResult)"
          case "√¯":
              numberResult = sqrt(number2)
              label1.text  = "\(numberResult)"
          case "xⁿ":
              numberResult = pow(number1, number2)
              label1.text = "\(numberResult)"
          case "10ⁿ":
              numberResult = pow(10, number2)
              label1.text = "\(numberResult)"
          default:
              label1.text = "Error"
          }
      }
  }

  //MARK: - Constraints

  extension CalculatorVC {
      private func makeLabel3() {
          label3.snp.makeConstraints { make in
              make.left.equalTo(view).offset(8)
              make.right.equalTo(view).offset(-8)
              make.bottom.equalTo(label2.snp.top)
              make.height.equalTo(view.frame.size.height / 14)
          }
      }
      
      private func makeLabel2() {
          label2.snp.makeConstraints { make in
              make.left.equalTo(view).offset(8)
              make.right.equalTo(view).offset(-8)
              make.bottom.equalTo(label1.snp.top)
              make.height.equalTo(view.frame.size.height / 14)
          }
      }
      
      private func makeLabel1() {
          label1.snp.makeConstraints { make in
              make.left.equalTo(view).offset(8)
              make.right.equalTo(view).offset(-8)
              make.bottom.equalTo(clearButton.snp.top)
              make.height.equalTo(view.frame.size.height / 14)
          }
      }
      
      private func makeZeroButons() {
          zeroButton.snp.makeConstraints { make in
              make.left.equalTo(view).offset(8)
              make.bottom.equalTo(view.safeAreaLayoutGuide)
              make.height.equalTo(view.frame.size.height / 10)
              make.width.equalTo((view.frame.size.width / 2) - 8)
          }
      }
      
      private func makeEqualButton() {
          equalButton.snp.makeConstraints { make in
              make.right.equalTo(view).offset(-8)
              make.left.equalTo(zeroButton.snp.right)
              make.bottom.equalTo(view.safeAreaLayoutGuide)
              make.height.equalTo(view.frame.size.height / 10)
              make.width.equalTo((view.frame.size.width / 2) - 8)
          }
      }
      
      private func makeOneButton() {
          oneButton.snp.makeConstraints { make in
              make.left.equalTo(view).offset(8)
              make.bottom.equalTo(zeroButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 4) - 4)
          }
      }
      
      private func makeTwoButton() {
          twoButton.snp.makeConstraints { make in
              make.left.equalTo(oneButton.snp.right)
              make.bottom.equalTo(zeroButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 4) - 4)
          }
      }
      
      private func makeThreeButton() {
          threeButton.snp.makeConstraints { make in
              make.left.equalTo(twoButton.snp.right)
              make.bottom.equalTo(equalButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 4) - 4)
          }
      }
      
      private func makePlusButton() {
          plusButton.snp.makeConstraints { make in
              make.right.equalTo(view.safeAreaLayoutGuide).offset(-8)
              make.bottom.equalTo(equalButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 4) - 4)
          }
      }
      
      private func makeFourButton() {
          fourButton.snp.makeConstraints { make in
              make.left.equalTo(view.safeAreaLayoutGuide).offset(8)
              make.bottom.equalTo(oneButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 4) - 4)
          }
      }
      
      private func makeFiveButton() {
          fiveButton.snp.makeConstraints { make in
              make.left.equalTo(fourButton.snp.right)
              make.bottom.equalTo(twoButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 4) - 4)
          }
      }
      
      private func makeSixButton() {
          sixButton.snp.makeConstraints { make in
              make.left.equalTo(fiveButton.snp.right)
              make.bottom.equalTo(threeButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 4) - 4)
          }
      }
      
      private func makeMinusButton() {
          minusButton.snp.makeConstraints { make in
              make.right.equalTo(view.safeAreaLayoutGuide).offset(-8)
              make.bottom.equalTo(plusButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 4) - 4)
          }
      }
      
      private func makeSevenButton() {
          sevenButton.snp.makeConstraints { make in
              make.left.equalTo(view.safeAreaLayoutGuide).offset(8)
              make.bottom.equalTo(fourButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 4) - 4)
          }
      }
      
      private func makeEightButton() {
          eightButton.snp.makeConstraints { make in
              make.left.equalTo(sevenButton.snp.right)
              make.bottom.equalTo(fiveButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 4) - 4)
          }
      }
      
      private func makeNineButton() {
          nineButton.snp.makeConstraints { make in
              make.left.equalTo(eightButton.snp.right)
              make.bottom.equalTo(sixButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 4) - 4)
          }
      }
      
      private func makeMultiplyButton() {
          multiplyButton.snp.makeConstraints { make in
              make.right.equalTo(view.safeAreaLayoutGuide).offset(-8)
              make.bottom.equalTo(minusButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 4) - 4)
          }
      }
      
      private func makeSquareButton() {
          squareButton.snp.makeConstraints { make in
              make.left.equalTo(view.safeAreaLayoutGuide).offset(8)
              make.bottom.equalTo(sevenButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 4) - 4)
          }
      }
      
      private func makeSquareRootButton() {
          squareRootButton.snp.makeConstraints { make in
              make.left.equalTo(squareButton.snp.right)
              make.bottom.equalTo(sevenButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 4) - 4)
          }
      }
      
      private func makePercentButton() {
          percentButton.snp.makeConstraints { make in
              make.left.equalTo(squareRootButton.snp.right)
              make.bottom.equalTo(nineButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 4) - 4)
          }
      }
      
      private func makeDividedByButton() {
          dividedByButton.snp.makeConstraints { make in
              make.right.equalTo(view.safeAreaLayoutGuide).offset(-8)
              make.bottom.equalTo(multiplyButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 4) - 4)
          }
      }
      
      private func makeClearButton() {
          clearButton.snp.makeConstraints { make in
              make.left.equalTo(view.safeAreaLayoutGuide).offset(8)
              make.bottom.equalTo(squareButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 2) - 8)
          }
      }
      
      private func makeSquareNButton() {
          squareNButton.snp.makeConstraints { make in
              make.left.equalTo(clearButton.snp.right)
              make.bottom.equalTo(percentButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 4) - 4)
          }
      }
      
      private func makeSquareSixNButton() {
          squareSixNButton.snp.makeConstraints { make in
              make.right.equalTo(view.safeAreaLayoutGuide).offset(-8)
              make.bottom.equalTo(dividedByButton.snp.top)
              make.height.equalTo(view.frame.size.height / 8)
              make.width.equalTo((view.frame.size.width / 4) - 4)
          }
      }
}
