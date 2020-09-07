import ArgumentParser


enum Format: ExpressibleByArgument{
	
	case text
	case sqlite3
	case csv
	case json
	
	init?(argument: String) {
		<#code#>
	}
	
}

struct Converter2: ParsableCommand {
    
    static var configuration = CommandConfiguration(
        abstract: "This utility is for performing basic file conversions"
    )
    
    @Flag(name: [.short, .long], help: "Extra wordy")
    var verbose = false
    
    @Flag(name: [.short, .long], help: "A check, run right after the conversion, for accuracy. Adds some time to conversion proccess. 'On' by default ")
    var check = true
	
	@Option(name: .long, help: "Add more accuracy checking runs, that will run after the default first check(if left on)")
	var moreChecks: Int?
    
	@Option(name: [.short, .long],help: "The desired output file tpye")
    var outputType: Format
    
    @Argument(help: "The file to be converted")
    var inputFile: String
    
    @Argument(help: "The file to be outputed")
    var outputFile: String
	
	init() {
		
		
		
	}
    
}

extension Converter2 {
	
	struct SQLite3: ParsableCommand {
		
		static var configuration = CommandConfiguration(commandName: "SQLite3",
														_superCommandName: "Coverter3",
														abstract: "Coverts input file to an SQLite3 file",
														discussion: "The input file can be any of the listed types, and that file will always be converted to SQLite3",
														version: "0.0.1",
														shouldDisplay: true)
		
	}
	
	struct CSV {
		static var configuration = CommandConfiguration(commandName: "CSV",
														_superCommandName: "Coverter3",
														abstract: "Coverts input file to a CSV file",
														discussion: "The input file can be any of the listed types, and that file will always be converted to CSV",
														version: "0.0.1",
														shouldDisplay: true)
	}
	
	struct Text {
		static var configuration = CommandConfiguration(commandName: "Text",
														_superCommandName: "Coverter3",
														abstract: "Coverts input file to a text file",
														discussion: "The input file can be any of the listed types, and that file will always be converted to text",
														version: "0.0.1",
														shouldDisplay: true)
	}
	
	struct JSON {
		static var configuration = CommandConfiguration(commandName: "JSON",
														_superCommandName: "Coverter3",
														abstract: "Coverts input file to a JSON file",
														discussion: "The input file can be any of the listed types, and that file will always be converted to JSON",
														version: "0.0.1",
														shouldDisplay: true)
	}
	
	
}





/*
struct Options: ParsableArguments {
    @Flag(name: [.long, .customShort("S")], help: "Convert to an .sqlite3 file")
    var sqlite3Output = false
    
    @Option(help: "")
    var outputType: String
    
    @Argument(help: "The file to be converted")
    var inputFile: String
    
    @Argument(help: "The file to be outputed")
    var outputFile: String
    
}

struct Random: ParsableCommand {
    @Argument() var highValue: Int
    
    func run() {
        print(Int.random(in: 1...highValue))
    }
}
 */

Converter2.main()
