<template>
  <form @submit="submitForm($event)">

    <select 
      v-model="selectedCity" 
      @change="onChangeCity"
      :disabled="hierarchicalData.city.length ? false : true">
      <option v-for="(cityItem, index) in hierarchicalData.city" :key="index" :value="JSON.stringify({index: index, value: cleanObj(cityItem)})">
        {{ cleanObj(cityItem) }} 
      </option>
      <!-- cityItem, inde, data -->
    </select>

    <p>{{ selectedCity }}</p>
    <p>{{ hierarchicalData.city }}</p>
    <p>{{ data.city }}</p>

    <select 
      v-model="selectedFactory" @change="onChangeFactory" 
      :disabled="hierarchicalData.factory.length  ? false : true">
      <option v-for="(factoryItem, index) in hierarchicalData.factory" :key="factoryItem.id" :value="JSON.stringify({index: index, value: data.city[factoryItem.id]})">
        {{ factoryItem.code }}
      </option>
    </select>

    <p>{{ selectedFactory }}</p>
    <p>{{ hierarchicalData.factory }}</p>

    <select 
      v-model="selectedEmployee" 
      :disabled="data.employee.length  ? false : true">
      <option v-for="(employeeItem, index) in hierarchicalData.employee" :key="employeeItem.id" :value="JSON.stringify({index: index, value: data.city[employeeItem.id]})">
        {{ `${employeeItem.last_name} ${employeeItem.name} ${employeeItem.middle_name}` }}
      </option>
    </select>

    <p>{{ selectedEmployee }}</p>
    <p>{{ hierarchicalData.employee }}</p>

    <select 
      v-model="selectedBrigade">
      <option v-for="(brigadeItem, index) in hierarchicalData.brigade" :key="brigadeItem.id" :value="JSON.stringify({index: index, value: data.city[brigadeItem.id]})">
        {{ brigadeItem.code }}
      </option>
    </select>

    <p>{{ selectedBrigade }}</p>
    <p>{{ hierarchicalData.brigade }}</p>

    <select 
      v-model="selectedTurn">
      <option v-for="(turnItem, index) in hierarchicalData.turn" :key="turnItem.id" :value="JSON.stringify({index: index, value: data.city[turnItem.id]})">
        {{ turnItem.type }}
      </option>
    </select>

    <p>{{ selectedTurn }}</p>
    <p>{{ hierarchicalData.turn }}</p>

    <button type="submit">Сохранить</button>

  </form>
</template>

<script>
import cityJson from './json/city.json';
import factoryJson from './json/factory.json';
import employeeJson from './json/employee.json';
import brigadeJson from './json/brigade.json';
import turnJson from './json/schedule.json';

export default {
  name: 'App',
  components: {},
  data() {
    return {

      data: {},
      hierarchicalData: {},

      // selected: {
      //   city: '',
      //   factory: '',
      //   employee: '',
      //   brigade: '',
      //   turn: ''
      // },

      selectedCity: '',
      selectedFactory: '',
      selectedEmployee: '',
      selectedBrigade: '',
      selectedTurn: '',
    }
  },
  methods: {
    submitForm(event) {
      event.preventDefault()
      console.log(typeof this.hierarchicalData.factory)
      console.log('submit', JSON.parse(this.selectedCity), this.selectedFactory, this.selectedEmployee, this.selectedBrigade, this.selectedTurn )
    },
    onChangeCity: function () {
      this.selectedFactory = '';
      let valueCity = JSON.parse(this.selectedCity);
      this.hierarchicalData.factory = this.hierarchicalData.city[valueCity.index].options;

      this.hierarchicalData.employee = []

      this.selectedEmployee = ''
      this.selectedBrigade = ''
      this.selectedTurn = ''

      // this.selectedCarName = this.cars[this.selectedCar].name;
    },
    onChangeFactory: function () {
      this.selectedEmployee = '';
      let valueFactory = JSON.parse(this.selectedFactory);
      this.hierarchicalData.employee = this.hierarchicalData.factory[valueFactory.index].options;
    },

    // установить иерархию зависимых данных (родительский элемент, дочерний элемент, 
    // поле родительского и поле дочернего по которому идет сопоставление)
    setDependence(parentData, childData, parentField, childField) {
      for (const parentItem of parentData) {
        let filteredСhildItems = childData.filter(function (item) {
          return parentItem[parentField] === item[childField];
        })
        parentItem.options = filteredСhildItems;
      }
    },
    getCopyObj(...obj){
      const objCopy = {};
      Object.assign(objCopy, obj)
      console.log(objCopy);
      return objCopy;
    },

    cleanObj(obj) {
      const copyObj = this.getCopyObj(obj);
      console.log(copyObj);
      delete copyObj.options;
      return copyObj;
    },


    getData() {
      // загрузка данных таблиц из JSON
      let city = JSON.parse(JSON.stringify(cityJson));
      let factory = JSON.parse(JSON.stringify(factoryJson));
      let employee = JSON.parse(JSON.stringify(employeeJson));
      let brigade = JSON.parse(JSON.stringify(brigadeJson));
      let turn = JSON.parse(JSON.stringify(turnJson));

      // this.data.city = this.getCopyObj(city);
      // this.data.factory = this.getCopyObj(factory);
      // this.data.employee = this.getCopyObj(employee);
      // this.data.brigade = this.getCopyObj(brigade);
      // this.data.turn = this.getCopyObj(turn);

      this.data.city = this.getCopyObj(city);
      this.data.factory = this.getCopyObj(factory);
      this.data.employee = this.getCopyObj(employee);
      this.data.brigade = this.getCopyObj(brigade);
      this.data.turn = this.getCopyObj(turn);

      // связывание зависимых данных в единое свойство город - со вложенными опциями
      this.setDependence(factory, employee, 'code', 'factory')
      this.setDependence(city, factory, 'name', 'city')


      // установка свойств в изначально доступные селекты
      this.hierarchicalData.city = city;
      this.hierarchicalData.factory = [];
      this.hierarchicalData.employee = [];
      this.hierarchicalData.brigade = brigade;
      this.hierarchicalData.turn = turn;

      console.log(this.data)
    },
  },
  computed: {

  },
  created() {
    this.getData()
  }
}
</script>

<style>
body {
  margin: 0;
  background-color: #2c3e50;
}

select {
  width: 300px;
  ;
}

#app {
  display: flex;
  flex-direction: column;
  align-items: center;
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  margin-top: 60px;
}

form {
  display: flex;
  flex-direction: column;
  align-items: center;
  max-width: 1000px;
}
</style>
