<template>
  <p class="message" v-if="!this.isValidForm">📝 Заполните все поля:</p>
  <div class="message" v-else>
    <p v-if="actualDataInCockie">✅ Данные сохранены!</p>
    <div v-else>
      <p>🕐 Все поля заполнены, почти готово! Нажмите "Сохранить".</p>
      <p>Результат будет в cookie.</p>
    </div>
  </div>
  
  <form @submit="submitForm">
    <SelectElement 
      v-on:changedSelect="(data) => changedSelect(data)" v-for="(selectData, name, index) in selectList"
      :key="index" 
      :selectName=name 
      :actualDataInCockie="actualDataInCockie" 
      :selectData="(name != 'factory' && name != 'employee') ? selectData :
                   (name === 'factory') ? filteredFactory : filteredEmployee" :disabledValues="disabledValues">
    </SelectElement>
    <button type="submit">Сохранить</button>
  </form>
</template>

<script>
import cityJson from '../json/city.json';
import factoryJson from '../json/factory.json';
import employeeJson from '../json/employee.json';
import brigadeJson from '../json/brigade.json';
import scheduleJson from '../json/schedule.json';

import SelectElement from './selectElement.vue';

export default {
  name: 'formSelects',
  components: { SelectElement },
  data() {
    return {
      selectList: {},
      selectedValues: {},
      disabledValues: ['factory', 'employee'],

      actualDataInCockie: false,

      filteredFactory: {},
      filteredEmployee: {},
    }
  },
  methods: {
    saveCookie(key, value) {
      document.cookie = `${key} = ${JSON.stringify(value)}; path=/; samesite=Lax`;
      this.actualDataInCockie = true;
    },
    submitForm(event) {
      event.preventDefault()

      if (this.isValidForm)
        for (const [key, value] of Object.entries(this.selectedValues)) {
          this.saveCookie(key, value);
        }
    },
    filterData(Data, firstFieldName, secondFieldValue) {
      return Data.filter(function (option) {
        return option[firstFieldName] === secondFieldValue;
      })
    },

    isEmptyObject(value) {
      return Object.keys(value).length === 0 && value.constructor === Object;
    },
    changedSelect(data) {
      this.actualDataInCockie = false;

      let currentSelectName = Object.keys(data)[0];
      let currentSelectValue = data[currentSelectName];

      this.selectedValues[currentSelectName] = currentSelectValue

      if (currentSelectName == 'city') {
        this.filteredFactory = this.filterData(this.selectList.factory, 'city', currentSelectValue.name)

        this.disabledValues = ['employee']
        this.selectedValues.factory = "";
        this.selectedValues.employee = "";

      } else if (currentSelectName == 'factory') {
        this.filteredEmployee = this.filterData(this.selectList.employee, 'factory', currentSelectValue.code)

        this.disabledValues = []
        this.selectedValues.employee = "";
      }
    },
    getData() {
      let city = JSON.parse(JSON.stringify(cityJson));
      let factory = JSON.parse(JSON.stringify(factoryJson));
      let employee = JSON.parse(JSON.stringify(employeeJson));
      let brigade = JSON.parse(JSON.stringify(brigadeJson));
      let schedule = JSON.parse(JSON.stringify(scheduleJson));

      this.selectList.city = city;
      this.selectList.factory = factory;
      this.selectList.employee = employee;
      this.selectList.brigade = brigade;
      this.selectList.schedule = schedule;
    },
  },
  computed: {
    isValidForm: function () {
      let everyFull = false;

      const full = Object.keys(this.selectedValues).length === 5;

      for (let item in this.selectedValues) {
        everyFull = true;
        if (this.selectedValues[item].length === 0) {
          everyFull = false;
          break;
        }
      }

      return full && everyFull;
    },
  },
  created() {
    this.getData()
  }
}
</script>

<style>

.message {
  min-width: 90%;
  height: 85px;
  color:cornflowerblue;

  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  background-color: aliceblue;
  margin: 0;

  border-radius: 10px 10px 0 0;
}

.message > p {
  margin: 0;
}

button {
  transition: 0.2s all;
}
button {
  width: 300px;
  max-height: 300px;

  margin-top: 15px;
  margin-left: auto;

  background-color: var(--btn-color-1);
  border: none;
  outline: none;
  border-radius: 5px;
  color: black;
  padding: 16px;
  text-align: center;
}

button:hover {
  border: none;
  background-color: var(--btn-color-2);
}

button:active {
  border: none;
  outline: none;
  background-color: var(--btn-color-3);
}

</style>
