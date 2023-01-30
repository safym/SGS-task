<template>
  <div class="row">
    <p>{{ title }}</p>
    <select v-model="selectedValue" v-on:change="changedSelect" :disabled="isDisable">
      <option v-for="item in selectData" :key="item" :value="item">
        {{ isDisable? '': displayedTextFields.reduce((fullText, currentPart) => fullText + " " + item[currentPart], "") }}
      </option>
    </select>
  </div>
</template>

<script>

export default {
  name: 'SelectElement',
  components: {},
  emits: ['changedSelect'],
  props: {
    selectName: String,
    selectData: Object,
    disabledValues: Array,
  },
  data() {
    return {
      selectedValue: '',
    }
  },

  methods: {
    changedSelect(event) {
      event.preventDefault()
      if (this.selectedValue) {
        this.$emit('changedSelect', { [this.selectName]: this.selectedValue })
      } else this.selectedValue = ''
    }
  },
  computed: {
    title: function () {
      if (this.selectName === 'city') {
        return "Выберите город";
      } else if (this.selectName === 'factory') {
        return "Выберите цех";
      } else if (this.selectName === 'employee') {
        return "Выберите сотрудника";
      } else if (this.selectName === 'brigade') {
        return "Выберите бригаду";
      } else if (this.selectName === 'schedule') {
        return "Выберите смену";
      } return ""
    },
    displayedTextFields: function () {
      if (this.selectName === 'city') {
        return ['name'];
      } else if (this.selectName === 'employee') {
        return ['last_name', 'name', 'middle_name'];
      } else if (this.selectName === 'schedule') {
        return ['type'];
      } else {
        return ['code'];
      }
    },
    isDisable: function () {
      return this.disabledValues.includes(this.selectName)
    }
  },
}
</script>

<style scoped>
.row {
  width: 100%;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
}

.row > p {
  color:rgb(77, 77, 77);
}

select {
  width: 300px;
  vertical-align: middle;
  cursor: pointer;
  height: 30px;
  line-height: 30px;
  padding: 0 45px 0 10px;
}

</style>
