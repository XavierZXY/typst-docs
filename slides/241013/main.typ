// main.typ
#import "./globals.typ": *

#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [2024.12.04],
    subtitle: [Subtitle],
    author: [zxy],
    date: datetime.today(),
    institution: [Institution],
    // logo: emoji.school,
  ),
  progress-bar: false,
  // config-common(handout: true),
)

#include "content.typ"