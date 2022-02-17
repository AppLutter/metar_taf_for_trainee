조종사를 꿈꾸며 비행 수업을 받는 조종 연습생들을 위한 어플리케이션 입니다.

조종사들은 비행 전 경로의 날씨를 파악하기 위해서 기상 예보를 확인합니다.

특히 METAR(항공 정시 기상 관측)과 TAF(공항 예보)는 필수적으로 봐야하는 정보 입니다.

많은 공항을 알려주는 기존 서비스보다, 보다 편리하고 맞춤있게 정보를 제공하기 위하여

제작했습니다.


폴더 구성
constants == 비행장 이름, 비행장 코드, API를 제공할 URL 제공
models == METAR, TAF XML데이터를 가공
resource == ThemeData 저장
services == API 통신 함수를 정의
weather_page == 화면의 body에 해당하는 부분
  weather_page.dart == AppBar를 정의하고, body 부분을 호출
weather_page/components == body를 구성하는 위젯 모음
  metar_taf_listview.dart == 여러개의 ExpansionList를 만듬
  weather_expansion.dart == ExpansionList, ExapnsionTile 정의