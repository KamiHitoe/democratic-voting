<template>
  <main>
    <h3>show contacts below</h3>
    <div v-for="(contact, index) in contacts" :key="contact.id">
      <p>{{contact.name}} is my {{contact.age}}</p>
    </div>
  </main>
</template>

<script lang="ts">
import Vue from 'vue'
import axios from 'axios'

export default Vue.extend({
  data() {
    return {
      contacts: [],
      name: [],
      age: [],
      errors: [],
    }
  },
  created() {
    axios.get('http://localhost:3000/contacts')
    .then(res => {
      console.log(res.data);
      this.contacts = res.data;
    })
    .catch((e) => {
      this.errors.push(e);
      console.log(this.errors);
    })
  }
})
</script>

<style lang="scss" scoped>
.jump {
  background: pink;
  &:hover {
    background: green;
  }
}

</style>
