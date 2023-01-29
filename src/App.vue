<template>
  <FormSelects />
</template>

<script>

import FormSelects from './components/formSelects.vue';

export default {
  name: 'App',
  components: { FormSelects },
  data() {
    return {
    }
  }
}
</script>

<style>
:root {
  --text-color: #2f2f2f;
  --btn-color-1:  #cbe9d3;
  --btn-color-2: #b1d2cf;
  --btn-color-3: #93c5c0;
}

* {
  box-sizing: border-box;
  font-size: 16px;
}

body {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0;
  margin-top: 100px;
}

#app {
  min-width: 700px;

  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  font-family: Avenir, Helvetica, Arial, sans-serif;
  text-align: center;
}

form {
  display: flex;
  flex-direction: column;
  align-items: center;
  align-content: space-between;
  justify-content: space-between;
  width: 90%;
  padding: 30px;
  border-radius: 0 0  10px 10px;
  box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
}
</style>
