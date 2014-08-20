class Magic8BallViewController < UIViewController
    
    attr_accessor :label
    
    def loadView
        self.view = UIImageView.alloc.init
    end
    
    def viewDidLoad
        view.image = UIImage.imageNamed("background.png")
        @label = makeLabel
        view.addSubview(@label)
        
        view.userInteractionEnabled = true
        recognizer = UITapGestureRecognizer.alloc.initWithTarget(self, action:"showAnswer")
        view.addGestureRecognizer(recognizer)
        
        @magicBall = Magic8Ball.new
    end
    
    def showAnswer
        @label.text = ["Yes", "No", "Maybe", "Try again"].sample
    end
    
    def makeLabel
        label = UILabel.alloc.initWithFrame( [ [10, 60], [300, 80] ] )
        label.backgroundColor = UIColor.lightGrayColor
        label.text = "Tap for answer!"
        label.font = UIFont.boldSystemFontOfSize(34)
        label.textColor = UIColor.darkGrayColor
        label.textAlignment = UITextAlignmentCenter
        label
    end
end