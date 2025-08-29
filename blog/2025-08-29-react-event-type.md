---
slug: react-event-type
title: Type script 이벤트 타입 모음
authors: sub-s
tags: [hello, docusaurus]
---

# Type script 이벤트 타입 모음

## 상태 관리

#### 숫자 상태 관리 (초기값: 0)

```javascript
const [count, setCount] = useState < number > 0;
```

#### 문자열 상태 관리 (초기값: null, null 허용)

```javascript
const [text, setText] = (useState < string) | (null > null);
```

#### 불리언 상태 관리 (초기값: false)

```javascript
const [isActive, setIsActive] = useState < boolean > false;
```

#### 배열 상태 관리

```javascript
// 숫자 배열
const [items, setItems] = useState<number[]>([]);
// 문자열 배열
const [names, setNames] = useState<string[]>([]);
```

#### 초기값 없이 상태 선언

```javascript
const [data, setData] = useState<number | undefined>(undefined>);
```

#### 상태 값이 여러개 일 경우

```javascript
const [data, setData] = (useState < string) | (number > ""); // 문자열 또는 숫자
setData(42); // 숫자로 업데이트 가능
setData("Hello"); // 문자열로 업데이트 가능
```

#### useRef 이벤트 예시

```javascript
const inputRef = useRef < HTMLInputElement > null;
const wrapper = useRef < HTMLDivElement > null;
```

---

## interface

### 사용예시

```javascript
interface ComponentProps {
  Kye?: string;
  Key?: number;
  Key?: boolean;
  Key?: "left" | "right";
  Key?: string | undefined;
  setChecked: (value: boolean) => void;
  onChange: (e: React.ChangeEvent<HTMLInputElement>) => void;
}

export default function CheckBox(props: ComponentProps) {
  const {...key} = props;
  return ();
}
```

---

## Event 관리

### 사용 예시

```javascript
const handleDrag = (event: React.DragEvent<HTMLDivElement>) => {
  console.log("Dragging", event.currentTarget);
};
```

#### 폼 이벤트

```javascript
event: React.FormEvent<HTMLFormElement>
```

#### 변경 이벤트

```javascript
event: React.ChangeEvent<HTMLInputElement>
event: React.ChangeEvent<HTMLSelectElement>
event: React.ChangeEvent<HTMLTextAreaElement>
```

#### 클릭 이벤트

```javascript
event: React.MouseEvent<HTMLButtonElement>
event: React.MouseEvent<HTMLDivElement>
event: React.MouseEvent<HTMLAnchorElement>
```

#### 키보드 이벤트

```javascript
event: React.KeyboardEvent<HTMLInputElement>
event: React.KeyboardEvent<HTMLTextAreaElement>
```

#### 마우스 이벤트

```javascript
event: React.MouseEvent<HTMLDivElement>
event: React.MouseEvent<HTMLSpanElement>
```

#### 포커스 이벤트

```javascript
event: React.FocusEvent<HTMLInputElement>
event: React.FocusEvent<HTMLTextAreaElement>
```

#### 드래그 이벤트

```javascript
event: React.DragEvent<HTMLDivElement>
event: React.DragEvent<HTMLImageElement>
```

#### 서브미션 이벤트

```javascript
event: React.FormEvent<HTMLFormElement>
```

#### 입력 이벤트

```javascript
event: React.InputEvent<HTMLInputElement>
```

#### 스크롤 이벤트

```javascript
event: React.UIEvent<HTMLDivElement>
```

#### 터치 이벤트

```javascript
event: React.TouchEvent<HTMLDivElement>
```

#### 휠 이벤트

```javascript
event: React.WheelEvent<HTMLDivElement>
```
