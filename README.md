# Vestiaire-test
Project to pass Vestiaire collective test task and land my dream job

## Development process
I've decided to use storyboard to speed up the process. I think, this is a good decision for project of this size

Another decision – using Swift Package Manager to extract networking as a separate library. 
This allows me to develop networking code apart from main project. In fact, I can even run tests without needing to load entire project

And one more interesting part. I've used `RandomEntityGenerator` protocol to generate entities in random manner. 
It was useful, when I tested UI without actual data from server. 
To accomplish this, all I had to do is add `= .random` to data sources of tables in `ListViewController:14` and `DetailsViewController:13`

I was working on this project during half of Saturday, Sunday and Monday evening

## Project enhancements
To save time, both yours and mine, I decided not to implement Data Base storage. 
So this is a first step, if someone decides to further enhance project

I would prefer *Realm*, not *CoreData*, because of the size of this project and its simplicity. 
*Realm* storage is much easier to implement. *CoreData* has greater functionality, but it is not needed here.
And the same as networking, I would work with Data Base in separate package

Another thing to consider is weather in other locations. User should have possibility to input its desired location and get specific forecast

Nice thing to have is an iPadOS version of the app. 
It would consist of master-detail view on one screen rather than on two screens in iOS version

And also it would be great to make the app cross-platform. 
If I could reduce the number of supported iOS versions and use *SwiftUI*, I would make versions of app for all platforms – 
wathchOS, iOS, iPadOS, macOS and tvOS
