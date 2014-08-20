class Magic8Ball
    
    attr_accessor :answers
    
    def initialize
        @answers = loadAnswers
    end
    
    def loadAnswers
        answerFile = NSBundle.mainBundle.pathForResource("answers", ofType:"json")
        contentsOfAnswerFile = BW::JSON.parse(NSData.dataWithContentsOfFile(answerFile))
        puts contentsOfAnswerFile
        errorPointer = Pointer.new(:object)
        
        data = NSData.alloc.initWithContentsOfFile(answerFile, options:NSDataReadingUncached, error:errorPointer)
        
        unless data
            printError errorPointer[0]
            return defaultAnswers
        end
        
        json = NSJSONSerialization.JSONObjectWithData(data, options:NSDataReadingUncached, error:errorPointer)
        
        unless json
            printError errorPointer[0]
            return defaultAnswers
        end
        
        json["answers"]
    end
    
    def defaultAnswers
        ["Yes", "No", "Maybe", "Try again"]
    end
    
    def printError (error)
        $stderr.puts "Error: #{error.description}"
    end
    
    def randomAnswer
        @answers.sample
    end
end