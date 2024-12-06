// main.typ
#import "./globals.typ": *

#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [AHPA 阅读报告],
    subtitle: [AHPA: Adaptive Horizontal Pod Autoscaling Systems],
    author: [邹翔宇，陈锦新],
    date: datetime.today(),
    // institution: [Institution],
    // logo: emoji.school,
  ),
  progress-bar: false,
  // config-common(handout: true),
)
#title-slide()

#include "content.typ"