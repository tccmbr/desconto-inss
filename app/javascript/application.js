// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "./controllers"
import * as bootstrap from "bootstrap"
import "@hotwired/turbo-rails"
import { FetchRequest } from '@rails/request.js'

document.addEventListener("turbo:load", function () {
  function cpfMask(v) {
    v = v.replace(/\D/g, "");
    v = v.replace(/(\d{3})(\d)/, "$1.$2");
    v = v.replace(/(\d{3})(\d)/, "$1.$2");

    v = v.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
    return v;
  }

  async function handleCalculateDiscount(value) {
    const salary = value.length > 0 ? parseFloat(value) : 0;
    if (!salary > 0) return;

    const request = new FetchRequest('post', '/inss/calculators/calculate_discount', { body: JSON.stringify({ salary: value }) });
    const response = await request.perform();

    if (response.ok) {
      const body = JSON.parse(await response.text);
      const inssDiscountElement = document.getElementById('employee_inss_discount');
      inssDiscountElement.setAttribute('value', body.discount);
    }
  };

  const documentNumberElement = document.getElementById('employee_document_number');
  documentNumberElement.addEventListener('keyup', (e) => e.target.value = cpfMask(e.target.value));

  const salaryElement = document.getElementById('employee_salary');

  if (salaryElement) {
    salaryElement.addEventListener('blur', async function (e) {
      await handleCalculateDiscount(e.target.value);
    });
  };
});
