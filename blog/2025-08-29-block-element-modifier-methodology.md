---
slug: block-element-modifier-methodology
title: CSS 클래스 명명을 위한 BEM 방법론
authors: sub-s
tags: [hello, docusaurus]
---

# CSS 클래스 명명을 위한 BEM 방법론

## CSS 클래스 명명을 위한 BEM 방법론 개요

아래 규칙에 따라 CSS 클래스를 명명한다. <br />
BEM(Block, Element, Modifier)은 CSS 클래스 네이밍의 혼란을 줄이고 유지보수성을 높이기 위해 고안된 방법론이다.

### 📖 BEM 방법론의 기본 원리

```css
/* Block */
.block {
}
/* Element */
.block__element {
}
/* Modifier */
.block--modifier {
}
```

### ⚖️ BEM 방법론의 장점

1. 가독성 – 클래스 이름만 보아도 구조와 관계를 이해할 수 있음.
2. 재사용성 – 블록 단위로 독립적 사용 가능.
3. 예측 가능성 – 일관된 규칙 덕분에 유지보수가 쉬움.
4. 충돌 방지 – 전역 CSS 네임스페이스 문제를 최소화함.

### 1. Block (블록)

`Block(블록)`은 하나의 명확한 의미를 갖는 독립적인 UI 단위이다.  
블록 네이밍은 낙타표기법(camelCase)을 사용하지 않고 하이픈(-)을 사용한다.  
예를 들어 뉴스 카드(news card)의 블록 클래스명을 정한다면 `.newsCard`가 아니라  
`.news-card`로 작성한다.

- 독립적으로 의미를 가지는 UI 구성 요소.
- 예: header, menu, button, form

```html
<div class="card">...</div>
```

### 2. Element (요소)

`Element(요소)`는 블록의 일부이며 독립적인 의미가 없다.  
모든 요소는 그 블록에 묶여 있다.  
요소 네이밍은 `블록 이름`과 `두 개의 밑줄(__, underscore)` 및 `요소 이름`으로 구성된다.  
예를 들어 카드 안에 제목이 있다고 하면,  
해당 제목의 클래스명을 `.cardtitle`이 아니라 `.card__title`로 작성한다.

- 블록을 구성하는 하위 요소.
- 항상 블록에 종속되며, 블록 이름 뒤에 \_\_(언더스코어 2개)를 붙여 표기.

```html
<div class="card">
  <h2 class="card__title">제목</h2>
  <p class="card__description">설명</p>
</div>
```

### 3. Modifier (수정자)

`Modifier(수정자)`는 블록 또는 요소에 상태를 나타내는 플래그를 지정한다.  
스타일, 동작 또는 상태를 바꿀 때 사용한다.
수정자 네이밍은 `블록 또는 요소의 이름`과 하이픈 2개(--)로 구성된다.  
예를 들어 카드 링크가 기본(primary) 스타일과 보조(secondary) 스타일을 가진다면,  
해당 클래스명을 `.card__link--primary`, `.card__link--secondary`로 작성한다.

- 블록이나 요소의 상태(state) 또는 변형(variation)을 표현.
- 하이픈 2개(--)를 붙여 표기.

```html
<div class="card">
  <a href="#" class="card__link card__link--primary">확인</a>
  <a href="#" class="card__link card__link--secondary">취소</a>
</div>
```

### 📌 BEM 예시 (HTML + CSS)

```html
<div class="card card--highlighted">
  <h2 class="card__title">공지사항</h2>
  <p class="card__description">이번 주 점검 안내</p>
  <a href="#" class="card__link">자세히 보기</a>
</div>
```

```css
/* Block */
.card {
  border: 1px solid #ccc;
  padding: 16px;
  border-radius: 8px;
}

/* Element */
.card__title {
  font-size: 20px;
  margin-bottom: 8px;
}

.card__description {
  font-size: 14px;
  color: #666;
}

.card__link {
  color: blue;
  text-decoration: underline;
}

/* Modifier */
.card--highlighted {
  border-color: orange;
  background-color: #fff8e1;
}
```

## 참조

[BEM 방법론](https://nykim.work/15)
