// https://github.com/Quick/Quick

import Quick
import Nimble
import Trigger

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        var trigger: Trigger!
        var value = 0
        
        describe("Trigger condition always returns true") {
            beforeEach {
                trigger = Trigger(condition: { trigger in
                        return true
                    }, action: { trigger in
                        value = 1
                })
            }
            
            afterEach {
                value = 0
            }
            
            it("should set value to 1") {
                trigger.pull()
                expect(value) == 1
            }
            
            context("invalidated") {
                beforeEach {
                    trigger.invalidate()
                }
                
                afterEach {
                    trigger.validate()
                }
                
                it("should keep value at 0") {
                    trigger.pull()
                    expect(value) == 0
                }
                
                context("validate again") {
                    beforeEach {
                        trigger.validate()
                    }
                    
                    it ("should set value to 1") {
                        trigger.pull()
                        expect(value) == 1
                    }
                }
            }
        }
    }
}
