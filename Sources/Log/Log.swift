public enum LogLevel {
    case verbose
    case debug
    case info
    case warning
    case error
}

public protocol Log {

    func log(_ level: LogLevel, _ message: @autoclosure () -> Any, _ file: String, _ function: String, line: Int, context: Any?)
}

public extension Log {

    /// log something generally unimportant (lowest priority)
    func verbose(_ message: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil)  {
        log(.verbose, message, file, function, line: line, context: context)
    }

    /// log something which help during debugging (low priority)
    func debug(_ message: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
        log(.debug, message, file, function, line: line, context: context)
    }

    /// log something which you are really interested but which is not an issue or error (normal priority)
    func info(_ message: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
        log(.info, message, file, function, line: line, context: context)

    }

    /// log something which may cause big trouble soon (high priority)
    func warning(_ message: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
        log(.warning, message, file, function, line: line, context: context)
    }

    /// log something which will keep you awake at night (highest priority)
    func error(_ message: @autoclosure () -> Any, _ file: String = #file, _ function: String = #function, line: Int = #line, context: Any? = nil) {
        log(.error, message, file, function, line: line, context: context)
    }
}
