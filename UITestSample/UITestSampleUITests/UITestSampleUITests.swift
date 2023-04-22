//
//  UITestSampleUITests.swift
//  UITestSampleUITests
//
//  Created by Wu Guanguan on 4/21/23.
//

import XCTest

final class UITestSampleUITests: XCTestCase {

    // the function name has to have 'test' in front, so the system know this is a test function

    func testLoginHappyPath() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // test the email field
        let emailTextField = app.textFields["Email"]
        XCTAssert(emailTextField.exists)
        app.textFields["Email"].tap()
        emailTextField.typeText("wgg@icloud.com")

        // test the password field
        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssert(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("password")
        
        // test the button field
        let loginBtn = app.staticTexts["Login"]
        XCTAssert(loginBtn.exists)
        app.staticTexts["Login"].tap()
        
        // Now it will test the next screen
        //next scrren we have a label
        let loggInLabel = app.staticTexts["Logged in"]
        XCTAssert(loggInLabel.exists)
    }
    
    func testLoginFailed() throws{
        let app = XCUIApplication()
        app.launch()
        
        // test the email field
        let emailTextField = app.textFields["Email"]
        XCTAssert(emailTextField.exists)
        app.textFields["Email"].tap()
        emailTextField.typeText("wgg@icloud.com")

        // test the password field
        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssert(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("wrongpassword")
        
        // test the button field
        let loginBtn = app.staticTexts["Login"]
        XCTAssert(loginBtn.exists)
        app.staticTexts["Login"].tap()
        
        // Now it will test the next screen
        //next scrren we have a label
        let statusLabel = app.staticTexts["Please enter valid email/password."]
        XCTAssert(statusLabel.exists)
    }

}
