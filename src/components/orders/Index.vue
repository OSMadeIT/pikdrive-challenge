<script>
import axios from "axios";
import moment from "moment";

export default {
  name: "OrdersIndex",
  data() {
    return {
      orders: [],
      moment: moment,
      orderToDelete: '',
    };
  },
  created() {
    this.fetchOrders();
  },
  methods: {
    fetchOrders() {
      axios
        .get("https://codechallenge.pikdrive.com/api/orders")
        .then(({ data }) => {
          this.orders = data.data;
        });
    },
    setOrderToDelete(order) {
      this.orderToDelete = order.orderNumber;
    },
    deleteOrders(order) {
      this.orderToDelete = order.orderNumber;

      axios
        .post("https://codechallenge.pikdrive.com/api/delete-order", {
          id: order.id,
        })
        .then(() => {
          /*
          //Use this if one user is using the system to avoid unnecessary networkcalls 
           this.orders = this.orders.filter(item => item.id != order.id); 
          */
          this.fetchOrders();
        });
    },
  },
};
</script>
<template>
  <div class="col-12 d-flex justify-content-between mt-2">
    <label class="h2">Orders</label>
    <div class="btn-toolbar mb-2 mb-md-0">
      <router-link to="/orders/create" class="btn btn-sm btn-outline-secondary"
        >Create an Order</router-link
      >
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
              <td>
                {{ moment(order.created_at).format("DD-MM-YYYY hh:mm:ss") }}
              </td>
              <td>
                <button
                  type="button"
                  class="btn btn-sm btn-outline-danger"
                  data-bs-toggle="modal"
                  @click="() => setOrderToDelete(order)"
                  data-bs-target="#exampleModal"
                >
                  Delete
                </button>

        <!-- Delete Modal -->
        <div
          class="modal fade"
          id="exampleModal"
          tabindex="-1"
          aria-labelledby="exampleModalLabel"
          aria-hidden="true"
        >
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                  Delete order
                </h5>
                <button
                  type="button"
                  class="btn-close"
                  data-bs-dismiss="modal"
                  aria-label="Close"
                ></button>
              </div>
              <div class="modal-body">
                Are you sure you want to delete order {{ orderToDelete }}?
              </div>
              <div class="modal-footer">
                <button
                  type="button"
                  class="btn btn-secondary"
                  data-bs-dismiss="modal"
                >
                  Cancel
                </button>
                <button
                  type="button"
                  class="btn btn-danger"
                  @click="() => deleteOrders(order)"
                >
                  Delete
                </button>
              </div>
            </div>
          </div>
        </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>
<style></style>
