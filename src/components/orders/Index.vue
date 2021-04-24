<script>
import axios from 'axios';

export default {
  name: 'OrdersIndex',
  data() {
    return {
      orders: [],
    };
  },
  created() {
    this.fetchOrders();
  },
  methods: {
    fetchOrders() {
      axios.get('https://codechallenge.pikdrive.com/api/orders').then(({data}) => {
        this.orders = data.data;
      })
    },
    deleteOrders(order) {
      axios.post('https://codechallenge.pikdrive.com/api/delete-order', {id: order.id}).then(() => {
        // this.orders = this.orders.filter(item => item.id != order.id);//
        this.fetchOrders();
      })

    }
  }

}
</script>
<template>
  <div class="col-12 d-flex justify-content-between mt-2">
      <label class="h2">Orders</label>
      <div class="btn-toolbar mb-2 mb-md-0">
        <router-link to="/orders/create" class="btn btn-sm btn-outline-secondary">Create an Order</router-link>
      </div>
  </div>
  <div class="col-12">
    <div class="flex flex-row">
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th>Order Number</th>
              <th>Count</th>
              <th>Create At</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="order in orders" :key="order.id">
              <td>{{ order.orderNumber }}</td>
              <td>{{ order.count }}</td>
              <td>{{ order.created_at}}</td>
              <td>
                <button class="btn btn-sm btn-danger" @click="() => deleteOrders(order)">Delete</button>
              </td>
            </tr>
         
          </tbody>
        </table>
      </div>
    </div>
  </div>

</template>
<style>

</style>