---
title: Localisation in iOS
tags: iOS localisation
---

### Why you need localisation?

Many people do *NOT* speak English.

> English is **Second** most used language after Mandarin.
> [Wikipedia](https://en.wikipedia.org/wiki/List_of_languages_by_total_number_of_speakers)

So by developing you app for only English (the usual development language), you are not reaching even the largest set of people in this world.

Localising an app makes it available to a larger number of people. It can be easily made available across borders. New markets, more $$$.

### Process:

iOS has very good documentation for everything, [including localisation.](https://developer.apple.com/internationalization/)

Overview:

1. Use [NSLocalizedString](https://developer.apple.com/reference/foundation/nslocalizedstring) to add all your UI strings to localisation system.
2. Run [genstrings][genstrings] on your files to create `.strings` file for your strings that need to be translated.
3. Send this `.strings` file to your translator, and they will give you back the translated `.strings` file.
4. Add the received files to your project.
5. Count 💰💰💰

#### But I got xibs/storyboards!

1. Select your xib/storyboard
2. Open the `Utilities` pane for the said file.
3. In the `File Inspector`, go to `Localization` and add the languages you want to support.

> The only issue we faced was the location of these files.
> When you localise them, their `.strings` is generated in same location as the xib/storyboard. Keeping track becomes tricky.


##### Note:

> Don’t use [NSAttributedString](https://developer.apple.com/reference/foundation/nsattributedstring) inside a xib or storyboard.

These strings can not be localised using genstrings (since they are inside a xib/storyboard). Also, to localise an attributed string you need to make sure that the attributes are applied to correct parts of the translated text too. Hence it is always better to create such strings in code, where you get more control. You can then apply attributes to text, making the text language.

If you have a larger text, split it up and localise the parts individually. This way, you can apply attributes to specific ranges.

#### Advanced:

1. Add build step to run [genstrings][genstrings] on all your implementation (`.m`) files. This will generate the `Localizable.strings` file for you each time.
    * Pro: Whenever there is a change in your strings, your version control will mark the file dirty.

    ```bash
    find **SOURCE_FOLDERS** -name \*.m | xargs genstrings -o Resources/en.lproj/
    ```

2. Create a zip of all your `.strings` to be given to your translator auto-magically

    ```bash
zip -rj Resources/iOS-strings Resources/en.lproj/*
    ```

3. Though most of the `UIKit` views (UILabel, UITextView etc.) work good with localised content, but an edge case is when you are setting the `frame` yourself. You need to calculate the frame according to the content each time instead of using constants. *#Gotcha*
    * **Wrong**:

      ```
      CGRect frame = CGRectMake(0, 0, 100, 100);
      ```
    * **Correct**:

      ```
      CGRect rect = [self boundingRectWithSize:maxSize
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{ NSFontAttributeName: font}
                                         context:nil];
      ```

4. Use pseudolocalisations in development phase to figure out layout issues early. Pseudolocalisations are available for interface builders. They show you a preview of the screen with localised strings of the chosen laguange.
  Reference 1: [Internationalizing the User Interface - Detecting Problems Using Pseudolocalizations](https://developer.apple.com/library/content/documentation/MacOSX/Conceptual/BPInternational/InternationalizingYourUserInterface/InternationalizingYourUserInterface.html#//apple_ref/doc/uid/10000171i-CH3-SW1)
  Reference 2: [Testing Your Internationalized App](https://developer.apple.com/library/content/documentation/MacOSX/Conceptual/BPInternational/TestingYourInternationalApp/TestingYourInternationalApp.html)

[genstrings]: https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/genstrings.1.html
