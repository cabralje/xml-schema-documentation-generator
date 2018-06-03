---
title: Complex type nc:DateType
---

# Complex type nc:DateType

## Definition

A data type for a calendar date.

## Diagram

<object data="diagram.svg" type="image/svg+xml">
<img src="diagram.svg" usemap="#diagram"/>
{% include_relative diagram.map %}
</object>


## XML Schema fragment

```xml
<xs:complexType name="DateType">
  <xs:annotation>
    <xs:documentation>A data type for a calendar date.</xs:documentation>
  </xs:annotation>
  <xs:complexContent>
    <xs:extension base="structures:ObjectType">
      <xs:sequence>
        <xs:element ref="nc:DateRepresentation" minOccurs="0" maxOccurs="unbounded"/>
        <xs:element ref="nc:DateAccuracyAbstract" minOccurs="0" maxOccurs="1"/>
        <xs:element ref="nc:DateMarginOfErrorDuration" minOccurs="0" maxOccurs="1"/>
        <xs:element ref="nc:DateAugmentationPoint" minOccurs="0" maxOccurs="unbounded"/>
      </xs:sequence>
    </xs:extension>
  </xs:complexContent>
</xs:complexType>
```

## JSON Schema fragment



# Notes

Vivamus sagittis mi nec turpis porta fermentum. Mauris quis euismod est, non rutrum ante. Vivamus consequat ornare mi, vel porttitor libero fringilla id. Nulla ac elementum urna. Nulla at leo hendrerit, blandit lorem eu, pharetra nunc. Vivamus cursus orci quis eros dignissim, a ultrices metus porttitor. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam diam justo, scelerisque at velit at, posuere vulputate eros. Curabitur elementum nec dolor a consectetur. Suspendisse potenti. Ut ante metus, faucibus vestibulum varius quis, congue elementum turpis. Pellentesque vitae ornare purus. Ut quis suscipit urna. Sed pellentesque nisi turpis, sit amet ullamcorper mauris dignissim quis. Sed dictum iaculis arcu, vel egestas erat molestie at. Ut vel sapien interdum, dignissim magna eget, feugiat dui. Praesent commodo fermentum mauris, quis varius ipsum luctus non.

Cras maximus dignissim turpis id pulvinar. Nulla tempus purus erat, accumsan accumsan libero congue ac. Morbi hendrerit lacus ac felis consectetur sollicitudin. Curabitur velit orci, mollis sit amet ornare nec, vestibulum a nulla. Nulla facilisi. Etiam eget diam quis sapien fringilla placerat. Nunc efficitur urna enim, vel pellentesque neque lobortis nec. Nulla feugiat ex sed mauris ultrices elementum. Curabitur nisl sapien, congue eu risus et, ornare accumsan eros. Ut id nisi nec erat euismod efficitur et non ante. Cras quam velit, facilisis sed lacus at, convallis imperdiet massa. Donec finibus ante orci, sed aliquet ipsum auctor eget.

Nulla laoreet sem non massa lacinia, a egestas turpis lobortis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque pulvinar fermentum metus quis maximus. Nullam at vulputate elit. Aenean volutpat tellus in metus lobortis, et ultricies nisi rhoncus. Donec placerat lectus scelerisque tempor aliquam. Duis ultricies, justo nec consequat accumsan, mauris mauris porta metus, vel sodales diam nunc nec odio. Mauris vulputate a sapien quis vulputate. In tortor massa, molestie vitae porta non, lacinia ac arcu. Ut et elementum orci. Quisque vitae neque tincidunt, sagittis erat in, consequat velit. Mauris vulputate nulla at pharetra malesuada.

Donec in lacinia ante. Fusce id dui et velit ullamcorper porta. Quisque egestas ultricies justo, a gravida lectus mollis nec. Aenean scelerisque ex nec velit vestibulum dapibus. Morbi sodales egestas tincidunt. Integer eros nisl, aliquet sed faucibus ac, dignissim ac diam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam nec neque vel sapien volutpat semper ac eu odio. Nam eget consequat libero. Nam fringilla velit purus, a auctor sem lobortis a. Aenean mattis libero at dignissim tempus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris ac ex neque.

Maecenas volutpat imperdiet mauris at pharetra. Nullam at dui metus. Cras eget ex at sem pellentesque viverra. Nullam viverra nibh lectus, ut sodales felis bibendum a. Aliquam erat volutpat. Pellentesque vehicula lacus ac dolor eleifend interdum. Vivamus massa felis, varius quis commodo nec, vestibulum in urna. Suspendisse tempus, lorem quis faucibus sagittis, massa nisi porta lectus, eget rutrum velit sem sit amet tortor. Donec laoreet turpis turpis, sit amet aliquam ligula pharetra vitae.

Cras interdum, mauris vel cursus scelerisque, augue augue maximus magna, nec suscipit lectus arcu in purus. Etiam facilisis orci nec sollicitudin rhoncus. In in commodo sapien, eu euismod libero. Etiam augue orci, dictum in bibendum finibus, congue pellentesque odio. Nunc pharetra diam neque, a fermentum ipsum gravida at. Nulla dapibus ornare enim, at varius arcu finibus vitae. Sed id odio vel dui rutrum rutrum nec nec turpis.

Pellentesque id metus efficitur, placerat lacus et, tempor ante. Nulla at arcu porttitor, sagittis purus eu, varius nisi. Maecenas semper maximus elit condimentum gravida. Integer quis ullamcorper mi. Duis condimentum lacinia ullamcorper. Sed eget mi et arcu venenatis mattis id eu est. Integer vitae commodo turpis. Fusce vitae est efficitur diam varius efficitur.

Mauris ullamcorper aliquet ante eu consectetur. Vestibulum porttitor pretium posuere. Pellentesque elementum feugiat blandit. Vestibulum nisi sapien, blandit quis dignissim lobortis, fermentum eget nisl. Vivamus fringilla congue ornare. Mauris iaculis nibh ut posuere laoreet. Mauris vestibulum est quis dictum egestas.

Phasellus in eleifend erat. Nulla blandit nibh quis facilisis euismod. Duis vel sagittis nulla. Curabitur euismod sem at pretium facilisis. Praesent pulvinar, urna quis posuere efficitur, tortor dolor sagittis justo, in ornare augue urna nec mauris. Integer eu elit porttitor, cursus nunc at, imperdiet velit. Sed a est in elit eleifend consectetur.

Praesent in tempus tortor, in aliquam nisl. Aenean iaculis faucibus hendrerit. Aliquam placerat ex leo, ut iaculis ante volutpat vel. Etiam at condimentum mi. Pellentesque viverra enim in laoreet varius. Aliquam neque eros, feugiat sit amet odio ut, bibendum molestie neque. Fusce arcu ligula, tincidunt vel lectus eget, porttitor auctor tellus.

Quisque sed sapien in nibh facilisis auctor. Nam eu pellentesque mi. Fusce pretium ullamcorper consectetur. Vestibulum condimentum, neque ut euismod sollicitudin, sapien augue lobortis augue, quis cursus arcu sapien quis nisl. Sed hendrerit erat dolor, eu condimentum sapien pretium eget. Donec tincidunt metus nec augue venenatis maximus. Sed fringilla dolor vel felis blandit, et vehicula dui iaculis. Aliquam nibh diam, convallis a congue gravida, convallis ac neque. Duis vel lacus porttitor mauris scelerisque commodo. Sed aliquam nisi sed laoreet vulputate.

Vivamus convallis vitae odio egestas blandit. Nunc ipsum augue, porta sed ipsum a, vestibulum consectetur libero. Aenean ac congue metus. Donec viverra ligula sed ante sollicitudin bibendum. Morbi turpis mi, luctus in rhoncus quis, semper vel dui. Mauris accumsan luctus egestas. Suspendisse ac sollicitudin purus. Proin vehicula arcu elit, eu auctor mi scelerisque non. Suspendisse potenti.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur eu molestie tortor, sit amet tristique ligula. Aenean nec sapien ac nulla pulvinar mollis. Vestibulum sit amet euismod sem. Vestibulum placerat lectus eu sem tempor egestas. Curabitur in vestibulum nunc. Curabitur in purus sapien. Aenean dictum laoreet sem, quis volutpat ex venenatis eu. Pellentesque a vestibulum elit, eget porta odio. Integer nulla odio, mattis ut dolor nec, condimentum lacinia urna. Suspendisse lobortis ex varius bibendum suscipit. Nullam velit nisl, laoreet at pharetra at, tristique sed enim. Nullam metus orci, cursus condimentum lorem nec, rhoncus consequat justo. Nam ultricies tempus erat ac ultricies.

Nullam commodo, nulla ac maximus placerat, ipsum nisl maximus sem, ut fringilla libero sapien vel eros. Cras at facilisis quam, sed lacinia felis. Maecenas tincidunt ex ut iaculis ultrices. Integer nec vehicula velit. Aenean dapibus magna orci, id auctor nunc facilisis id. Nunc commodo quam imperdiet, tempor elit a, molestie ex. Duis lorem lectus, ultrices at dignissim a, dignissim vel metus. Praesent lacinia nulla a diam vehicula tincidunt. Donec sit amet velit fringilla, vehicula leo sit amet, accumsan justo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris orci turpis, aliquet eget fringilla nec, tincidunt non libero.

Pellentesque sollicitudin eros sit amet dui cursus cursus et ut neque. Mauris congue urna id velit lobortis, ut elementum nibh dictum. Nunc commodo a orci at sagittis. Vestibulum id sapien id neque blandit faucibus vel vitae urna. Nulla scelerisque, libero vel hendrerit tincidunt, turpis augue elementum leo, in semper velit odio eget eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam at ipsum commodo felis mattis porttitor a id quam. Mauris tempor, metus et bibendum imperdiet, ligula nisl bibendum ipsum, vitae sollicitudin turpis elit porttitor mauris. In at ipsum in massa vestibulum laoreet in mattis justo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut hendrerit fringilla neque, et commodo elit suscipit vitae. Proin vulputate augue ligula, in blandit turpis egestas sed. Nullam mi lectus, dictum et mollis nec, pretium non odio. Sed posuere neque ante, sed imperdiet lorem placerat nec. Ut in ullamcorper lectus. Duis neque magna, vehicula in egestas in, lacinia non metus.

Pellentesque porttitor justo velit, in accumsan leo convallis eget. Mauris volutpat risus eros, quis posuere dolor tincidunt vel. Phasellus non sem risus. Donec venenatis finibus tincidunt. Vestibulum scelerisque libero quis libero congue, et euismod lacus gravida. Phasellus pulvinar nibh sit amet elit ultricies, quis cursus neque tincidunt. Etiam sodales bibendum erat, vitae ullamcorper enim ultricies et. Quisque interdum ligula et erat convallis tempor. Nunc suscipit volutpat sem, id tincidunt orci sollicitudin a. Suspendisse eu velit condimentum, gravida dolor nec, varius est. Integer non convallis lacus. Curabitur volutpat dolor nibh, eget rhoncus ex fermentum sed.

Pellentesque lobortis turpis ut venenatis condimentum. Suspendisse potenti. Nunc ac maximus libero, sed ultricies diam. Curabitur maximus elit lacus, et scelerisque turpis facilisis ut. Aenean dignissim, elit ac dapibus lobortis, neque magna dignissim sem, eget mattis quam odio quis sapien. Aliquam euismod hendrerit nisi vel gravida. Pellentesque iaculis turpis vitae rhoncus varius. Praesent a maximus nibh. Ut quis ligula congue, malesuada arcu ut, pharetra velit. Proin pellentesque dui sed tempor semper. Nulla sagittis sed massa non ornare.

Suspendisse luctus pellentesque odio sit amet ullamcorper. Praesent orci dolor, vulputate non viverra pharetra, tristique sed risus. Integer tristique nibh vel velit efficitur, id venenatis elit tempor. Maecenas tempor tincidunt nibh, at accumsan mi hendrerit a. Fusce at semper massa, quis pretium nibh. Aenean at orci in diam elementum dictum a vel ex. In vel tellus convallis, pretium tellus at, hendrerit sapien. Mauris id sollicitudin lacus. Nam vel velit lorem. Integer et turpis vel mi blandit luctus vel ac nisl. Donec molestie, libero in mollis laoreet, sem urna imperdiet ipsum, vel finibus nibh ligula in risus. Etiam fermentum condimentum pretium. Duis non maximus nisl, eu elementum ante. Pellentesque vestibulum malesuada faucibus. Quisque commodo elementum orci.