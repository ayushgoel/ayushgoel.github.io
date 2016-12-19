---
title: Localisation in iOS
tags: iOS localisation
---

### Why you need localisation?

Many people do not speak English.

> English is **Second** most used language after Mandarin.
> [Wikipedia](https://en.wikipedia.org/wiki/List_of_languages_by_total_number_of_speakers)

So by developing you app for only English (the usual development language), you are not reaching even the largest set of people of this world.

Localisation becomes an important part of your app if you want to make it available across country borders. Your app becomes usable by a larger set of people.

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

[genstrings]: https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/genstrings.1.html
