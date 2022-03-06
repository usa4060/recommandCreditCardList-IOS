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
- Firebase에서 Realtime Database이후에 제공하기 시작한, 비교적 최근에 제공된 플랫폼이다.
- Realtime Database와 같이 NoSql로, Realtime Database와 동일한 주요기능을 제공한다.
- Firebase에서는, 개발하는 App의 성격 및 특징에 따라 권장하는 Database를 구분하고 있다.
- 무엇보다, 비교적 최근에 나온 Firestore가 보다 복잡한 Query기능을 제공하다.
    - Query(질의어)란 쉽게 말해서, Database에 정보를 요청하는 것이다.
- Firebase에서 제공하는 두 개의 Database는 모두 Query를 통해 Data를 검색/정렬/필터링 해준다.
    - 두 Database의 차이점으로는
        - Realtime Database
            1. 모든 Data를 하나의 큰 JSON파일로 저장한다.
            2. 하나의 Query에 정렬 또는 필터링을 할 수 있다.(즉, 동시에 불가능)
            3. 깊고 좁은 쿼리를 제공한다.
                -  결과값이 가지는 하위값 모두를 제공하기 때문에, 하위값 까지 한번에 접근 가능하다.
            4. Data-set의 크기가 커질 수록, Query의 성능도 떨어진다.
        - Cloud Firestore 
            1. JSON과 유사하지만 JSON이 아닌, 문서와 컬렉션의 조합을 제공한다.
            2. 여러개의 필터를 서로 연결하거나, 필터링과 정렬을 동시에 하는것이 가능하다.
            3. 얕고 넓은 쿼리를 제공한다.
                - 특정 컬렉션의 문서만 제공하고, 해당 문서가 하위 컬렉션을 가지고 있더라도 그 컬렉션 까지는 제공(반환)하지 않는다.
            4. 전체적인 Data-set의 크기는 Query의 성능에 직접적인 영향을 주지 않는다.
- 그렇다면, 어떠한 경우에 Realtime Database / Cloud Firebase를 각 각 사용할까??
    - Realtime Database 
        1. 기본적인 데이터의 동기화가 필요한 경우
        2. 적은양의 데이터를 다루고, 자주 변경이 필요한 경우
        3. JSON트리의 구조가 간단한 경우
        4. 많의 데이터베이스를 다룰 경우
    - Cloud Firebase
        1. 고급쿼리, 정렬, 트랜젝션이 필요한 경우
        2. 대용량의 데이터가 자주 읽히는 경우
        3. 구조화된 컬렉션을 다루는 경우
        4. 단일 데이터베이스의 경우

---
## 개발 중 유의 사항
### 1. Lottie란?
- 에어비엔비에서 만든 오픈소스로, ImageView에 gif파일 즉 움짤을 사용할 수 있게 해줌.
