function fn() {

  var config = {
    baseUrl:    'https://serverest.dev',
    dataHelper: karate.read('classpath:helpers/DataHelper.js')
  }

  return config;
}