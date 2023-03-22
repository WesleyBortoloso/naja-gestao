const zipCodeInput = document.getElementById('address_zip_code');
const streetInput = document.getElementById('address_street');
const neighborhoodInput = document.getElementById('address_neighborhood');
const stateInput = document.getElementById('address_state');
const ibgeCodeInput = document.getElementById('address_ibge_code');
const cityInput = document.getElementById('address_city');
const complementInput = document.getElementById('address_complement');

zipCodeInput.addEventListener('input', function() {
   this.value = this.value.replace(/[^0-9]/g, '').slice(0,8);
   const zipCode = zipCodeInput.value.replace('-', '');
   const apiUrl =  `https://viacep.com.br/ws/${zipCode}/json/`

   if (zipCode.length === 8) {
    fetch(apiUrl)
      .then(response => response.json())
      .then(data => {
        if (data.erro) {
            return;
        }
        streetInput.value = data.logradouro;
        neighborhoodInput.value = data.bairro;
        cityInput.value = data.localidade;
        stateInput.value = data.uf;
        ibgeCodeInput.value = data.ibge;
        complementInput.value = data.complemento;
      });
   }
});