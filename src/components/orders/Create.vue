<script>
import axios from 'axios';

export default {
  name: 'CreateOrders',
  data() {
    return {
      order: {
        name: ''
      },
    };
  },
  created() {
    this.fetchSuppliers();
  },
  methods: {
    fetchSuppliers() {
      axios.get('https://codechallenge.pikdrive.com/api/suppliers').then(({data}) => {
        this.orders = data.data;
      })
    }
  }

}
</script>
<template>
  <div class="col-12 d-flex justify-content-between mt-2">
      <label class="h2">New Order</label>
      <div class="btn-toolbar">
        <router-link to="/orders" class="btn btn-sm btn-outline-secondary">Order List</router-link>
      </div>
  </div>
  <div class="col-12">
    <div class="flex flex-row">
      <div class="table-responsive">
        <form>
          //data
        </form>
      </div>
    </div>
  </div>

</template>
<style>

</style>