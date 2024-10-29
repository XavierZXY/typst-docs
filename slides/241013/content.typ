// content.typ
#import "./globals.typ": *

= The Section 1

== Slide Title

#lorem(40)

== Slide Title
#slide[
  #lorem(40) \
  #pause
  123
][
  #pause
  #lorem(40)
]

#matrix-slide[
  left
][
  middle
][
  right
]