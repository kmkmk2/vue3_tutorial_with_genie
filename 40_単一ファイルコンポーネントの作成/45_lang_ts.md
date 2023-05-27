# 45_lang_ts

Vue 3において、TypeScriptを使用する場合には、`<script>`タグに`lang="ts"`属性を追加することで、以下のような利点が得られます。

1. 型チェック: TypeScriptは強力な静的型付けを提供しているため、コンパイル時に発生するエラーを事前に把握することができます。これにより、ランタイムエラーを減らすことができます。

2. IDEサポート: `<script lang="ts">`を使用するとIDEがより効果的に補完や型情報を提供してくれます。特に、VS CodeなどのTypeScriptに対応したエディタでは非常に優れた補完機能を提供しています。

3. 無料のAPIドキュメント: TypeScriptを使用すると、Vueコンポーネント内で使用できるprops、data、computed、methods、およびemitされたイベントに関するドキュメントを自動的に生成できます。

4. 変数バインディング: TypeScriptは変数バインディングに役立つアノテーションを提供します。これにより、プロパティのミスマッチや型変更によるバグを防止することができます。

5. コードメンテナンス: TypeScriptを使用することで、大規模なVueアプリケーションでもコードの保守性を高めることができます。不適切な変更によるエラーやコンポーネントの相互作用に起因するエラーを防ぐことができます。

これらの利点から、Vue 3のTypeScript補完のサポートが強化されており、`<script lang="ts">`を使用することが推奨されています。

## src/components/atoms/vCard.vue

<!-- 以下のvue3のコードについて、scriptタグにlang="ts"をつけて書き直してください。 -->

```html
<template>
  <div class="card">
    <img :src="props.image" alt="card image" />
    <h3>{{ props.title }}</h3>
    <p>{{ props.description }}</p>
  </div>
</template>

<script lang="ts" setup>
import { defineProps } from 'vue';

interface Props {
  title: string;
  description: string;
  image: string;
}

const props = defineProps<Props>();

// 以下の書き方は、必須かどうかを示したい場合
// const props = defineProps<Props>({
//   title: {
//     type: String,
//     required: true,
//   },
//   description: {
//     type: String,
//     required: true,
//   },
//   image: {
//     type: String,
//     required: true,
//   },
// });
</script>

<style scoped>
.card {
  border: 1px solid #ddd;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  padding: 10px;
  text-align: center;
}

.card img {
  max-width: 100%;
}
</style>
```

上記のように、`<script>`タグに`lang="ts"`を指定して、TypeScriptを使用することができます。また、`Props`というインターフェースを使い、コンポーネントのプロパティの型を定義しました。最後に、`defineProps`関数の呼び出し時に、定義した`Props`型をジェネリックスとして渡すことで、型安全性を確保しています。

## src/components/atoms/vButton.vue

以下が、`lang="ts"` を追加したVue 3コンポーネントの書き方になります。

```html
<template>
  <button class="btn" @click="handleClick">{{ props.label }}</button>
</template>

<script setup lang="ts">
import { defineProps, defineEmits } from 'vue';

interface Props {
  label: string;
}

const props = defineProps<Props>();

// 以下の書き方は、必須かどうかを示したい場合
// const props = defineProps<Props>({
//   label: {
//     type: String,
//     required: true,
//   },
// });

const emits = defineEmits(['click']);

function handleClick() {
  emits('click');
}
</script>

<style scoped>
.btn {
  background-color: #337ab7;
  border-color: #2e6da4;
  color: #fff;
  cursor: pointer;
  font-size: 16px;
  padding: 6px 12px;
  text-align: center;
  text-decoration: none;
  vertical-align: middle;
  white-space: nowrap;
  user-select: none;
  border-radius: 5px;
}

.btn:hover {
  background-color: #286090;
  border-color: #204d74;
}
</style>
```

上記コードでは、以下の点に変更が加えられています。

1. `script` タグに `lang="ts"` 属性を追加し、TypeScriptで書かれたコードであることを明示しています。
2. `props` の型を `interface` 構文で定義しました。また、`defineProps` に渡す型引数にも `Props` を指定し、厳密な型チェックが有効となるようにしています。
3. `props` の定義にあるオプションについて、TypeScriptの構文に合わせて修正しています。
4. `emits` の定義は変更されていませんが、 `@click` イベントの呼び出し時の引数型チェックが有効となっています。

## src/components/molecules/CardList.vue

```typescript
<template>
  <div class="card-list">
    <SearchBox @search="onSearch" />
    <div class="card-grid">
      <Card v-for="card in filteredCards" :key="card.id" :title="card.title" :description="card.description" :image="card.image" />
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue';
import Card from '@/components/atoms/vCard.vue';
import SearchBox from '@/components/molecules/SearchBox.vue';

const searchText = ref('');
const cards = [
  {
    id: 1,
    title: 'Card 1',
    description: 'Description for card 1.',
    image: 'https://picsum.photos/id/237/200/300',
  },
  {
    id: 2,
    title: 'Card 2',
    description: 'Description for card 2.',
    image: 'https://picsum.photos/id/238/200/300',
  },
  {
    id: 3,
    title: 'Card 3',
    description: 'Description for card 3.',
    image: 'https://picsum.photos/id/239/200/300',
  },
];

function onSearch(s_searchText: string) {
  searchText.value = s_searchText;
}

const filteredCards = computed(() => {
  if (searchText.value) {
    return cards.filter((card) => {
      return (
        card.title.toLowerCase().includes(searchText.value.toLowerCase()) ||
        card.description.toLowerCase().includes(searchText.value.toLowerCase())
      );
    });
  } else {
    return cards;
  }
});
</script>

<style scoped>
.card-list {
  max-width: 700px;
  margin: auto;
  text-align: center;
}

.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  grid-gap: 20px;
}
</style>
```

修正したのは、以下の二行です。

```typescript
<script setup lang="ts">

function onSearch(searchText: string) {
```

## src/components/molecules/SearchBox.vue

```typescript
<template>
  <div class="search-box">
    <input type="text" :value="searchText" @input="onInput" placeholder="Search..." />
    <Button label="Search" @click="onSearch" />
  </div>
</template>

<script setup lang="ts">
import { ref, defineEmits } from 'vue';
import Button from '@/components/atoms/vButton.vue';

const emit = defineEmits(['search']);
const searchText = ref('');

function onInput(event: Event) {
  searchText.value = (event.target as HTMLInputElement).value;
}

function onSearch() {
  emit('search', searchText.value);
}
</script>

<style scoped>
.search-box {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
}

.search-box input {
  border-radius: 5px;
  border: none;
  box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 2px;
  height: 36px;
  padding: 6px;
  width: 70%;
}
</style>
```

変更点は以下の通りです。

- `lang` 属性に `ts` を指定しました。
- `emit`関数をインポートして、`onSearch` 関数内で `emit` 関数を呼び出すように修正しました。このため、SearchBoxコンポーネントで 'search' イベントを発行することができます。
- `onInput` 関数のパラメータを型付けしました。
- 添字演算子を使った型キャストを使用して、イベントオブジェクト内の `value` プロパティにアクセスするように変更しました。

## src/components/organisms/AppShell.vue

```typescript
<template>
  <div>
    <header class="app-header">
      <h1>Vue Card App</h1>
    </header>
    <main class="app-main">
      <CardList />
    </main>
  </div>
</template>

<script setup lang="ts">
import CardList from '@/components/molecules/CardList.vue';
</script>

<style scoped>
.app-header {
  background-color: #3f51b5;
  color: #fff;
  padding: 20px;
  text-align: center;
}

.app-header h1 {
  margin: 0;
}

.app-main {
  padding: 20px;
}
</style>
```

修正したのは、以下の一行です。

```typescript
<script setup lang="ts">
```
