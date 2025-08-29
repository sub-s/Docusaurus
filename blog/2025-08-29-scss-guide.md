---
slug: scss-guide
title: Sass(SCSS)란!
authors: sub-s
tags: [hello, docusaurus]
---

# Sass(SCSS)란!

CSS보다 심플한 표기법으로 CSS를 구조화하여 표현할 수 있다. 즉, `가독성과 재사용성`을 높여주어 유지보수가 쉬워지게 도와준다.
스킬 레벨이 다른 팀원들과의 작업 시 발생할 수 있는 구문의 수준 차이를 평준화할 수 있다. `CSS의 태생적 한계를 보완하기 위해 Sass`는 다음과 같은 추가 기능과 유용한 도구들을 제공한다.

## 장점

`선택자의 중첩(Nesting)`을 통해 반복되는 부모요소 선택자 사용을 줄일수 있다.
`변수(Variable)`을 사용해서 CSS 속성값을 통일해서 관리할 수 있다.
프로그래밍 언어에서 사용하는 조건문, `반복문을 통해서 동적으로 CSS 관리`가 가능하다.
상속되는 선택자를 계층적으로 명시하여 불필요한 반복적 사용을 줄일 수 있다.

## 특징

1. Nesting (선택자 반복 작성 줄여주는 기능)
2. 변수의 사용
3. 조건문과 반복문
4. Import (모듈화)
5. Mixin (함수 개념)
6. Extend/Inheritance (확장/상속)

## 1. 선택자의 중첩(Nesting)

중괄호 `{`안에 하위 클래스를 선언하여 중첩되는 선택자 사용을 줄일 수 있다.

#### scss

```css
.box {
  font-size: 12rem;
  line-height: 1;
  .h1 {
    font-size: 20rem;
  }
  .h2 {
    font-size: 18rem;
  }
}
```

#### Compiled

```css
.box {
  font-size: 12rem;
  line-height: 1;
}
.box h1 {
  font-size: 20rem;
}
.box h2 {
  font-size: 18rem;
}
```

## 2. & 선택자

문자열과 문자열을 합치거나 다중 클래스 또는 아이디, 가상선택자 등 중복으로 선택자를 선언할 때 사용된다.

#### scss

```css
// 다중클래스
.box {
  font-size: 12rem;
  line-height: 1;
  &.flex {
    display: flex;
    align-items: center;
    justify-content: center;
  }
}
// 문자열 합치기
.pop {
  font-size: 10rem;
  line-height: 1;
  & > .fontSize {
    &11 {
    }
    &12 {
    }
  }
}
```

#### Compiled

```css
// 다중클래스
.box {
  font-size: 12rem;
  line-height: 1;
}
.box.flex {
  display: flex;
  align-items: center;
  justify-content: center;
}
// 문자열 합치기
.title {
  font-size: 10rem;
  line-height: 1;
}
.title.fontSize11 {
  font-size: 11rem;
}
.title.fontSize12 {
  font-size: 12rem;
}
```

## 3. 변수(Variable)

`css` 전체에 거쳐 반복되는 값을 정의하여 편하게 스타일링 할 수 있다. 변수 타입은 `numbers`, `strings`, `colors`, `booleans`, `lists`, `null`이 있다.

#### scss

```css
$backgroundColorRed: red;
.box {
  background: $backgroundColorRed;
}
```

#### Compiled

```css
.box {
  background: red;
}
```

## 4. 변수 유효범위(Scope)

지역변수, 전역변수를 선언 할수있다. `!global`을 사용하여 `local변수`를 `global변수`로 수정할 수 있다. 하지만 사용을 `지양`한다.

#### scss

```css
$color: red;
.box {
  color: $color;
  .children {
    &1 {
      $color: blue;
      color: $color;
    }
    &2 {
      color: $color;
    }
    &3 {
      $color: green !global;
      color: $color;
    }
    &4 {
      color: $color;
    }
  }
}
```

#### Compiled

```css
.box {
  color: red;
}
.box .children1 {
  color: blue;
}
.box .children2 {
  color: red;
}
.box .children3 {
  color: green;
}
.box .children4 {
  color: green;
}
```

## 5. lists(배열)

리스트는 순서가 있는 값으로, 값마다 인덱스를 가지고 있다.리스트를 만들려면 , 나 공백 또는 일관성 있는 `/`로 구분하여 생성한다.
다른 타입 변수 들과 다르게 특수 괄호를 사용하지 않아도 `list`로 인식한다. 빈 `lists`를 만들 때나 `lists`에 들어있는 값이 하나 인 경우 `[]` 나 `()`를 사용하여 생성한다.`lists`값의 인덱스는 1부터 시작한다.

#### METHODS

| Name        | 형식                           | Description                                 |
| ----------- | ------------------------------ | ------------------------------------------- |
| append      | append(list,value,[separator]) | lists의 값을 추가하는 함수                  |
| index       | index(list,value)              | lists의 값에 대한 인덱스를 리턴하는 함수    |
| nth(list,n) | nth(list,n)                    | list의 인덱스에 해당하는 값을 리턴하는 함수 |

#### scss

```css
$fontSize: 1px 2px 3px;
$textAlign: center, left, right .box1 {
  font-size: nth($fontSize, 1);
  text-align: nth($textAlign, 1);
}
.box2 {
  font-size: nth($fontSize, 2);
  text-align: nth($textAlign, 2);
}
.box3 {
  font-size: nth($fontSize, 3);
  text-align: nth($textAlign, 3);
}
```

#### Compiled

```css
.box1 {
  font-size: 1px;
  text-align: center;
}
.box2 {
  font-size: 2px;
  text-align: left;
}
.box3 {
  font-size: 3px;
  text-align: right;
}
```

## 6. Maps

`maps`는 `()`괄호 안에 키: 값의 형태로 저장하여 사용한다.
키와 값을 정의할때는 키는 고유해야 하지만 값은 중복 가능 하다. 변수를 각각 선언하는 대신 관련 변수들을 한번에 모아 `maps`로 만들어서 사용할수 있다.

#### METHODS

| Name           | 형식               | Description                                |
| -------------- | ------------------ | ------------------------------------------ |
| `map-get`      | `map-get(map,key)` | 키에 해당하는 값을 리턴하는 함수           |
| `map-key(map)` | `map-key(map)`     | map에 들어 있는 키(key) 전부 리턴하는 함수 |
| `map-value`    | `map-value(map)`   | map에 들어있는 값을 전부 리턴하는 함수     |

#### scss

```css
$fontSize: (
  "h1": 20px,
  "h2": 15px,
  "h3": 10px
);
.box {
  &1 {
    font-size: map-get($fontSize, h1);
  }
  &2 {
    font-size: map-get($fontSize, h2);
  }
  &3 {
    font-size: map-get($fontSize, h3);
  }
}
```

#### Compiled

```css
.box1 {
  font-size: 20px;
}
.box2 {
  font-size: 15px;
}
.box3 {
  font-size: 10px;
}
```

## 7. @mixin

`재사용이 가능한 스타일`을 정의하는데 사용되는 선언입니다. 스타일 정의 앞에 `@mixin`이 붙게 되면 해당 스타일 시트 내부에서 얼마든지 재사용이 가능합니다.

```css
@mixin reusable-style {
  color: red;
  margin: 0;
}
```

## 8. @include

`mixin을 사용하기 위해 선언하는 구문`입니다. 셀렉터를 지정하고 그 내부에 `@include`를 통해 `mixin`을 불러오면 됩니다.

#### scss

```css
div {
  @include resuable-style;
}
```

#### Compiled

```css
div {
  color: red;
  margin: 0;
}
```

## 9. @for

스타일을 반복적으로 출력합니다. `for 문과 유사`합니다.
`through`를 사용하는 형식과 `to`를 사용하는 형식으로 나뉩니다.
두 형식은 종료 조건이 해석되는 방식이 다릅니다.

#### 기본문법 :

```css
// through
// 종료 만큼 반복
@for $변수 from 시작 through 종료 {
  // 반복 내용
}
// to
// 종료 직전까지 반복
@for $변수 from 시작 to 종료 {
  // 반복 내용
}
```

#### scss

```css
// 1부터 3 까지 반복
@for $i from 1 through 3 {
  .box:nth-child(#{$i}) {
    width: 20px * $i;
  }
}
// 1부터 3 직전까지만 반복(2번 반복)
@for $i from 1 to 3 {
  .to:nth-child(#{$i}) {
    width: 20px * $i;
  }
}
```

#### Compiled

```css
// 1부터 3 까지 반복
.box.nth-child(1) {
  width: 20px;
}
.box.nth-child(2) {
  width: 40px;
}
.box.nth-child(3) {
  width: 60px;
}
// 1부터 3 직전까지만 반복(2번 반복)
.to:nth-child(1) {
  width: 20px;
}
.to:nth-child(2) {
  width: 40px;
}
```

## 10. @each

`List와 Map` 데이터를 반복할 때 사용합니다. `for in` 문과 유사합니다.

#### 기본문법 :

```css
// 배열을 each 하는 경우는 한 개의 변수가 필요합니다
@each $변수 in 데이터 {
  // 반복 내용
}
// Map 데이터를 반복할 경우 하나의 데이터에 두 개의 변수가 필요합니다
@each $key변수, $value변수 in 데이터 {
  // 반복 내용
}
```

#### scss

```css
$fruits: (apple, orange, banana, mango);
.fruits {
  @each $fruit in $fruits {
    li.#{$fruit} {
      background: url("/images/#{$fruit}.png");
    }
  }
}
@each $fruit, $country in $fruits-data {
  .box-#{$fruit} {
    background: url("/images/#{$country}.png");
  }
}
```

#### Compiled

```css
.fruits li.apple {
  background: url("/images/apple.png");
}
.fruits li.orange {
  background: url("/images/orange.png");
}
.fruits li.banana {
  background: url("/images/banana.png");
}
.fruits li.mango {
  background: url("/images/mango.png");
}
```

### Index 값이 필요한 경우

#### scss

```css
.fruits {
  @each $fruit in $fruits {
    $i: index($fruits, $fruit);
    li:nth-child(#{$i}) {
      left: 50px * $i;
    }
  }
}
```

#### Compiled

```css
.fruits li:nth-child(1) {
  left: 50px;
}
.fruits li:nth-child(2) {
  left: 100px;
}
.fruits li:nth-child(3) {
  left: 150px;
}
.fruits li:nth-child(4) {
  left: 200px;
}
```

### 동시에 여러 개의 List 데이터를 반복 처리하는 경우 단, 각 데이터의 Length가 같아야 함

#### scss

```css
$apple: (apple, korea);
$orange: (orange, china);
$banana: (banana, japan);
@each $fruit, $country in $apple, $orange, $banana {
  .box-#{$fruit} {
    background: url("/images/#{$country}.png");
  }
}
```

#### Compiled

```css
.box-apple {
  background: url("/images/korea.png");
}
.box-orange {
  background: url("/images/china.png");
}
.box-banana {
  background: url("/images/japan.png");
}
```

### Map 데이터를 반복할 경우

#### scss

```css
$fruits-data: (
  apple: korea,
  orange: china,
  banana: japan,
);
@each $fruit, $country in $fruits-data {
  .box-#{$fruit} {
    background: url("/images/#{$country}.png");
  }
}
```

#### Compiled

```css
.box-apple {
  background: url("/images/korea.png");
}
.box-orange {
  background: url("/images/china.png");
}
.box-banana {
  background: url("/images/japan.png");
}
```

## 11. @if(조건문)

조건에 따른 분기 처리가 가능하며, `if` 문(if statements)과 유사합니다. 같이 사용할 수 있는 지시어는 `@else if`, `@else`가 있습니다. 추가 지시어를 사용하면 좀 더 복잡한 조건문을 작성할 수 있습니다.

#### 기본문법 :

```css
// @if,@else
@if (조건) {
  /* 조건이 참일 때 구문 */
}
@if (조건) {
  /* 조건이 참일 때 구문 */
} @else {
  /* 조건이 거짓일 때 구문 */
}
// @if,@else if,@else
@if (조건1) {
  /* 조건1이 참일 때 구문 */
} @else if (조건2) {
  /* 조건2가 참일 때 구문 */
} @else {
  /* 모두 거짓일 때 구문 */
}
```

#### scss

```css
$checked: true;
.box {
  @if ($checked) {
    background: red;
  }
}
.pop {
  @if ($checked) {
    background: red;
  } @else {
    background: yellow;
  }
}
```

#### Compiled

```css
.box {
  background: red;
}
.pop {
  background: yellow;
}
```

### ()는 생략이 가능

#### scss

```css
$checked: true;
.box {
  @if $checked {
    background: red;
  }
}
.pop {
  @if $checked {
    background: red;
  } @else {
    background: yellow;
  }
}
```

#### Compiled

```css
.box {
  background: red;
}
.pop {
  background: yellow;
}
```

## 12. 연산(Operations)

`Sass`는 기본적인 연산(`Operations`) 기능을 지원합니다. 레이아웃 작업시 상황에 맞게 크기를 계산을 하거나 정해진 값을 나눠서 작성할 경우 유용합니다. 다음은 `Sass`에서 사용 가능한 연산자 종류 입니다.

#### 산술 연산자:

| 종류  | 설명   | 주의사항                             |
| :---: | ------ | ------------------------------------ |
|  `+`  | 더하기 |                                      |
|  `-`  | 빼기   |                                      |
| `\*`  | 곱하기 | 하나 이상의 값이 반드시 숫자(Number) |
| `/  ` | 나누기 | 오른쪽 값이 반드시 숫자(Number)      |
| `%  ` | 나머지 |                                      |

#### 비교 연산자:

| 종류  | 설명                            |
| :---: | ------------------------------- |
| `== ` | 동등                            |
| `!= ` | 부등                            |
| `<  ` | 대소 / 보다 작은                |
| `>  ` | 대소 / 보다 큰                  |
| `<= ` | 대소 및 동등 / 보다 작거나 같은 |
| `>= ` | 대소 및 동등 / 보다 크거나 같은 |
