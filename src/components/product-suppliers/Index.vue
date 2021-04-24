<script>
import axios from 'axios';
import moment from "moment";

export default {
  name: 'ReportsIndex',
  data() {
    return {
      productSuppliers: [],
      moment: moment,
    };
  },
  created() {
    this.fetchProductSuppliers();
  },

  methods: {
    
    fetchProductSuppliers() {
       axios.get('https://codechallenge.pikdrive.com/api/product-suppliers').then(({data}) => {
         this.productSuppliers = data.data;
       })
    }
  }
}
</script>
<template>
 <div class="col-12 d-flex justify-content-between mt-2">
      <label class="h2">Product Suppliers</label>
  </div>
  <div class="col-12">
    <div class="flex flex-row">
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th>#</th>
              <th>Name</th>
              <th>Product ID</th>
              <th>Supplier ID</th>
              <th>Created At</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="productSupplier in productSuppliers" :key="productSupplier.id">
              <td>{{ productSupplier.id }}</td>
              <td>{{ productSupplier.name }}</td>
              <td>{{ productSupplier.product_id }}</td>
              <td>{{ productSupplier.supplier_id }}</td>
              <td>{{ moment(productSupplier.created_at).format("DD-MM-YYYY hh:mm:ss") }}</td>
            </tr>
         
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<style>

</style>