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
