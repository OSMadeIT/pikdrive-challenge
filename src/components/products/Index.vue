<script>
import axios from 'axios';
import moment from 'moment';

export default {
  name: 'ProductsIndex',
  data() {
    return {
      products: [],
      moment: moment,
    };
  },
  created() {
    this.fetchProducts();
  },

  methods: {
    
    fetchProducts() {
       axios.get('https://codechallenge.pikdrive.com/api/products').then(({data}) => {
         this.products = data.data;
       })
    }
  }
}
</script>
<template>
 <div class="col-12 d-flex justify-content-between mt-2">
      <label class="h2">Products</label>      
      <div class="btn-toolbar">
        <router-link to="/products/create" class="btn btn-sm btn-outline-secondary">Add Product</router-link>
      </div>
  </div>
  <div class="col-12">
    <div class="flex flex-row">
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th>#</th>
              <th>Name</th>
              <th>Description</th>
              <th>Quantity</th>
              <th>Create At</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="product in products" :key="product.id">
              <td>{{ product.id }}</td>
              <td>{{ product.name }}</td>
              <td>{{ product.description}}</td>
              <td>{{ product.quantity}}</td>
              <td>{{ moment(product.created_at).format("DD-MM-YYYY hh:mm:ss") }}</td>
            </tr>
         
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<style>

</style>