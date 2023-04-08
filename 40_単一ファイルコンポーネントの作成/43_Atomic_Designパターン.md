
# Atomic Designパターン
<!-- vue3のアプリケーションの実装について学んでいます。Atomic Designパターンで実装されたサンプルアプリケーションを具体的なコードと一緒に教えてください。markdown形式で出力してください。 -->

## シンプルなカード表示アプリケーション

以下は、Vue.js 3でAtomic Designパターンを適用した、シンプルなカード表示アプリケーションのサンプルコードです。

### ディレクトリ構造

<!-- ```text
src/
├── components/
|   ├── atoms/
|   |   ├── Card.vue
|   |   └── Button.vue
|   ├── molecules/
|   |   ├── CardList.vue
|   |   └── SearchBox.vue
|   └── organisms/
|       └── AppShell.vue
└── main.js
``` -->

<!-- 筆者注：ディレクトリ全体の構成がないため加筆 -->
<!-- 筆者注：元々はCard.vue、Button.vueだったが、eslintで引っかかるため、vCard.vue、vButton.vueに修正 -->

```text
my-project/
├── public/
│   ├── index.html
│   └── favicon.ico
└── src/
    ├── components/
    |   ├── atoms/
    |   |   ├── vCard.vue
    |   |   └── vButton.vue
    |   ├── molecules/
    |   |   ├── CardList.vue
    |   |   └── SearchBox.vue
    |   └── organisms/
    |       └── AppShell.vue
    └── main.js
```

- `atoms`：最も小さな単位となるコンポーネント群。一般に再利用頻度が高く、UIにおける最も基本的なパーツを担当します。
- `molecules`：複数のアトムを結合して1つの機能を実現するコンポーネント群。少し大きなセットを表現するコンポーネントです。
- `organisms`：複数の分子を含んだコンポーネント群。独自のページまたは部分を提供し、完全なユーザビリティを確保します。

### src/components/atoms/vCard.vue

```html
<template>
  <div class="card">
    <img :src="image" alt="card image" />
    <h3>{{ title }}</h3>
    <p>{{ description }}</p>
  </div>
</template>

<script>
export default {
  props: {
    title: {
      type: String,
      required: true,
    },
    description: {
      type: String,
      required: true,
    },
    image: {
      type: String,
      required: true,
    },
  },
};
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

`vCard.vue` はアトムの一例で、カードとして表現される画像、タイトル、説明を受け取ります。

### src/components/atoms/vButton.vue

```html
<template>
  <button class="btn" @click="$emit('click')">{{ label }}</button>
</template>

<script>
export default {
  props: {
    label: {
      type: String,
      required: true,
    },
  },
};
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

  &:hover {
    background-color: #286090;
    border-color: #204d74;
  }
}
</style>
```

`vButton.vue` はアトムの一例で、ラベルを受け取ってボタンを表示します。

### src/components/molecules/CardList.vue

```html
<template>
  <div class="card-list">
    <SearchBox @search="onSearch" />
    <div class="card-grid">
      <Card v-for="card in filteredCards" :key="card.id" :title="card.title" :description="card.description" :image="card.image" />
    </div>
  </div>
</template>

<script>
import Card from '@/components/atoms/vCard.vue';
import SearchBox from '@/components/molecules/SearchBox.vue';

export default {
  components: {
    Card,
    SearchBox,
  },
  data() {
    return {
      searchText: '',
      cards: [
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
      ],
    };
  },
  computed: {
    filteredCards() {
      if (this.searchText) {
        return this.cards.filter((card) => {
          return (
            card.title.toLowerCase().includes(this.searchText.toLowerCase()) ||
            card.description.toLowerCase().includes(this.searchText.toLowerCase())
          );
        });
      } else {
        return this.cards;
      }
    },
  },
  methods: {
    onSearch(searchText) {
      this.searchText = searchText;
    },
  },
};
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

`CardList.vue` は、複数のカードを受け取り、検索ボックスで結果をフィルタリングする分子の一例です。ここでは、`SearchBox` と `vCard` のアトムを使ってコンポーネントを構築しています。

### src/components/molecules/SearchBox.vue

```html
<template>
  <div class="search-box">
    <input type="text" :value="searchText" @input="onInput" placeholder="Search..." />
    <Button label="Search" @click="onSearch" />
  </div>
</template>

<script>
import Button from '@/components/atoms/vButton.vue';

export default {
  components: {
    Button,
  },
  data() {
    return {
      searchText: '',
    };
  },
  methods: {
    onInput(event) {
      this.searchText = event.target.value;
    },
    onSearch() {
      this.$emit('search', this.searchText);
    },
  },
};
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

`SearchBox.vue` は分子の一例で、検索ボックスと検索ボタンを含んでいます。

### src/components/organisms/AppShell.vue

```html
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

<script>
import CardList from '@/components/molecules/CardList.vue';

export default {
  components: {
    CardList,
  },
};
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

最後に、`AppShell.vue` は `CardList` 分子を表示するためのクラスです。ヘッダーとメイン部分を定義しています。

### src/main.js
<!-- 筆者注：main.jsとindex.htmlの記載がないため、追加 -->

```javascript
import { createApp } from 'vue'
import AppShell from './components/organisms/AppShell.vue'

createApp(AppShell).mount('#app')
```

### public/index.html

```html
<!DOCTYPE html>
<html lang="">
  <head>
    <meta charset="utf-8">
    <title>Vue Card App</title>
  </head>
  <body>
    <div id="app"></div>
    <script src="https://unpkg.com/vue@next"></script>
    <script src="main.js"></script>
  </body>
</html>
```

以上で、Atomic Designパターンを適用した、シンプルなVue.js 3アプリケーションのサンプルコードが完成します。
