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
