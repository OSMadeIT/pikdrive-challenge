<script>
export default {

}
</script>
<template>
  <div class="container-fluid">
    <div class="row">
      <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
        <div class="position-sticky pt-3">
          <ul class="nav flex-column">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">
                <span data-feather="home"></span>
                Dashboard
              </a>
            </li>
            <li class="nav-item">
                <span data-feather="file"></span>
                <router-link to="/products" class="nav-link">Products</router-link>
            </li>
            <li class="nav-item">
              <span data-feather="users"></span>
              <router-link to="/suppliers" class="nav-link">Suppliers</router-link>
            </li>
            <li class="nav-item">
              <span data-feather="users"></span>
              <router-link to="/product-suppliers" class="nav-link">Product Suppliers</router-link>
            </li>
            <li class="nav-item">
                <span data-feather="file"></span>
                <router-link to="/orders" class="nav-link">Orders</router-link>
            </li>
          </ul>

          <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
            <span>Sales</span>
            <a class="link-secondary" href="#" aria-label="Add a new report">
              <span data-feather="plus-circle"></span>
            </a>
          </h6>
          <ul class="nav flex-column mb-2">
            <li class="nav-item">
              <span data-feather="file-text"></span>
              <router-link to="/sales" class="nav-link">Top Sales</router-link>
            </li>
          </ul>
        </div>
      </nav>
    </div>
  </div>
</template>
<style>

</style>