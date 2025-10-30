import XCTest
import Quick
import Nimble
@testable import CocoaPodsExample

class CocoaPodsExampleTests: QuickSpec {
    
    override func spec() {
        describe("ViewController") {
            var viewController: ViewController!
            
            beforeEach {
                viewController = ViewController()
                _ = viewController.view
            }
            
            it("should initialize successfully") {
                expect(viewController).toNot(beNil())
            }
            
            it("should have correct background color") {
                expect(viewController.view.backgroundColor).to(equal(.systemBackground))
            }
        }
        
        describe("Basic Tests") {
            it("should pass simple math test") {
                expect(2 + 2).to(equal(4))
            }
            
            it("should handle string concatenation") {
                let result = "Hello" + " " + "World"
                expect(result).to(equal("Hello World"))
            }
        }
    }
}
