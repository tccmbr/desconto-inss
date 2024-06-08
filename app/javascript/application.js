// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "./controllers"
import * as bootstrap from "bootstrap"
import "@hotwired/turbo-rails"
import { FetchRequest } from '@rails/request.js'
import Chart from 'chart.js/auto';

document.addEventListener("turbo:load", async function () {
  async function handleEmployeeChart() {
    const ctx = document.getElementById('employees_chart');

    if (!ctx) return;

    const request = new FetchRequest('get', '/reports/employees/contribution_salary_range');
    const response = await request.perform();

    if (response.ok) {
      const body = JSON.parse(await response.text);
      console.log(body);

      new Chart(
        ctx,
        {
          type: 'bar',
          data: {
            labels: body.map(row => row.label),
            datasets: [
              {
                label: 'Total por Faixa Salarial de Contribuição',
                data: body.map(row => row.value)
              }
            ]
          }
        }
      );
    }
  };

  await handleEmployeeChart();

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

  if (documentNumberElement) {
    documentNumberElement.addEventListener('keyup', (e) => e.target.value = cpfMask(e.target.value));
  }

  const salaryElement = document.getElementById('employee_salary');

  if (salaryElement) {
    salaryElement.addEventListener('blur', async function (e) {
      await handleCalculateDiscount(e.target.value);
    });
  };
});
