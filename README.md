# pfps_platform
# 공공시설 수해재난 플랫폼 관리자용 모바일 단말기 (Flutter)

## Intro
공공시설 수해 방지 플랫폼의 주요 목표는 대한민국이 매해 여름 겪고 있는 침수 및 홍수에 인명피해 및 재산 피해를 최소화 하고자 아이디어를 고안했습니다. 
공공시설 수해 방지 플랫폼은 침수 피해가 발생했던 지역 혹은 침수 위험 지역에 설치하여 공공시설에 관여하는 공무원 혹은 시설 관리자가 위험 지역에 직접 설치해야 하는
설치형 차수막은 위험 지역에 설치하러 직접 가야 하기 때문에 2차 인명피해로 이어질 수 있습니다. 하지만 저희가 개발한 공공시설 수해 방지 플랫폼은 긴급 상황에 빠르게 조치할 수 있어 이로 인한 기대 효과로 사전에 인명피해 및 재산 피해를 최소화 할 수 있을 것으로 예상됩니다.

##

### 아키텍처(Architecture)
![img](https://file.notion.so/f/f/b485894b-653a-4595-9afa-4bcced64b150/ad4bf443-8e88-4afb-b499-7c05a0b78e10/Untitled.png?id=ed9c464c-187e-404e-934c-ceec117a45b9&table=block&spaceId=b485894b-653a-4595-9afa-4bcced64b150&expirationTimestamp=1709647200000&signature=6IaWrqzWtsEuEgE-NT8PtCHClLfWdwogRFvUMkGiiCc&downloadName=Untitled.png)

### 프로젝트 구조 (Directory Tree)
```
lib/
|-- constants/
|   |-- constants.dart
|   |-- responsive.dart
|-- controllers/
|   |-- controller.dart
|-- data/
|   |-- data.dart
|-- models/
|   |-- analytic_info_model.dart
|   |-- discussions_info_model.dart
|   |-- referal_info_model.dart
|-- screens/
|   |-- components/
|   |   |-- analytic_cards.dart
|   |   |-- analytic_info_card.dart
|   |   |-- bar_chart_users.dart
|   |   |-- custom_appbar.dart
|   |   |-- dashboard_content.dart
|   |   |-- discussion_info_detail.dart
|   |   |-- discussions.dart
|   |   |-- drawer_list_tile.dart
|   |   |-- drawer_menu.dart
|   |   |-- profile_info.dart
|   |   |-- radial_painter.dart
|   |   |-- referal_info_detail.dart
|   |   |-- search_field.dart
|   |   |-- top_referals.dart
|   |   |-- users.dart
|   |   |-- users_by_device.dart
|   |   |-- view_line_chart.dart
|   |   |-- viewers.dart
|   |-- dash_board_screen.dart
|-- main.dart
```
