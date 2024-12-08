// main.typ
#import "./globals.typ": *

#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [AHPA 阅读报告],
    subtitle: [AHPA: Adaptive Horizontal Pod Autoscaling Systems on Alibaba Cloud Container Service for Kubernetes],
    author: [邹翔宇，陈锦新],
    date: datetime(day: 9, month: 12, year: 2024),
    // institution: [Institution],
    logo: emoji.bird,
  ),
  progress-bar: false,
  // config-common(handout: true),
)
#title-slide()

#include "content.typ"