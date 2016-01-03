public class Trigger {
    // MARK: - Public properties
    // The condition that must be met for the action to fire
    public let condition: (trigger: Trigger) -> Bool
    
    // MARK: - Private properties
    // The action to fire when the condition is met
    private let action: (trigger: Trigger) -> Void
    
    // To temporarily, or permanently, disable the trigger, call invalidate()
    private var _valid = true
    
    // MARK: - Init
    public init(condition: (trigger: Trigger) -> Bool, action: (trigger: Trigger) -> Void) {
        self .condition = condition
        self.action = action
    }
    
    // MARK: - Public methods
    public func pull() {
        if _valid && condition(trigger: self) {
            action(trigger: self)
        }
    }
    
    public func invalidate() {
        _valid = false
    }
    
    public func validate() {
        _valid = true
    }
}