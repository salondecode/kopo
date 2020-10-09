![](https://salondecode.github.io/kopo/assets/kopo_logo.gif)

find Korea Postal address

![](https://salondecode.github.io/kopo/assets/kopo_video.gif)

## Getting Started

You should ensure that you add the router as a dependency in your flutter project.
```yaml
dependencies:
 kopo: "^0.1.2"
```

## Setup

### iOS
Opt-in to the embedded views preview by adding a boolean property to the app's `Info.plist` file
with the key `io.flutter.embedded_views_preview` and the value `YES`.
```xml
<key>io.flutter.embedded_views_preview</key>
<true/>
```

## Example

```dart
import 'package:kopo/kopo.dart';

MaterialButton(
  child: Text('find Korea Postal address'),
  onPressed: () async {
    KopoModel model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => Kopo(),
      ),
    );
  },
),
```
