import orders from './components/orders/routes';
import suppliers from './components/suppliers/routes';
import topsales from './components/top-sales/routes';

export default [
  ...orders,
  ...suppliers,
  ...topsales,
];