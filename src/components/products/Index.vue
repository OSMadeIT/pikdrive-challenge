<script>
import axios from 'axios';
export default {
  name: 'ProductsIndex',
  data() {
    return {
      products: [],
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
              <td>{{ product.created_at}}</td>
            </tr>
         
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<style>

</style>