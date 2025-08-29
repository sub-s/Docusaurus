---
slug: accessibility
title: 웹 접근성 가이드라인
authors: sub-s
tags: [hello, docusaurus]
---

# 웹 접근성 가이드라인

본 가이드는 [WCAG 원문](https://www.w3.org/TR/WCAG22/), [WCAG 2.2 한글](https://a11ykr.github.io/wcag22/#abstract)에 의하여 작성 되었으며,
설명하지 않거나 애매한 주제는 [WCAG 원문](https://www.w3.org/TR/WCAG22/), [WCAG 2.2 한글](https://a11ykr.github.io/wcag22/#abstract)에 접속하여 지침 및 평가 방법을 따르도록 합니다.

고유의 콘텐츠에 대응하는 [WCAG 원문](https://www.w3.org/TR/WCAG22/), [WCAG 2.2 한글](https://a11ykr.github.io/wcag22/#abstract) 가이드라인에 대한 이해를 돕고
손쉽게 평가할 수 있도록 소개한 것으로써 고객에게 웹 서비스를 제공하기 전 준수해야 할 최소한의 요구사항 입니다.

[Markup Validation](https://validator.w3.org/)

<!-- 1. [의미를 전달하고 있는 이미지에 대체 텍스트를 제공](#alt)
2. [4.5:1 이상의 명도 대비를 유지](#contrast)
3. [마우스를 사용하기 어려운 사용자](#keyboard)
4. [Carousel(캐러셀)](#time)
5. [발작을 유발하는 콘텐츠를 제공하지 않는다.](#seizure)
6. [반복되는 콘텐츠 블록을 건너뛸 수 있다.](#bypass)
7. [모든 문서의 제목은 고유하고 식별할 수 있다.](#title)
8. [링크와 버튼 텍스트는 목적과 기능을 명확히 전달해야 합니다.](#link)
9. [의미 있는 마크업 사용](#outline)
10. [문맥 변경은 예측할 수 있다.](#predict)
11. [폼 콘트롤 요소에 설명을 제공한다.](#form)
11. [언어 Language.](#language) -->

## 1. 의미를 전달하고 있는 이미지에 대체 텍스트를 제공

- 대체 텍스트는 이미지의 시각적 의도와 동등한 내용을 전달한다.
- 대체 텍스트는 중복으로 제공하지 않는다.

```html
<!-- X -->
<img src="hanabank.png" />
<img src="hanabank.png" alt />
<img src="hanabank.png" alt="" />
<img src="hanabank.png" title="하나원큐" />
<img src="hanabank.png" alt="하나원큐" title="하나원큐" />

<!-- O -->
<img src="hanabank.png" alt="하나원큐" />

<!-- X -->
<a href="/"> <img src="hanabank.png" alt="하나원큐" /> 하나원큐 </a>

<!-- O -->
<a href="/"> <img src="hanabank.png" alt /> 하나원큐 </a>

<!-- X -->
<a href="/" style="background:url(hanabank.png) no-repeat"></a>

<!-- O -->
<a href="/" style="background:url(hanabank.png) no-repeat">하나원큐</a>
```

### SVG에 접근성 코드 편집하기

SVG에 접근성 코드를 편집하는 방법은 다음과 같습니다. SVG 첫머리에 해당 그래프의 제목과 부연설명을 title, desc 속성으로 추가하고 각각에 id를 부여하여 aria-labelledby, aria-describedby로 연결합니다. 제목 혹은 부연설명 정보가 있다면 해당 id를 aria-labelledby, 혹은 aria-describedby로 연결하면 됩니다.
그래프 SVG는 여러 데이터의 결과값이 `<text>` 태그 안에 표시되며 스크린리더에서 각각의 `<text>` 안의 정보를 읽어줍니다. 따라서 svg의 데이터값 전체가 하나의 그룹에 속해 있음을 알려주기 위하여 role=”group”을 함께 추가합니다.

```html
<svg aria-labelledby="svgTitle svgDesc">
  <title id="svgTitle">그래프 제목</title>
  <desc id="svgDesc">그래프 부연 설명</desc>
</svg>

<svg role="group" aria-labelledby="svgTitle svgDesc">
  <title id="svgTitle">그래프 제목</title>
  <desc id="svgDesc">그래프 부연 설명</desc>
</svg>

<svg
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  viewBox="0 0 520 520"
  width="250"
  height="250"
  role="group"
  aria-labelledby="svgTitle svgDesc"
>
  <title id="svgTitle">SVG 이미지의 대체 텍스트</title>
  <desc id="svgDesc">SVG 이미지의 설명을 작성합니다.</desc>

  <g id="bars" role="list" aria-label="막대그래프">
    <g role="listitem">
      <rect x="10" y="20" width="30" height="40" role="presentation"></rect>
    </g>
    <g role="listitem">
      <rect x="50" y="60" width="30" height="40" role="presentation"></rect>
    </g>
  </g>
</svg>
```

## 2. 4.5:1 이상의 명도 대비를 유지

- 전경 콘텐츠는 정보를 전달하고 있는 '문자, 아이콘, 콘트롤(a, button, input, select, textarea)'의 선과 면을 의미한다.
- 문자 크기가 bold 19px 이상 또는 normal 24px 이상인 경우 3:1 이상의 명도 대비를 유지한다.
- 아이콘, 콘트롤 등 시각 정보가 3px 이상 두꺼운 경우 3:1 이상의 명도 대비를 유지한다.

```html
<!-- X -->
<body style="background:#fff">
  <p style="color:#777">하나원큐</p>
</body>

<!-- O -->
<body style="background:#fff">
  <p style="color:#767676">하나원큐</p>
</body>
```

### 터치기반의 환경에서의 버튼

- 포인트 영역의 크기를 44 X 44 CSS 픽셀 이상 충분한 크기로 제공
- 페이지 내 충분한 크기의 대체 기능이 있거나, 텍스트의 일부이거나, 작
  성자가 변경할 수 없는 사용자 에이전트에 의해 결정되는 부분, 필수적
  인 경우는 예외
- 스마트폰 쿼티(qwerty) 자판의 경우, 각 버튼의 크기가 충분하지는 않지
  만, 사용자 에이전트가 제공하는 기능으로 예외

### 명도 대비 평가 도구 참고 사이트

- [Colour Contrast Check](https://snook.ca/technical/colour_contrast/colour.html#fg=33FF33,bg=333333)
- [Accessible Color Generator](https://learnui.design/tools/accessible-color-generator.html)

---

## 3. 마우스를 사용하기 어려운 사용자

- 키보드 접근 순서는 논리적으로 이동 할 수 있어야 한다.
- 초점을 받은 요소는 시각적 `focus` 단서를 제공해야 한다.
- 링크, 버튼 등 콘텐츠의 모든 기능이 키보드만으로도 사용가능하도록 한다.
- 드래그 앤 드롭(drag and drop)을 대체할 수 있는 키보드 기능 제공
  ※ 그리기와 같은 경로기반 동작이 필수적인 경우는 키보드 사용 보장 예외임

## 4. Carousel(캐러셀)

### 캐러셀의 웹 접근성 문제점

1. `스크린리더 사용자`: 이미지 슬라이드를 정확히 탐색하거나 내용을 이해하기 어렵습니다.
2. `키보드 사용자` : 화살표, 탭 키 등으로 캐러셀 내부를 탐색하기 힘들 수 있습니다.
3. `자동 재생 문제` : 자동으로 슬라이드가 전환되면 사용자가 콘텐츠를 이해하기 전에 넘어갈 위험이 있습니다.
4. `포커스 이동` : 현재 표시된 슬라이드에 포커스가 명확히 가지 않을 경우 혼란을 초래할 수 있습니다.

### ARIA속성을 이용하여 접근성을 향상

1. `role="region"` : 캐러셀 영역을 스크린리더에 구분합니다.
2. `aria-roledescription="carousel"` : 스크린리더가 이 영역이 캐러셀임을 알 수 있도록 합니다.
3. `aria-live="polite"` : 현재 활성 슬라이드의 변화를 스크린리더가 읽도록 합니다.
4. `aria-hidden="true"` : 보이지 않는 슬라이드를 스크린리더가 무시하도록 합니다.

```html
<!-- Carousel -->
<div
  role="region"
  aria-roledescription="carousel"
  aria-labelledby="carouselTitle"
>
  <h2 id="carouselTitle">추천 상품</h2>
  <div aria-live="polite">
    <div id="slide1" role="group" aria-label="1 / 3">
      <img src="image1.jpg" alt="상품 1 설명" />
    </div>
    <div id="slide2" role="group" aria-label="2 / 3" aria-hidden="true">
      <img src="image2.jpg" alt="상품 2 설명" />
    </div>
  </div>
</div>

<!-- button -->
<button aria-controls="slide1" aria-label="이전 슬라이드">&lt;</button>
<button aria-controls="slide2" aria-label="다음 슬라이드">&gt;</button>

<!-- auto play button -->
<button aria-pressed="false" aria-label="자동 재생 시작">재생</button>
<button aria-pressed="true" aria-label="자동 재생 정지">정지</button>
```

## 5. [기획 및 디자인] 발작을 유발하는 콘텐츠를 제공하지 않는다.

- 1초에 3~50회 사이의 번쩍이는 콘텐츠는 광과민성 발작을 유발할 수 있다.
- 광과민성 발작은 소아 또는 간질 경험이 있는 사람에게 더 위험하다.
- 소아 또는 간질 경험이 있는 사람에게 발작 위험.

## 6. 반복되는 콘텐츠 블록을 건너뛸 수 있다.

- 일반적으로 글로벌 탐색 바와 로컬 탐색 바는 반복되는 콘텐츠 블록이다.
- 반복되는 콘텐츠를 건너뛰기 할 수 있도록 우회로(bypass)를 제공한다.
  예) 대메뉴를 건너뛰어 본문으로 바로가는 링크를 대메뉴 앞에 제공

```html
<!-- X -->
<body>
  <h1>하나원큐</h1>
  <nav>...</nav>
  <main>...</main>

  <!-- O -->
  <body>
    <a href="#main">본문으로 건너뛰기</a>
    <h1>하나원큐</h1>
    <nav>...</nav>
    <main id="main">...</main>
  </body>
</body>
```

## 7. 모든 문서의 제목은 고유하고 식별할 수 있다.

- 제목 콘텐츠를 문서마다 다르게 설명함으로써 현재 문서의 용도를 식별할 수 있다.

```html
<!-- X -->
<head>
    <title>하나원큐<title>

<!-- O -->
<head>
    <title>하나원큐 - 개인뱅킹 - 계좌이체 <title>
```

### 기대 효과

- 전맹 사용자가 링크 이동 결과를 음성으로 확인할 수 있다.
- 문서의 용도를 빠르게 파악할 수 있다.
- 검색엔진이 올바른 페이지를 수집하도록 돕는다.
- 유저 에이전트 탭의 식별 가능성이 높아진다.

---

## 8. 링크와 버튼 텍스트는 목적과 기능을 명확히 전달해야 합니다.

- 텍스트만 보더라도 해당 링크나 버튼의 역할을 이해할 수 있어야 합니다.
- "여기를 클릭하세요", "더보기"와 같은 모호한 표현을 피하고, 구체적인 설명을 제공합니다.
- 아이콘과 텍스트를 함께 사용 하는 경우 혹은 아이콘만 사용해야 하는 경우 스크린리더 사용자를 위해 대체 텍스트(aria-label 또는 aria-hidden)를 제공 합니다.

```html
<!-- X -->
<a href="/">여기를 클릭하세요</a>
<button>더보기</button>

<!-- O -->
<a href="/">신상품 보러 가기</a>
<button>회원가입</button>

<a href="/download" aria-label="보고서 다운로드">다운로드</a>
<button aria-label="회원가입 완료 페이지로 이동">회원가입</button>

<button aria-label="검색">
  <svg aria-hidden="true" focusable="false">🔍</svg>
</button>
```

## 9. 의미 있는 마크업 사용

- 문서 내 논리적인 그룹화가 필요한 부분에 의미에 맞는 시맨틱 태그를 사용
  - `section` : 특정 주제나 기능을 포함하는 섹션.
  - `article` : 독립적인 콘텐츠 단위.
  - `aside` : 주요 콘텐츠와 별개로 관련 정보를 제공.
  - `nav` : 네비게이션 링크 그룹.
  - `header, footer` : 머리글과 바닥글.
  - `main` : 문서의 주요 콘텐츠.

```html
<h1>웹 접근성 가이드</h1>
<section>
  <h2>헤딩의 중요성</h2>
  <p>헤딩은 문서의 구조와 목적을 나타냅니다.</p>
</section>
<section>
  <h2>시맨틱 마크업</h2>
  <h3>section 태그</h3>
  <p>section 태그는 논리적으로 그룹화된 콘텐츠를 나타냅니다.</p>
</section>
```

## 11. 문맥 변경은 예측할 수 있다.

### 문맥 변경은 사용자가 예상치 못한 방식으로 페이지의 콘텐츠, 레이아웃, 포커스, 또는 동작이 변하는 상황을 의미합니다.

- 드롭다운 메뉴에서 옵션을 선택하자마자 페이지가 자동으로 리로드되거나 이동하는 경우.
- 특정 작업(예: 클릭, 마우스 오버) 시 사용자가 예상하지 못한 새 창이 열리는 경우.

### 문맥 변경이 접근성에 미치는 영향

- 스크린리더 사용자는 갑작스러운 변경 사항을 파악하지 못하고 혼란을 겪을 수 있습니다.
- 키보드 사용자는 포커스가 예상치 못하게 변경되면 작업을 이어가기 어렵습니다.
- 인지 장애를 가진 사용자는 갑작스러운 변화를 이해하거나 적응하기 어려울 수 있습니다.

```html
<!-- 사용자가 선택 후 버튼을 클릭해야만 동작이 실행 -->
<select id="options">
  <option>옵션을 선택하세요</option>
  <option value="1">옵션 1</option>
  <option value="2">옵션 2</option>
</select>
<button>확인</button>

<!-- 사용자가 title 또는 aria-label을 통해 새 창이 열릴 것을 사용자에게 알림 -->
<a href="https://example.com" target="_blank" aria-label="새 창에서 열림"
  >자세히 보기</a
>
```

## 11. 폼 콘트롤 요소에 설명을 제공한다.

- 모든 input, textarea, select 요소에는 콘트롤을 설명하는 label 요소를 맵핑하거나 또는 title 속성을 제공한다.

```html
<form>
  <fieldset>
    <legend>회원가입</legend>
    <label for="fullname">이름</label>
    <input
      type="text"
      id="fullname"
      name="fullname"
      aria-describedby="fullname-hint"
    />
    <small id="fullname-hint">실명을 입력하세요.</small>

    <label for="email">이메일</label>
    <input
      type="email"
      id="email"
      name="email"
      aria-describedby="email-error"
    />
    <span id="email-error" role="alert">유효한 이메일 주소를 입력하세요.</span>

    <button type="submit">가입하기</button>
  </fieldset>
</form>
```

## 12. 언어 Language

- 현재 페이지에서 주로 사용된 언어가 무엇인지를 명시적으로 제공하지 않으면, 화면낭독프로그램 등 보조공학기기는 해당 언어에 맞는 정확한 작동이 어렵다.
- 현재 페이지에 사용된 언어가 무엇인지 명시한다.
  ※ 예 : 페이지 언어를 `<html lang=“ko”>` 한국어로 표시하면 `東京`은 `동경`으로 읽힐 수 있으며, `<html lang=“ja”>` 일본어로 표시하면 `도쿄`로 읽힐 수 있음
- 페이지 일부분에 다른 언어가 사용된 경우, 해당 언어가 무엇인지 명시적으로 제공하지 않으면, 화면낭독프로그램 등 보조공학기기는 해당 부분의 언어에 맞는 정확한 작동이 어렵다.
- 다른 언어가 사용된 일부분에 어떤 언어가 사용되었는지 명시
  ※ 예 : `<p lang=“ja”>`東京`</p>`과 같이 사용된 언어정보 제공
