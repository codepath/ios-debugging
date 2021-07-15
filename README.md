## Debugging Game for iOS Lab

In this lab, we'll be playing a game where each level requires using certain debugging skills to find and fix a bug. Once the bug is fixed, you'll be able to advance to the next level.

**Note:** The game saves your progress as you complete each level (using `UserDefaults`). If you want to go back to the beginning of the game, simply uninstall the app and you'll start from Level One.

![Imgur](http://i.imgur.com/oQbQLf9.png)

### Getting Started

The checkpoints below should be implemented as pairs. In pair programming, there
are two roles: supervisor and driver.

The supervisor makes the decision on what step to do next. Their job is to
describe the step using high level language ("Let's print out something when the
user is scrolling"). They also have a browser open in case they need to do any
research. The driver is typing and their role is to translate the high level
task into code ("Set the scroll view delegate, implement the didScroll method").

After you finish each checkpoint, switch the supervisor and driver roles. The
person on the right will be the first supervisor.


### Level 0: Setup

1. Download the [game](https://github.com/codepath/ios_debugging_lab/archive/master.zip).
2. Open `Debugging.xcworkspace` and run the app on an iPhone 6s Simulator (this is important as one of the levels requires an iPhone 6s).
3. Once running, you should see a screen that launches the game.

### Level 1: The dreaded key-value coding compliant error

This is one of the most common exceptions you'll run into when first learning iOS.

1. Find `LevelOneViewController.swift` and `LevelOneViewController.xib`.
   * Xib's are an alternative to using a storyboard. They allow you to specify individual screens instead of laying out the entire app in the storyboard.
2. [Fix the crash](http://guides.codepath.org/ios/Common-Issues#2-error-this-class-is-not-key-value-coding-compliant-for-the-key) to move on to the next level.

### Level 2: Terminating app due to uncaught exception?!?

It's really tricky to debug an issue when the exception bubbles up all the way to the `AppDelegate` and you have no idea where the original problem is. In this level, we'll use the `Exception Breakpoint` to capture the issue as soon as it happens.

1. Find `LevelTwoViewController.swift` and `LevelTwoViewController.xib`.
2. Set up an [exception breakpoint](http://guides.codepath.org/ios/Debugging-Apps#setting-breakpoints-for-exceptions).
3. Find and fix the crash to advance to the next level.

### Level 3: The Button doesn't work

1. Find `LevelThreeViewController.swift` and `LevelThreeViewController.xib`.
2. There are a variety of reasons that a button might not work as you expect it to. The hint for this level is that it has something to do with the view hierarchy.
3. There's a really handy [Debug View Hierarchy](http://guides.codepath.org/ios/Debugging-Apps#using-the-native-debug-view-hierarchy) tool in Xcode that will help you troubleshoot.
4. Once you can figure out why the button isn't registering taps, fix it to advance to the next level.

### Level 4: Dude, where's my tableView?

1. Find `LevelFourViewController.swift` and `LevelFourViewController.xib`.
2. There's supposed to be a tableView that shows a list of movie titles.
3. There are no hints on this level. You'll need to use a combination of [setting breakpoints](http://guides.codepath.org/ios/Debugging-Apps#using-breakpoints), [stepping through code](http://guides.codepath.org/ios/Debugging-Apps#stepping-through-code), and [using the debug area](http://guides.codepath.org/ios/Debugging-Apps#the-debug-area-console-and-variable-view) to print and examine variables.
4. Once you are able to get the tableView cells to show up, tap on any of the cells to advance to the next level.

### Level 5: Why are the descriptions wrong?

1. Find `LevelFiveViewController.swift` and `LevelFiveViewController.xib`.
2. If you scroll down and look closely at the movie descriptions, you'll notice that a lot of them are wrong.
3. Your objective on this level is to fix the bug so that each movie has the correct description or no description (if one wasn't provided).
4. Once you fix the bug, tap on any cell in the table to advance to the next level.

### Level 6: AutoLayout

1. Find `LevelSixViewController.swift` and `LevelSixViewController.xib`.
2. This is a tricky level as it has to do with AutoLayout not being happy.
3. If you take a look at the output window, you'll see a warning `Unable to simultaneously satisfy constraints`. The objective for this level is to fix the AutoLayout constraints so that this warning goes away.
4. To fix this warning, you'll need to read up on [Visual Format Language](https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/AutolayoutPG/VisualFormatLanguage.html) (VFL). VFL is a way to specify AutoLayout constraints using text.
5. Xcode uses VFL to tell you about the constraints that are conflicting so you'll need to understand this output and then fix the constraints in `LevelSixViewController.xib`.
6. Once the warning no longer appears, tap on `Finish Level` to complete the game!
