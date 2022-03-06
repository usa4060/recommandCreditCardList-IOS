# Recommand Credit Card List

## 1. Database란?
- 데이터의 집합체
- 일반적으로 관계형 데이터베이스 형태 (RDB)
    - RDB는 테이블로 이루어져 있고, 테이블은 각 각 이름을 가지고 있으며 서로 관계를 맺고 모여있는 형태이다.
    - 테이블은 행과 열로 이루어져 있고, 해당 위치에 대응하는 값을 가지게 된다.

## 2. Firebase Realtime Database란?
- 일반적인 Database와는 _***비관계형 클라우드 데이터 베이스***_ 이다.
    - NoSql (Not Only Sql)이라고도 부른다.
- NoSql은 대량의 데이터를 대규모를 처리하고, 점점 더 많은 데이터를 수집하고 처리하는 모바일 &웹 개발에 적합하다.
- Sql이라면 여려테이블에 나뉘어져 가지고 있을 데이터들을, 하나의 단일 문서내의 속성으로 저장이 된다.
- JSON기반의 데이터를 가져오고, 내보내고, 관리하는데에 최적화 되어있다.
- 이름 그대로 실시간으로 작동한다.
    - 보통 데이터베이스에 어떤 값을 요청 할 떄는 HTTP통신으로 요청이 오고 갈 때, 데이터를 받거나 주게 된다.
    - 하지만, Realtime Database는 Observer와 Snapshot과 같은 객체를 제공하는 SDK를 통해 Client와 실시간으로 동기화 되게 된다.
    - 즉, Realtime Database와 연결 된 모든 기기는 거의 동시에 서버의 변경사항을 실시간으로 반영할 수 있다.
- App이 오프라인 일 경우, 사용자 action에 대한 변경사항을 Local에 저장해 두었다가 App이 다시 네트워크에 연결 되었을 때 자동으로 Realtime Database에 업데이트 하는 기능을 제공한다.
- 서버의 개발 없이 바로 Database에 Access할 수 있다.<br/><br/>

## 3. Firebase Cloud Firestore란?