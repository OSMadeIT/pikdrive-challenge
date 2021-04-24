<script>
import axios from "axios";
import { Field, Form } from "vee-validate";

export default {
  name: "CreateProducts",
  components: {
    Field,
    Form,
    // ErrorMessage,
  },
  data() {
    return {
      product: {
        name: null,
        product_id: "10",
      },
    };
  },
  methods: {
    onSubmit() {
      axios
        .post(
          "https://codechallenge.pikdrive.com/api/new-product",
          this.product
        )
        .then((data) => {
          console.log(data);
        });
    },
    isRequired(value) {
      return value ? true : "This field is required";
    },
  },
};
</script>
<template>
  <div class="col-12 d-flex justify-content-between mt-2">
    <label class="h2">New Product</label>
    <div class="btn-toolbar">
      <router-link to="/products" class="btn btn-sm btn-outline-secondary"
        >Products</router-link
      >
    </div>
  </div>
  <div class="col-12">
    <div class="flex flex-row">
      <Form v-slot="{ errors }" @submit="onSubmit">
        <div class="col-4"></div>
        <div class="mb-3 row">
          <label for="staticEmail" class="col-sm-1 col-form-label">Name</label>
          <div class="col-sm-5">
            <Field
              type="text"
              class="form-control"
              v-model="product.name"
              name="productname"
              :rules="isRequired"
              placeholder="Product Name"
            />
            <span>{{ errors.productname }}</span>
          </div>
          <label for="inputPassword" class="col-sm-1 col-form-label"
            >Description</label
          >
          <div class="col-sm-5">
            <Field
              type="text"
              class="form-control"
              v-model="product.description"
              name="productdescription"
              :rules="isRequired"
              placeholder="Product Description"
            />
            <span>{{ errors.productdescription }}</span>
          </div>
        </div>
        <div class="my-2">
          <button type="submit" class="btn btn-sm btn-primary float-end">
            Add product
          </button>
        </div>
      </Form>
    </div>
  </div>
</template>
<style></style>
